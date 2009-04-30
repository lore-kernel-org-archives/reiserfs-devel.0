From: Corey Hickey <bugfood-ml@fatooh.org>
Subject: Re: Problem with reiserfs volume
Date: Wed, 29 Apr 2009 23:47:31 -0700
Message-ID: <49F94983.7040201@fatooh.org>
References: <20090429000000261.UWUU2063@cdptpa-omta04.mail.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=Z7YE0QP32C+l
	YJoiM/ny2BuNcUs=; b=MfSYbEclHrs403h4qmKgrcsEurlmZ9vB/nZ1n1aOTeg4
	rkan08TdPgVvMekkh0ir9Mho7N3C7oZox+wZh9D0sRgGNGCDeCjAhY5NBYfaXSaF
	VzK06/2uGvaNA6v9SuLPmUlgjHBbLhtkkqkeLiNASG2pY3CcEt2ov13KXhX+/hQ=
In-Reply-To: <20090429000000261.UWUU2063@cdptpa-omta04.mail.rr.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lrhorer@satx.rr.com, reiserfs-devel@vger.kernel.org

Leslie Rhorer wrote:
>>> The gist of the issue, apparently, was that writing files would cause
>>> those files to be cached and the kernel would drop reiserfs bitmap data
>>> to make room in the page cache. Once those bitmaps were dropped from the
>>> cache and another file needed to be written, many bitmaps needed to be
>>> read back from the disk in order to find free space. The bitmaps are
>>> small, but spaced every 128 MB, so very many seeks were needed and the
>>> read speed was quite slow.
>>>
>>> All that seeking caused the disk to buzz distinctively. Try listening
>>> for that, or looking at the disk read/write activity with something like
>>> dstat.
>> No, I did a fair bit of additional investigation, and the symptoms were
>> fairly odd.  When a halt would occur, all writes at every level would fall
>> to dead zero.  The reads at the array level would fall to zero on 5 of the
>> 10 drives, while the other 5 would report a very low level of read
>> activity,
>> but not zero.
> 
> Oops!  I'm sorry.  I mis-typed the sentences just above.  What I meant to
> say was the write activity at both the array and drive level fell to zero.
> The read activity at the array level also fell to zero, but at the drive
> level 5 of the drives would still show activity.

Are you sure the read activity for the array was 0? If the array wasn't
doing anything but the individual drives were, that would indicate a
lower-level problem than the filesystem; unless I'm missing something,
the filesystem can't do anything to the individual drives without it
showing up as read/write from/to the array device.

Aside from that, everything you're written seems to be consistent with
my hypothesis that you had a bitmap caching problem. Or maybe I'm just
falling prey to confirmation bias.

Did you ever test with dstat and debugreiserfs like I mentioned earlier
in this thread?

>> It would always be the same 5 drives which dropped to zero
>> and the same 5 which still reported some reads going on. 

I did the math and (if a couple reasonable assumptions I made are
correct), then the reiserfs bitmaps would indeed be distributed among
five of 10 drives in a RAID-6.

If you're interested, ask, and I'll write it up.

>> Note if a RAID
>> resync was occurring, then all 10 drives would continue to report
>> significant read rates at the drive level, but array level read / writes
>> would stop altogether.  The likelihood of a halt event was fairly low if
>> there was no drive activity, and increased as the level of drive activity
>> (read or write) increased.  During a RAID resync, almost every file create
>> causes a halt. 

Perhaps because the resync I/O caused the bitmap data to fall off the
page cache.

>> After exhausting all my abilities to troubleshoot the
>> issue,
>> I finally erased the entire array and reformatted it as XFS.  I am still
>> transferring the data from the backup to the RAID array, but with over 30%
>> of the data transferred and over 10,000 files created in the last several
>> days, I have not been able to trigger a halt event.  What's more, my file
>> delete performance for large files was very poor under Reiserfs.  A 20G
>> file
>> could take upwards of 30 seconds to delete, although deleting a file never
>> caused a file system halt like creating a file did.  Under the new file
>> system, deleting a 20G file takes typically 0.1 seconds or less.

I remember being annoyed by large file deletion performance before, but
I can't reproduce it right now (with kernel 2.6.28.2).

In any case, I've switched my large filesystem to ext4, so far without
any regrets. My remaining filesystems are mostly still reiserfs, and
I'll eventually migrate them, but I'm in no hurry.

-Corey
