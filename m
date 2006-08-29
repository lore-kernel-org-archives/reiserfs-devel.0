From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 14:11:06 -0500
Message-ID: <44F4914A.1010005@slaphack.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	 <20060828173721.GA11332@hello-penguin.com>	 <44F332D6.6040209@namesys.com>	 <1156801705.2969.6.camel@nigel.suspend2.net>	 <20060829045937.GA9181@localhost.hsdv.com>	 <op.te1sixuycigqcu@apollo13>	 <20060829143814.GA21868@hello-penguin.com>	 <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com>	 <44F4880C.3050507@slaphack.com> <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29743-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, PFC <lists@peufeu.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Gregory Maxwell wrote:
> On 8/29/06, David Masover <ninja@slaphack.com> wrote:
> [snip]
>> Conversely, compression does NOT make sense if:
>>    - You spend a lot of time with the CPU busy and the disk idle.
>>    - You have more than enough disk space.
>>    - Disk space is cheaper than buying enough CPU to handle compression.
>>    - You've tried compression, and the CPU requirements slowed you more
>> than you saved in disk access.
> [snip]
> 
> It's also not always this simple ... if you have a single threaded
> workload that doesn't overlap CPU and disk well, (de)compression may
> be free even if you're still CPU bound a lot as the compression is
> using cpu cycles which would have been otherwise idle..

Isn't that implied, though -- if the CPU is not busy (run top under a 
2.6 kernel and you'll see an IO-Wait number), then the first condition 
isn't satisfied -- CPU is not busy, disk is not idle.

But speaking of single threadedness, more and more desktops are shipping 
with ridiculously more power than people need.  Even a gamer really 
won't benefit that much from having a dual-core system, because 
multithreading is hard, and games haven't been doing it properly.  John 
Carmack is pretty much the only superstar programmer in video games, and 
after his first fairly massive attempt to make Quake 3 have two threads 
(since he'd just gotten a dual-core machine to play with) actually 
resulted in the game running some 30-40% slower than it did with a 
single thread.

So, for the desktop, compression makes perfect sense.  We don't have 
massive amounts of RAID.  If we have newer machines, there's a good 
chance we'll have one CPU sitting mostly idle while playing games. 
Short of gaming, there are few desktop applications that will fully 
utilize even one reasonably fast CPU.  The reason gamers buy dual-core 
systems is they're getting cheap enough to be worth it, and that one 
core sitting idle is a perfect place to do OS/system work not related to 
the game -- antivirus, automatic update checks, the inevitable 
background processes leeching a couple few % off your available CPU.

So for the typical new desktop with about 2 ghz of 64-bit processor 
sitting idle, compression is essentially free.
