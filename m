From: Vitaly Fertman <vitaly@namesys.com>
Subject: Anticipating the reiserfsprogs-3.6.12 release.
Date: Thu, 29 Jan 2004 13:41:49 +0300
Message-ID: <200401291341.49302.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

the new reiserfsprogs release is coming up and all extra tests
of the current code are appreciated.

3.6.12-pre1 release includes:

* bad block support, documentation is available at 
http://www.namesys.com/bad-block-handling.html

*reiserfsck is able to repair ro mounted filesystems.

* a few bugs were fixed:
  - fix for shrinking the filesystem;
  - fix for making the filesystem with blocksize greater then 4k;
  - fix for making the journal of minimal size.

3.6.12-pre2 release includes:

* Reboot is needed code is added.
* A bug in reiserfsck --rebuild-sb was fixed.

3.6.12-pre3 release includes:

* UUID support is rewritten -- link to the libuuid instead of our 
own code.

* a few bugs were fixed:
 - mount entry detection code is fixed;
 - calculate the new fs size in resizer correctly; 
 - parse new size parameter correctly;
 - checks for the new fs size valideness were fixed;
 - handle correctly the very last block if formatted on the fs on 
 pass2.

-- 
Thanks,
Vitaly Fertman


