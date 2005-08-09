From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 performance
Date: Mon, 08 Aug 2005 20:02:02 -0500
Message-ID: <42F8008A.6000300@slaphack.com>
References: <dd7cbn$kbg$1@sea.gmane.org>	 <200508081409.03814.rmeijer@internet.gr> <42F7B8F4.80101@slaphack.com>	 <42F7D77E.5080108@namesys.com> <42F7F28B.7010602@slaphack.com> <b14e81f0050808171622aeb433@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050808171622aeb433@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: michael chang <thenewme91@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

michael chang wrote:
> On 8/8/05, David Masover <ninja@slaphack.com> wrote:
> 
>>Hans Reiser wrote:
>>
>>>David Masover wrote:
>>>
>>>>Raymond A. Meijer wrote:
>>>>
>>>>>On Monday 8 August 2005 13:32, Hemiplegic Menehune wrote:
>>>>>
>>>>>>Its already as stable as any other fs on my systems and recovers
>>>>>>better than most when my battery runs out. Any idea when it will make
>>>>>>it into the stable 2.6 kernel?
>>>>>
>>>>>If only it had a resizer :(
>>>>
>>>>Resizer isn't such a big deal.  I can usually find enough backup for
>>>>enough of what I want, and I usually get sizes right the first time.
> 
> 
> I want a resizer (or at least a converter so I can convert to
> ResierFS, resize, and reconvert back) because I have a dual-boot WinXP
> and Linux/ReiserFS 3.6 system, which I really want to convert to
> Reiser4.

That's about my situation.

> I don't mind putting XP on a FAT partition so I can squeeze

Dear God, no!  Learn to use ntfsresize.  It doesn't even require that 
you defragment first -- it will defragment an NTFS partition in order to 
shrink it, then set a flag that tells Windows to run its equivalent of 
fsck on the next boot.

The only reason for using VFAT would be if you have a lot of large files 
shared between Windows/Linux -- Captive is slow.  But I'd rather have a 
fast Windows and a slow (mostly unused) Captive any day.

> it as much as necessary, but only if I can resize my Resier4 partition
> as necessary (I don't mind putting at the top of my HD though, atm...)

I eventually figured out how to resize stuff properly.  But, what I'd 
like to be able to do is grow any partition both ways.  I don't care so 
much about ntfsresize, since I keep my Windows partition near the front 
of the disk (to boost the speed of Windows -- for Linux, I have Reiser), 
but I'd like to be able to move the beginning of the FS -- either 
backwards, to grab unused Windows space, or forwards, to give space back 
to Windows.

But, without that, there's always LVM.  It will fragment your partition, 
at a level below the FS, but it will let you grow and shrink stuff any 
way you like, including onto new devices.  But I don't do that, because 
I doubt I'm wrong about how much each will grow, and I like performance 
and software RAID, neither of which is easy with LVM.

And, of course, there's a ludicrously long and dangerous route -- create 
two dm_linear devices that overlap, dd from one to the other to move an 
FS backwards, then grow it once it's on the second device.  If only the 
Device-Mapper modules were documented!

>>>>What I want is the repacker, beacuse performance does steadily degrade
>>>>on my Reiser4 systems, eventually getting worse than Reiser3,
>>>
>>>I am skeptical that it gets worse than V3, unless it is because we
>>>haven't put in all the bitmap optimizations we did for V3.  I wish I
>>>knew how to measure it.....
>>
>>Me too.  It's fairly subjective on my part, so maybe not.  After all,
> 
> 
> Is there a way to count the number of jumps in a file, and the
> distance of those jumps when reading a file?  Could the sum or product
> of these be some sort of measure of performance (provided that putting
> part of a file at the beginning and another part at the end of a disk
> don't actually improve performance in some twisted way due to using
> different heads simultaneously or something)?

Yeah, that'd be a bit unreliable.  Even on desktop machines, we're 
getting something called NCQ, meaning the really severely fragmented 
files won't be quite as slow as you'd predict.  Also, aside from the 
different heads, there's a striped RAID -- also within reach of a 
desktop power user like myself.

