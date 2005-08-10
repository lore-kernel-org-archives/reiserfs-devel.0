From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 performance
Date: Tue, 09 Aug 2005 20:23:50 -0500
Message-ID: <42F95726.8040109@slaphack.com>
References: <dd7cbn$kbg$1@sea.gmane.org>	 <200508081409.03814.rmeijer@internet.gr> <42F7B8F4.80101@slaphack.com>	 <42F7D77E.5080108@namesys.com> <42F7F28B.7010602@slaphack.com>	 <b14e81f0050808171622aeb433@mail.gmail.com>	 <42F8008A.6000300@slaphack.com> <b14e81f0050809105257e10358@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050809105257e10358@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: michael chang <thenewme91@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

michael chang wrote:
> On 8/8/05, David Masover <ninja@slaphack.com> wrote:
> 
>>michael chang wrote:
>>
>>>On 8/8/05, David Masover <ninja@slaphack.com> wrote:
>>>
>>>
>>>>Hans Reiser wrote:
>>>>
>>>>
>>>>>David Masover wrote:
>>>>>
>>>>>
>>>>>>Raymond A. Meijer wrote:
>>>>>>
>>>>>>
>>>>>>>On Monday 8 August 2005 13:32, Hemiplegic Menehune wrote:
>>>>>>>
>>>>>>>
>>>>>>>>Its already as stable as any other fs on my systems and recovers
>>>>>>>>better than most when my battery runs out. Any idea when it will make
>>>>>>>>it into the stable 2.6 kernel?
>>>>>>>
>>>>>>>If only it had a resizer :(
>>>>>>
>>>>>>Resizer isn't such a big deal.  I can usually find enough backup for
>>>>>>enough of what I want, and I usually get sizes right the first time.
>>>
>>>
>>>I want a resizer (or at least a converter so I can convert to
>>>ResierFS, resize, and reconvert back) because I have a dual-boot WinXP
>>>and Linux/ReiserFS 3.6 system, which I really want to convert to
>>>Reiser4.
>>
>>That's about my situation.
>>
>>
>>>I don't mind putting XP on a FAT partition so I can squeeze
>>
>>Dear God, no!  Learn to use ntfsresize.  It doesn't even require that
>>you defragment first -- it will defragment an NTFS partition in order to
>>shrink it, then set a flag that tells Windows to run its equivalent of
>>fsck on the next boot.
> 
> 
> But the start of a NTFS parition is fixed.  So is that of ResierFS
> 3.6, in parted.  Besides, when my hard drive is 99% full and all the
> files that need to be defragmented are in the MFT area, I really think
> FAT is saner.  I had that happen to me before.  Honest.

Wait, are you saying the start of a FAT partition will move?

>>I eventually figured out how to resize stuff properly.  But, what I'd
>>like to be able to do is grow any partition both ways.  I don't care so
>>much about ntfsresize, since I keep my Windows partition near the front
>>of the disk (to boost the speed of Windows -- for Linux, I have Reiser),
> 
> 
> Obviously, you and I have different opinions to solve the same
> problem.  Since I try and squeeze around 17 GBs or so of stuff on 2
> partitions on a 20 GB disk, then I have loads of problems.  At this
> rate, I'm going to put /boot on a ext2 partition at the top, then put
> in a Reiser4 partition, then my FAT windows partition.
> 
> FAT seems to defragment easier than NTFS when full.  Emphasis on the
> full bit.  My partitions are always full, never empty.  No time.  Why?
>  Because I don't have a CD/DVD burner to offload stuff.  That's why.

It's probably not polite to say this, but CD/DVD burners are quite cheap 
these days, as is storage in general.  For something like $120 each, I 
got a pair of 250 gig hard drives.  DVD burners are more like $50, plus 
$20 gets you 100 blank write-once single-layer DVDs.

And you do know about the 75% rule, right?

>>but I'd like to be able to move the beginning of the FS -- either
>>backwards, to grab unused Windows space, or forwards, to give space back
>>to Windows.
> 
> 
> I used to do this.  Then I found that Ext2 and ResierFS's beginnings
> won't budge.  So I just tacked my FAT partition at the end.  Who needs
> Windows anyways?  At the rate it was going, there wouldn't have been a
> performance gain putting it at the beginning.  I spend most of my time
> in Linux.

This also makes me think you're saying FAT resizes both ways...

>>different heads, there's a striped RAID -- also within reach of a
>>desktop power user like myself.
> 
> 
> Striped RAID only works if you have multiple disks and a decent bus. 
> I'm stuck on the lowest-end Dell Dimension 3000, with one of the
> slowest hard drives in history.  And I haven't gotten around to
> opening the case... yet.
> 
> Every consumer has different values, and different approaches.  Some
> are still as stubborn as a mule, and you have to accomidate for them,
> or lose them.

I don't work here, but believe me, they are trying.  It seems they are 
still trying to get in the mainstream kernel, which means dealing with 
lots of stubborn people...
