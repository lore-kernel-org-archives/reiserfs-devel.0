From: berthiaume_wayne@emc.com
Subject: RE: reiserfsprogs 3.6.5-pre2 release.
Date: Tue, 25 Feb 2003 11:25:06 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C071E@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vitaly@namesys.com
Cc: reiserfs-list@namesys.com

	Vitaly, how does "check-followed-by-fixable" in 3.6.3 compare to
"-a" at boot in 3.6.5? 
Regards,
Wayne.

-----Original Message-----
From: Vitaly Fertman [mailto:vitaly@namesys.com]
Sent: Tuesday, February 25, 2003 8:50 AM
To: reiserfs-list@namesys.com
Subject: reiserfsprogs 3.6.5-pre2 release.



Hi all!

this new pre-release includes:

- a critical bug on pass0 of rebuild-tree with overflowing while checking 
unformatted item offsets was fixed.
- a bug in relocation of shared object id - entry key sometimes does not 
get updated correctly with the new key - was fixed.
- a bug in bitops operations for be mashins was fixed. 
- a bug with the superblock overwriting during replaying was fixed.

- while openning the journal check that journal parameters in the superblock

and in the journal header mathches; advice to run rebuild-sb if not. While 
rebuilding the superblock, do the same check and ask the user if he wants to

rebuild the journal header or continue w/out the journal or he wants to
change 
the start of the partition before using reiserfsck.
- check that all not valid bits of the bitmap are set to 1, set it
correctly. 

- fix-fixable does not relocate shared object ids anymore, as it is too
complex 
for fix-fixable and only rebuild-tree does.

- reiserfsck -a (started at boot) replays journal, checks error flags in 
the superblock, bitmaps, fs size, 2 levels of internal tree and switches 
to fixble mode if any problem is detected. For root fs fixable cannot be 
performed (as fs is mounted) and just --check will be done.

- Journal replay was improved a) check blocks if they could be journable 
before replaying; b) replay only transactions which has trans_id == last 
replayed transaction trans_id + 1.

- warning messages were improved.

-- 

Thanks,
Vitaly Fertman
