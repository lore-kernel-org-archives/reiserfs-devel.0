From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs-3.6.12-pre1 release
Date: Sat, 1 Nov 2003 20:49:19 +0300
Message-ID: <200311012049.19969.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all, 

The new pre release is available for downloading on
ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.12-pre1.tar.gz

The release includes:

* bad block support, documentation is available at 
http://www.namesys.com/bad-block-handling.html

*reiserfsck can check ro mounted filesystems.

* a few bugs were fixed:
  - fix for shrinking the filesystem;
  - fix for making the filesystem with blocksize greater then 4k;
  - fix for making the journal of minimal size.

-- 
Thanks,
Vitaly Fertman


