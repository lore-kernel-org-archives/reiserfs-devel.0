From: Jim Miller <jimm@simutronics.com>
Subject: Need Warm Fuzzies, ReiserFS (3)
Date: Sun, 19 Dec 2004 23:41:41 -0600
Message-ID: <41C66615.5010206@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi everyone,

I have recently been burned by the XFS file system -- After a recent 
system crash/hang we experienced a lot of file corruption and needed to 
restore from a backup that was ~12hrs old.  It seems that XFS keeps a 
lot of journal info in memory and a sudden system crash (hang) prevents 
it from writing out the journal. 

We run a few game servers that have a large number of large and small 
files that are actively accessed (and restoring from a backup 12hrs old 
made a lot of our gamers very unhappy).  We were running EXT3 (which in 
the past recovered nicely from hangs/crashes) but performance was so bad 
we needed a new FS so 6mos ago a decision was made to go with XFS. 
I would like to switch to ReiserFS (v3) (I understand Reiser4 isn't 
quite ready for production use) and was hoping to get the warm fuzzies 
about making this decision.  I know it's much faster than ext3 but at 
this point I need to feel good about it's ability to recover from a 
sudden system hang/crash/reset.


Thanks,
Jim








