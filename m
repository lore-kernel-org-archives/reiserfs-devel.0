From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Need Warm Fuzzies, ReiserFS (3)
Date: Mon, 20 Dec 2004 13:31:25 +0100
Message-ID: <200412201331.25180.christian.mayrhuber@gmx.net>
References: <41C66615.5010206@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41C66615.5010206@simutronics.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 20 December 2004 06:41, Jim Miller wrote:
> Hi everyone,
> 
> I have recently been burned by the XFS file system -- After a recent 
> system crash/hang we experienced a lot of file corruption and needed to 
> restore from a backup that was ~12hrs old.  It seems that XFS keeps a 
> lot of journal info in memory and a sudden system crash (hang) prevents 
> it from writing out the journal. 
> 
> We run a few game servers that have a large number of large and small 
> files that are actively accessed (and restoring from a backup 12hrs old 
> made a lot of our gamers very unhappy).  We were running EXT3 (which in 
> the past recovered nicely from hangs/crashes) but performance was so bad 
> we needed a new FS so 6mos ago a decision was made to go with XFS. 
> I would like to switch to ReiserFS (v3) (I understand Reiser4 isn't 
> quite ready for production use) and was hoping to get the warm fuzzies 
> about making this decision.  I know it's much faster than ext3 but at 
> this point I need to feel good about it's ability to recover from a 
> sudden system hang/crash/reset.
> 
> 
> Thanks,
> Jim

My experience of Reiserfs recovery is good. I had once a HW RAID5 array
with a defective controller unable to detect harddisk errors. Though two
of the five disks failed I was able to recover around 80% of the mail
folders.

However, there were cases on this list where reiserfsck had problems and
namesys needed a metadata dump to fix reiserfsck. I guess most problems
it had are fixed now. Note: always use the newest reiserfsck version from 
namesys :-)

If you need good performance and data integrity I'd go with the following
mount options for drives at controllers
1) with battery backup: rw,noatime,nodiratime,notail
2) without battery backup: rw,noatime,nodiratime,notail,barrier=flush
and a 2.6.9 kernel.

The barrier mount option should provide protection against a corrupted
journal during power failure for drives with write caching enabled.
(Mostly IDE)

-- 
lg, Chris

