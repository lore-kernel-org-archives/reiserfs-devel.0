From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 13:31:40 -0500
Message-ID: <44F4880C.3050507@slaphack.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <44F322A6.9020200@namesys.com> <20060828173721.GA11332@hello-penguin.com> <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net> <20060829045937.GA9181@localhost.hsdv.com> <op.te1sixuycigqcu@apollo13> <20060829143814.GA21868@hello-penguin.com> <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F47FEB.9060005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: PFC <lists@peufeu.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hans Reiser wrote:

> PFC wrote:

>>     A big ass RAID will not get much benefit unless :
>>     - the buffer cache stores compressed pages, so compression
>> virtually doubles the RAM cache
>>     - or the CPU is really fast
>>     - or you put one of these neat FPGA modules in a free Opteron
>> socket and upload a soft-hardware LZF in it with a few gigabytes/s
>> throughput
> Or you look the sysadmin in the eyes, and say, your file servers have
> more out of disk space problems than load problems, yes?

I'd look at the IO-Wait number, also.

Compression makes sense if:
   - You spend a lot of time waiting for the disk.
   - You need disk space, and either:
      - You already have enough spare CPU to do compression
      - It's cheaper to buy enough CPU than to buy the space compression 
would save you.

Conversely, compression does NOT make sense if:
   - You spend a lot of time with the CPU busy and the disk idle.
   - You have more than enough disk space.
   - Disk space is cheaper than buying enough CPU to handle compression.
   - You've tried compression, and the CPU requirements slowed you more 
than you saved in disk access.

After a certain amount of RAID -- really, after the second or third disk 
in a mirrored array, or the third or fourth disk in RAID 5 -- at that 
point, I don't think adding more disks is really doing a huge amount to 
increase reliability, which means you're either trying to increase speed 
or space.  You can increase both of these by using compression, if you 
have the spare CPU, so the question becomes:  Does the CPU power 
necessary to do the compression cost more or less than another drive?

Especially in a big-ass RAID, you'll also want to be thinking about heat 
and power consumption, too.

There are still cases where compression loses, but they seem 
pathological enough that you'd want to benchmark to see if they really 
apply to you.  For instance, if you're dealing with lots of quick, 
read-only access to very tiny amounts of data, compression will likely 
slow you down, whereas adding another disk can speed you up.  If your 
data isn't very compressible, then you're just burning cycles for no 
point.  And, of course, the price/performance ratio (CPUs) and price/gig 
ratio (disk space) changes all the time.

And all of this is ignoring the very real possibility of a dedicated 
hardware compressor -- at which point, we could afford pretty much any 
algorithm you like, as long as the hardware can do it quickly enough. 
This is an advantage to using cryptoapi for the cryptocompress plugin, 
by the way -- it's one place where we could call out to the hardware later.
