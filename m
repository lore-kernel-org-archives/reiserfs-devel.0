From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs 3.6.16 release
Date: Thu, 13 May 2004 22:35:15 +0400
Message-ID: <200405132235.15380.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

The new release is available on our ftp site, it inlcludes :

- 'unpack' program is moved to 'debugreiserfs -u';
- the bugfix for the mount entry detection code when handling not 
  uptodate mtab after the crash;
- the bugfix for the configure script with generating include/credits.h 
  with cross compiling;
- the bugfix for dynamically linking to be 'position independent' code.
- a few minor bugfixes;
- manual pages were improved.

-- 
Thanks,
Vitaly Fertman

