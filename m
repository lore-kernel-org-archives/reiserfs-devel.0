From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: Change location of reiserfs mailing list (updated)
Date: Mon, 11 Jun 2007 14:03:49 -0400
Message-ID: <466D8E85.8000805@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


This patch changes occurences of reiserfs-{list,dev}@namesys.com to
reiserfs-devel@vger.kernel.org. I realize that reiserfs-dev has always
been a different list, bug bug reports should really be sent to the main
list.

I had to reformat the warnings in utils/fsck/main.c, since a simple
search/replace ended up screwing up the text justification.

 README                            |    2 -
 utils/debugfs/debugfs.reiserfs.8  |    7 ++---
 utils/fsck/fsck.reiserfs.8        |    7 ++---
 utils/fsck/main.c                 |   51
++++++++++++++++----------------------
 utils/mkfs/mkfs.reiserfs.8        |    7 ++---
 utils/resizer/resizefs.reiserfs.8 |    7 ++---
 utils/tune/tunefs.reiserfs.8      |    7 ++---
 7 files changed, 43 insertions(+), 45 deletions(-)

diff -rup reiserfsprogs-3.6.20/README reiserfsprogs-3.6.20.update/README
- --- reiserfsprogs-3.6.20/README	2006-03-28 07:40:23.000000000 -0500
+++ reiserfsprogs-3.6.20.update/README	2007-06-11 11:49:13.000000000 -0400
@@ -31,7 +31,7 @@ under  this  license or the GPL.  Furthe
 commercial and/or other interests directly from reiser@namesys.com<P>
 [END LICENSING]

- -Send bug reports to reiserfs-dev@namesys.com.
+Send bug reports to reiserfs-devel@vger.kernel.org.

 Hideous  Commercial  Pitch: Spread  your  development  costs  across
other  OS
 vendors.  Select from the best in the world,  not the best in your
building, by
diff -rup reiserfsprogs-3.6.20/utils/debugfs/debugfs.reiserfs.8
reiserfsprogs-3.6.20.update/utils/debugfs/debugfs.reiserfs.8
- --- reiserfsprogs-3.6.20/utils/debugfs/debugfs.reiserfs.8	2006-03-28
07:40:23.000000000 -0500
+++ reiserfsprogs-3.6.20.update/utils/debugfs/debugfs.reiserfs.8
2007-06-11 11:51:03.000000000 -0400
@@ -89,9 +89,10 @@ When
 This version of \fBdebugfs.reiserfs\fR has been written by Vitaly Fertman
 <vitaly@namesys.com>.
 .SH BUGS
- -Please report bugs to the ReiserFS developers
<reiserfs-dev@namesys.com>, providing
- -as much information as possible--your hardware, kernel, patches,
settings, all printed
- -messages; check the syslog file for any related information.
+Please report bugs to the ReiserFS developers
<reiserfs-devel@vger.kernel.org>,
+providing as much information as possible -- your hardware, kernel,
patches,
+settings, all printed messages; check the syslog file for any related
+information.
 .SH SEE ALSO
 .BR fsck.reiserfs (8),
 .BR mkfs.reiserfs (8)
diff -rup reiserfsprogs-3.6.20/utils/fsck/fsck.reiserfs.8
reiserfsprogs-3.6.20.update/utils/fsck/fsck.reiserfs.8
- --- reiserfsprogs-3.6.20/utils/fsck/fsck.reiserfs.8	2006-03-28
07:40:23.000000000 -0500
+++ reiserfsprogs-3.6.20.update/utils/fsck/fsck.reiserfs.8	2007-06-11
11:51:50.000000000 -0400
@@ -189,9 +189,10 @@ will try to help solve the problem.
 .SH AUTHOR
 This version of \fBfsck.reiserfs\fR has been written by Vitaly Fertman
<vitaly@namesys.com>.
 .SH BUGS
