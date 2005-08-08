From: Hans Reiser <reiser@namesys.com>
Subject: Re: recovering from "rm -rf"
Date: Sun, 07 Aug 2005 23:05:03 -0700
Message-ID: <42F6F60F.4090101@namesys.com>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com> <42F3C73B.9040808@slaphack.com> <b14e81f0050805135739c94933@mail.gmail.com> <42F3D760.7090008@slaphack.com> <op.su10y3q7th1vuj@localhost> <42F3E7F1.1030205@slaphack.com> <42F3EF37.3090705@edsons.demon.nl> <42F3F4A4.2050505@slaphack.com> <42F468CD.9070709@namesys.com> <42F55078.2030204@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F55078.2030204@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Rudy Zijlstra <rudy@edsons.demon.nl>, PFC <lists@boutiquenumerique.com>, michael chang <thenewme91@gmail.com>, reiserfs-list@namesys.com

David Masover wrote:

>Hans Reiser wrote:
>  
>
>>David Masover wrote:
>>
>>
>>    
>>
>>>I'm not sure yet how much I'm willing to pay.  If the Namesys people can
>>>help me out, there will certainly be a donation headed their way,
>>>
>>>      
>>>
>>Nah, for you it is no charge, you have done a lot for us.
>>    
>>
>
>What exactly have I done?  I haven't contributed a single line of code,
>just ranted on the mailing list for you.
>  
>
That's worth more than you might think....

>I appreciate it, but I think I will pay you anyway.  $25 for a question
>very well answered, and my mother says she'll match it -- which is still
>nowhere near what I'd have had to pay to get the other hard drive
>repaired.  Does that WorldPay link work?
>  
>
Sure.  Thanks.

>  
>
>>Did you try
>>what Vitaly advised yet?
>>    
>>
>
>Yes, it seems to have worked.  I seem to have all my important files,
>except one album of music and the last few episodes of anime -- and I'm
>still going through lost+found.  That's really not much of a loss.
>
>By the way, I also discovered a nice trick to avoid making a full disk
>backup.  I had a 500 gig RAID array that I was trying to rescue, and the
>biggest spare disk I had available was 80 gigs.  So, I used dm_snapshot
>to create a writable snapshot, using a loopback file on the 80 gig drive
>as the COW device.  I did the fsck on the snapshot, then wrote the
>snapshot back to the original device (dd if=snapshot of=orig_device)
>once I was sure it worked.  If it hadn't worked, I could have simply
>removed the snapshot (dmsetup remove snapshot).
>
>The COW file was a 60 gig sparse file that ended up using only 2 gigs or
>so on disk after the fsck.
>
>Be warned, though, that dm_snapshot isn't quite like LVM snapshots, and
>only LVM snapshots are documented, while only dm_snapshot will work for
>this.  I had to read the source.
>
>
>
>  
>

