From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs-3.6.12 release
Date: Tue, 10 Feb 2004 20:10:04 +0300
Message-ID: <200402102010.04479.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16744-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all, 

The new reiserfsprogs release is available on our ftp site (ftp.namesys.com).

It includes:
* bad block support, documentation is available at 
http://www.namesys.com/bad-block-handling.html

*reiserfsck is able to repair ro mounted filesystems.

* UUID support is rewritten -- link to the libuuid instead of our own code.

* a few bugs were fixed:
  - fix for shrinking the filesystem;
  - fix for making the filesystem with blocksize greater then 4k;
  - fix for making the journal of minimal size;
  - fix in reiserfsck --rebuild-sb;
  - fix in mount entry detection code;
  - fix for the new fs size calculation in resizer; 
  - fix for parsing the new fs size parameter correctly in resizer;
  - fix for checking if the new fs size is correct in resizer;
  - fix for handling the very last block on the device if formatted on pass2.

-- 
Thanks,
Vitaly Fertman
