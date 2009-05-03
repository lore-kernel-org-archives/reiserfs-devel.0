From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Subject: RE: Problem with reiserfs volume
Date: Sat, 2 May 2009 20:58:40 -0500
Message-ID: <20090503015844648.PNBZ22077@cdptpa-omta02.mail.rr.com>
References: <49F94983.7040201@fatooh.org>
Reply-To: <lrhorer@satx.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49F94983.7040201@fatooh.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

> >> No, I did a fair bit of additional investigation, and the symptoms were
> >> fairly odd.  When a halt would occur, all writes at every level would
> fall
> >> to dead zero.  The reads at the array level would fall to zero on 5 of
> the
> >> 10 drives, while the other 5 would report a very low level of read
> >> activity,
> >> but not zero.
> >
> > Oops!  I'm sorry.  I mis-typed the sentences just above.  What I meant
> to
> > say was the write activity at both the array and drive level fell to
> zero.
> > The read activity at the array level also fell to zero, but at the drive
> > level 5 of the drives would still show activity.
> 
> Are you sure the read activity for the array was 0?

Yep.  According to iostat, absolute zilch.

> If the array wasn't
> doing anything but the individual drives were, that would indicate a
> lower-level problem than the filesystem;

It could, yes.  In fact, it is not unlikely to be and interaction failure
between the file system and the RAID device management system (/dev/md0, or
whatever).

> unless I'm missing something,
> the filesystem can't do anything to the individual drives without it
> showing up as read/write from/to the array device.

I don't know if that's true or not.  Certainly if the FS is RAID aware, it
can query the RAID system for details about the array and its member
elements (XFS, for example does just this in order to automatically set up
stripe width dur8ing format).  There's nothing to prevent the FS from
issuing command directly to the drive management system (/dev/sda, /dev/sdb,
etc.).


> Aside from that, everything you're written seems to be consistent with
> my hypothesis that you had a bitmap caching problem. Or maybe I'm just
> falling prey to confirmation bias.
> 
> Did you ever test with dstat and debugreiserfs like I mentioned earlier
> in this thread?

Yes to the first and no to the second.  I must have missed the reference in
all the correspondence.  'Sorry about that.

> >> It would always be the same 5 drives which dropped to zero
> >> and the same 5 which still reported some reads going on.
> 
> I did the math and (if a couple reasonable assumptions I made are
> correct), then the reiserfs bitmaps would indeed be distributed among
> five of 10 drives in a RAID-6.
> 
> If you're interested, ask, and I'll write it up.

It's academic, but I'm curious.  Why would the default parameters have
failed?

> >> Note if a RAID
> >> resync was occurring, then all 10 drives would continue to report
> >> significant read rates at the drive level, but array level read /
> writes
> >> would stop altogether.  The likelihood of a halt event was fairly low
> if
> >> there was no drive activity, and increased as the level of drive
> activity
> >> (read or write) increased.  During a RAID resync, almost every file
> create
> >> causes a halt.
> 
> Perhaps because the resync I/O caused the bitmap data to fall off the
> page cache.

How would that happen?  More to the point, how would it happen without
triggering activity in the FS?

> >> After exhausting all my abilities to troubleshoot the
> >> issue,
> >> I finally erased the entire array and reformatted it as XFS.  I am
> still
> >> transferring the data from the backup to the RAID array, but with over
> 30%
> >> of the data transferred and over 10,000 files created in the last
> several
> >> days, I have not been able to trigger a halt event.  What's more, my
> file
> >> delete performance for large files was very poor under Reiserfs.  A 20G
> >> file
> >> could take upwards of 30 seconds to delete, although deleting a file
> never
> >> caused a file system halt like creating a file did.  Under the new file
> >> system, deleting a 20G file takes typically 0.1 seconds or less.
> 
> I remember being annoyed by large file deletion performance before, but
> I can't reproduce it right now (with kernel 2.6.28.2).

Certainly I'm not having the problem, now.  With more than half the data (3T
out of 5.8T) transferred, I haven't had a single halt and deleting a 23G
file takes less than 0.9 seconds, where before it took up to 30 seconds.