- -Please report bugs to the ReiserFS developers
<reiserfs-dev@namesys.com>, providing
- -as much information as possible--your hardware, kernel, patches,
settings, all printed
- -messages, the logfile; check the syslog file for any related information.
+Please report bugs to the ReiserFS developers
<reiserfs-devel@vger.kernel.org>,
+providing as much information as possible -- your hardware, kernel,
patches,
+settings, all printed messages, the logfile; check the syslog file for any
+related information.
 .SH TODO
 Faster recovering, signal handling.
 .SH SEE ALSO
diff -rup reiserfsprogs-3.6.20/utils/fsck/main.c
reiserfsprogs-3.6.20.update/utils/fsck/main.c
- --- reiserfsprogs-3.6.20/utils/fsck/main.c	2006-03-28 07:40:23.000000000
- -0500
+++ reiserfsprogs-3.6.20.update/utils/fsck/main.c	2007-06-11
11:45:50.000000000 -0400
@@ -305,37 +305,30 @@ static char * parse_options (struct fsck
 }


- -#define REBUILD_WARNING \
- -"*************************************************************\n\
- -** Do not  run  the  program  with  --rebuild-tree  unless **\n\
- -** something is broken and MAKE A BACKUP  before using it. **\n\
- -** If you have bad sectors on a drive  it is usually a bad **\n\
- -** idea to continue using it. Then you probably should get **\n\
- -** a working hard drive, copy the file system from the bad **\n\
- -** drive  to the good one -- dd_rescue is  a good tool for **\n\
- -** that -- and only then run this program.                 **\n\
- -** If you are using the latest reiserfsprogs and  it fails **\n\
- -** please  email bug reports to reiserfs-list@namesys.com, **\n\
- -** providing  as  much  information  as  possible --  your **\n\
- -** hardware,  kernel,  patches,  settings,  all reiserfsck **\n\
- -** messages  (including version),  the reiserfsck logfile, **\n\
- -** check  the  syslog file  for  any  related information. **\n\
- -** If you would like advice on using this program, support **\n\
- -** is available  for $25 at  www.namesys.com/support.html. **\n\
- -*************************************************************\n\
+#define REBUILD_WARNING "\
+** Do  not run  the  program with --rebuild-tree  unless  something **\n\
+** is broken and  MAKE A BACKUP  before  using it.  If you have bad **\n\
+** sectors on  a drive it  is usually a bad idea  to continue using **\n\
+** it. Then you probably  should get a working hard drive, copy the **\n\
+** file system  from the bad drive to the  good one -- dd_rescue is **\n\
+** a good tool for that -- and only  then run this program.  If you **\n\
+** are using  the latest reiserfsprogs and  it  fails please  email **\n\
+** bug  reports  to <reiserfs-devel@vger.kernel.org>,  providing as **\n\
+** much information  as possible -- your hardware, kernel, patches, **\n\
+** settings,  all  reiserfsck  messages  (including  version),  the **\n\
+** reiserfsck  logfile,  check  the  syslog file  for  any  related **\n\
+** information.  If you would like  advice  on using this  program, **\n\
+** support  is available  for $25 at  www.namesys.com/support.html. **\n\
 \nWill rebuild the filesystem on (%s)\n"

- -#define START_WARNING \
- -"*************************************************************\n\
- -** If you are using the latest reiserfsprogs and  it fails **\n\
- -** please  email bug reports to reiserfs-list@namesys.com, **\n\
- -** providing  as  much  information  as  possible --  your **\n\
- -** hardware,  kernel,  patches,  settings,  all reiserfsck **\n\
- -** messages  (including version),  the reiserfsck logfile, **\n\
- -** check  the  syslog file  for  any  related information. **\n\
- -** If you would like advice on using this program, support **\n\
- -** is available  for $25 at  www.namesys.com/support.html. **\n\
- -*************************************************************\n\
+#define START_WARNING "\
+** If you are  using the latest  reiserfsprogs  and it fails please **\n\
+** email bug reports to <reiserfs-devel@vger.kernel.org>, providing **\n\
+** as  much  information  as  possible  --  your  hardware, kernel, **\n\
+** patches, settings, all reiserfsck  messages (including version), **\n\
+** the reiserfsck  logfile,  check  the syslog file for any related **\n\
+** information.  If  you would  like advice  on using this program, **\n\
+** support  is  available  for $25 at www.namesys.com/support.html. **\n\
 \n"


