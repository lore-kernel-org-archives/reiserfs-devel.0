From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs 3.6.14 release
Date: Thu, 18 Mar 2004 23:51:42 +0300
Message-ID: <200403182350.44277.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all, 

the new release is available on our ftp site, 
it includes a few bug fixes:

- in the journal replay code;
- in the balancing code when handling broken leaves;
- in the spec file;
- in reiserfsck when setting the file size limit.


The new pre release 3.6.15-pre1 is also available,
it inlcludes some fixes that are not so well tested:

- in the mount entry detection code when handling 
  not uptodate mtab after the crash;
- in the configure script with generating include/credits.h 
  when cross compiling;
- make bynaries to be 'position independent' when 
  dynamically linked to libc.

-- 
Thanks,
Vitaly Fertman


