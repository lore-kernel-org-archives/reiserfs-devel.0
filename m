From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs-3.6.9 release
Date: Wed, 16 Jul 2003 21:03:29 +0400
Message-ID: <200307162103.29531.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi all, 

the new reiserfsprogs release is available on our ftp site (ftp.namesys.com).

This release includes:
- objectid handling was improved, significant speedup at pass0 and
semantic/lost+found rebuild passes (was in last pre releases for some time);
- improved leaves recovery on pass0 of rebuild-tree;
- exit codes of reiserfsck were fixed;
- reiserfsck --yes option was added
- mkreiserfs --quiet option was added;
- fsck check on boot avoids another bitmap reading on the following mount;
- credits were fixed.

Some bugs were fixed:
- fsck proceeds for the standard journal when wrong journal parameters in the 
  journal header detected, fixing them with the warning;
- a bug in journal replaying code when the only transaction exists was fixed;
- a few not standard journal related bugs in mkreiserfs and reiserfstune were 
fixed;
- a pair of bugs in rebuild-sb were fixed;

-- 
Thanks,
Vitaly Fertman