diff -rup reiserfsprogs-3.6.20/utils/mkfs/mkfs.reiserfs.8
reiserfsprogs-3.6.20.update/utils/mkfs/mkfs.reiserfs.8
- --- reiserfsprogs-3.6.20/utils/mkfs/mkfs.reiserfs.8	2006-03-28
07:40:23.000000000 -0500
+++ reiserfsprogs-3.6.20.update/utils/mkfs/mkfs.reiserfs.8	2007-06-11
11:50:40.000000000 -0400
@@ -106,9 +106,10 @@ This version of
 .B mkfs.reiserfs
 has been written by Edward Shishkin <edward@namesys.com>.
 .SH BUGS
- -Please report bugs to the ReiserFS developers
<reiserfs-dev@namesys.com>, providing
- -as much information as possible--your hardware, kernel, patches,
settings, all printed
- -messages; check the syslog file for any related information.
+Please report bugs to the ReiserFS developers
<reiserfs-devel@vger.kernel.org>,
+providing as much information as possible -- your hardware, kernel,
patches,
+settings, all printed messages; check the syslog file for any related
+information.
 .SH SEE ALSO
 .BR fsck.reiserfs (8),
 .BR debugfs.reiserfs (8),
diff -rup reiserfsprogs-3.6.20/utils/resizer/resizefs.reiserfs.8
reiserfsprogs-3.6.20.update/utils/resizer/resizefs.reiserfs.8
- --- reiserfsprogs-3.6.20/utils/resizer/resizefs.reiserfs.8	2006-03-28
07:40:23.000000000 -0500
+++ reiserfsprogs-3.6.20.update/utils/resizer/resizefs.reiserfs.8
2007-06-11 11:51:23.000000000 -0400
@@ -113,9 +113,10 @@ This version of
 .B resizefs.reiserfs
 has been written by Alexander Zarochentcev <zam@namesys.com>.
 .SH BUGS
- -Please report bugs to the ReiserFS developers
<reiserfs-dev@namesys.com>, providing
- -as much information as possible--your hardware, kernel, patches,
settings, all printed
- -messages; check the syslog file for any related information.
+Please report bugs to the ReiserFS developers
<reiserfs-devel@vger.kernel.org>,
+providing as much information as possible -- your hardware, kernel,
patches,
+settings, all printed messages; check the syslog file for any related
+information.
 .SH SEE ALSO
 .BR cfdisk (8),
 .BR fsck.reiserfs (8),
diff -rup reiserfsprogs-3.6.20/utils/tune/tunefs.reiserfs.8
reiserfsprogs-3.6.20.update/utils/tune/tunefs.reiserfs.8
- --- reiserfsprogs-3.6.20/utils/tune/tunefs.reiserfs.8	2006-03-28
07:40:23.000000000 -0500
+++ reiserfsprogs-3.6.20.update/utils/tune/tunefs.reiserfs.8	2007-06-11
11:52:12.000000000 -0400
@@ -150,9 +150,10 @@ using /dev/hda1 under patched kernel
 This version of \fBtune.reiserfs\fR has been written by Vladimir
 Demidov <vova@namesys.com> and Edward Shishkin <edward@namesys.com>.
 .SH BUGS
- -Please report bugs to the ReiserFS developers
<reiserfs-dev@namesys.com>, providing
- -as much information as possible--your hardware, kernel, patches,
settings, all printed
- -messages; check the syslog file for any related information.
+Please report bugs to the ReiserFS developers
<reiserfs-devel@vger.kernel.org>,
+providing as much information as possible -- your hardware, kernel,
patches,
+settings, all printed messages; check the syslog file for any related
+information.
 .SH SEE ALSO
 .BR fsck.reiserfs (8),
 .BR debugfs.reiserfs (8),


- --
Jeff Mahoney
SUSE Labs

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFGbY6FLPWxlyuTD7IRAohZAKCeZJppiMABEpPerG6fV7Sc7SdvNwCeOMC/
No9i27bYWTQmpAOm2r2GMwY=
=F7gd
-----END PGP SIGNATURE-----
