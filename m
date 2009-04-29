From: "Leslie Rhorer" <lrhorer@satx.rr.com>
Subject: RE: Problem with reiserfs volume
Date: Tue, 28 Apr 2009 19:00:04 -0500
Message-ID: <20090429000000261.UWUU2063@cdptpa-omta04.mail.rr.com>
References: <20090428235321877.WFLQ6143@cdptpa-omta03.mail.rr.com>
Reply-To: <lrhorer@satx.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090428235321877.WFLQ6143@cdptpa-omta03.mail.rr.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org



> > The gist of the issue, apparently, was that writing files would cause
> > those files to be cached and the kernel would drop reiserfs bitmap data
> > to make room in the page cache. Once those bitmaps were dropped from the
> > cache and another file needed to be written, many bitmaps needed to be
> > read back from the disk in order to find free space. The bitmaps are
> > small, but spaced every 128 MB, so very many seeks were needed and the
> > read speed was quite slow.
> >
> > All that seeking caused the disk to buzz distinctively. Try listening
> > for that, or looking at the disk read/write activity with something like
> > dstat.
> 
> No, I did a fair bit of additional investigation, and the symptoms were
> fairly odd.  When a halt would occur, all writes at every level would fall
> to dead zero.  The reads at the array level would fall to zero on 5 of the
> 10 drives, while the other 5 would report a very low level of read
> activity,
> but not zero.

Oops!  I'm sorry.  I mis-typed the sentences just above.  What I meant to
say was the write activity at both the array and drive level fell to zero.
The read activity at the array level also fell to zero, but at the drive
level 5 of the drives would still show activity.

> It would always be the same 5 drives which dropped to zero
> and the same 5 which still reported some reads going on.  Note if a RAID
> resync was occurring, then all 10 drives would continue to report
> significant read rates at the drive level, but array level read / writes
> would stop altogether.  The likelihood of a halt event was fairly low if
> there was no drive activity, and increased as the level of drive activity
> (read or write) increased.  During a RAID resync, almost every file create
> causes a halt.  After exhausting all my abilities to troubleshoot the
> issue,
> I finally erased the entire array and reformatted it as XFS.  I am still
> transferring the data from the backup to the RAID array, but with over 30%
> of the data transferred and over 10,000 files created in the last several
> days, I have not been able to trigger a halt event.  What's more, my file
> delete performance for large files was very poor under Reiserfs.  A 20G
> file
> could take upwards of 30 seconds to delete, although deleting a file never
> caused a file system halt like creating a file did.  Under the new file
> system, deleting a 20G file takes typically 0.1 seconds or less.
> 
> This definitely suggests there may be a problem with Reiserfs.  The only
> things which changed from the last array to this one were the physical
> drive
> locations in the array (I had swapped drives around to try to pinpoint the
> issue), a Version 1.2 Superblock in the new array vs. 0.9 in the old
> array,
> and a 256K chunk size rather than the default 64K to improve performance.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

