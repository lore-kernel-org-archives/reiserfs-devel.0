From: Mike Hodson <mike@mystica.cx>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 11 Feb 2003 19:02:21 -0600
Message-ID: <20030211171139.A5B3.MIKE@mystica.cx>
References: <20030211144144.A5A9.MIKE@mystica.cx> <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adam Goryachev <mailinglists@websitemanagers.com.au>
Cc: reiserfs-list@namesys.com

> I can't comment on your experience, but personally if I have a drive with
> any number of badblocks (which are showing up to the fs layer, not invisibly
> re-mapped by the drive) then I take the drive back and get a replacement, or
> bin the drive.
I'd have liked to do that, but 2 problems. 1, the drive was an OEM drive,
and the reseller I bought it from went out of business- Western Digital
wouldn't accept an RMA directly from an end-user on that drive. and 2, I
didn't even notice errors until one day it wouldnt work properly. At
that time I thought it was a reiserfs inconstancy, and I fscked. at that
point I noticed a few {DriveReady -SeekComplete} errors and then most of
the data on the drive nulled itself out.

> I suppose that if you continue to have a growing number of FS errors, then
> you either have faulty hardware, or are using a buggy version of
> software.... If you already admit to badblocks, then I would blame
> hardware..
The case I outlined at the beginning of my message involved 2 specific
drives. The drive that completely failed was a WD 6.4 gig. The 20gig was
a Maxtor that I've had for 2.5 years, that to my knowledge does not have
media errors, but there have been some FS corruptions. I don't think its
media since I never see any 'DriveReady-seekcomplete' errors that you
usually get with bad sectors.

> Hmmm, so apart from finding a number of errors and doing it's best to fix
> them (putting them into lost+found) and recovering all of your other files
> even with hardware issues present, you recovered all of your data? The
> problem here is?
The fact that the filesystem got so many errors in the first place. And
as ive said, hardware issues are AFAIK not the cause.

If a harddrive is showing badblocks and then the disk vendors tool shows no
errors, I think a simple dd over the whole disk or similar would really show
the true story....
If i haven't made myself clear, the badblocks problem was with a
different drive.  The thought occured to me that there may have been bad
blocks due to the sporadic corruption, but I don't have any error
messages to back up that thought.

> ext2 requires periodic fsck's which are also rather dis-concerting when you
> are never quite sure whether you need to allow a few hours downtime for a
> kernel upgrade this time, or perhaps it is only a few minutes.

Well one way of being completely sure is to reset the mount count in the
filesystem before rebooting, or to set the fstab to never automatically
fsck. then on some set  schedule, fsck along with a kernel upgrade, and
schedule the downtime

> Finally, I find it interesting to see people who swear they will never use
> reiserfs again to be on the reiserfs mailing list :).
I may use it at some point, when its as well proven as the second
extended filesystem is currently. Its interesting to see how many people
have errors, and when that number gets lower and more people start
posting good things I may reevaluate it at some point :)

Mike

-- 
Mike Hodson  <mike@mystica.cx>  ICQ: 18145059

