From: <doiggl@velocitynet.com.au>
Subject: What package do these two patches belong to ?
Date: Wed, 18 Feb 2015 23:15:11 +1100
Message-ID: <1e46640b7e111069cb9853a8142e4186@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

Question:
What package do these two patches belong to ?
I thought it was reiser4progs-1.0.9 but I am unsure.

Thanks Glenn

- http://www.spinics.net/lists/reiserfs-devel/msg04590.html
[PATCH 1/2] reiser4: node41 layout support

- http://www.spinics.net/lists/reiserfs-devel/msg04591.html
[PATCH 2/2] reiser4progs: node41 layout support

I get note: no Makefile  in reiser4progs-1.0.9 source.

Patch says:
Support of node41 layout (the same as node40, but
with 32-bit field for checksum).

Signed-off-by: Edward Shishkin <edward.shishkin@xxxxxxxxx>

---
 fs/reiser4/Makefile                           |    1 
 fs/reiser4/jnode.c                            |   11 --
 fs/reiser4/plugin/disk_format/disk_format40.c |    7 +
 fs/reiser4/plugin/disk_format/disk_format40.h |    4 
 fs/reiser4/plugin/node/Makefile               |    3 
 fs/reiser4/plugin/node/node.c                 |   38 ++++++
 fs/reiser4/plugin/node/node.h                 |    6 -
 fs/reiser4/plugin/node/node40.c               |  142
+++++++++++++++++---------
 fs/reiser4/plugin/node/node40.h               |   23 ++--
 fs/reiser4/plugin/node/node41.c               |  111 ++++++++++++++++++++
 fs/reiser4/plugin/node/node41.h               |   48 ++++++++
 fs/reiser4/plugin/plugin.h                    |    2 
 fs/reiser4/reiser4.h                          |    1 
 13 files changed, 329 insertions(+), 68 deletions(-)

--- a/fs/reiser4/Makefile
.
.
.

Get following error:

# quilt -v setup *spec
md5sum < reiser4-node41-layout-support-joined.patch
md5sum < reiser4progs-1.0.9-add-node41-support.patch
md5sum < reiser4progs-1.0.9.tar.gz
gzip -cd reiser4progs-1.0.9.tar.gz | md5sum

Executing(%prep): /bin/sh -e /var/tmp/rpm-tmp.9t8iEn
+ umask 022
+ cd /var/tmp/quiltLC50r1/build
+ cd /var/tmp/quiltLC50r1/build
+ rm -rf reiser4progs-1.0.9
+ /usr/bin/gzip -dc
/tmp/s/home:doiggl/reiser4progs/reiser4progs-1.0.9.tar.gz
+ /var/tmp/quiltLC50r1/bin/tar -xf -
+ STATUS=0
+ '[' 0 -ne 0 ']'
+ cd reiser4progs-1.0.9
+ /usr/bin/chmod -Rf a+rX,u+w,g-w,o-w .
+ echo 'Patch #0 (reiser4progs-1.0.9-add-node41-support.patch):'
Patch #0 (reiser4progs-1.0.9-add-node41-support.patch):
+ /usr/bin/cat
/tmp/s/home:x/reiser4progs/reiser4progs-1.0.9-add-node41-support.patch
+ /var/tmp/quiltLC50r1/bin/patch -p1 --fuzz=0
can't find file to patch at input line 4
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|#http://www.spinics.net/lists/reiserfs-devel/msg04590.html
|--- a/fs/reiser4/Makefile
|+++ b/fs/reiser4/Makefile
--------------------------
File to patch: ^C

#


# ll
total 1046
-rw-r--r--  1 root users  68069 Feb 18 00:17
reiser4-node41-layout-support-joined.patch
drwxrwxr-x 12 t1    1000   1248 Feb 18 17:16 reiser4progs-1.0.9
-rw-r--r--  1 root users  68191 Feb 18 01:10
reiser4progs-1.0.9-add-node41-support.patch
-rw-r--r--  1 root users 913470 Jun 29  2014 reiser4progs-1.0.9.tar.gz
-rw-r--r--  1 root users   5870 Aug 21 08:16 reiser4progs.changes
-rw-r--r--  1 root users   3937 Feb 18 01:12 reiser4progs.spec

- file list

# ll
total 1378
-rw-r--r--  1 t1 1000    390 Jan  9  2009 AUTHORS
-rw-r--r--  1 t1 1000     66 Jan  9  2009 BUGS
-rw-r--r--  1 t1 1000   2891 Jan  9  2009 COPYING
-rw-r--r--  1 t1 1000   3549 Jun 29  2014 CREDITS
-rw-r--r--  1 t1 1000   4916 Jan  9  2009 CUSTOM_INSTALL_README
-rw-r--r--  1 t1 1000   5507 Jun 29  2014 ChangeLog
-rw-r--r--  1 t1 1000   7831 Jan  9  2009 INSTALL
-rw-r--r--  1 t1 1000    334 Jan  9  2009 INSTALL_README
-rw-r--r--  1 t1 1000    647 Jan  9  2009 Makefile.am
-rw-rw-r--  1 t1 1000  28128 Jun 29  2014 Makefile.in
-rw-r--r--  1 t1 1000      0 Jan 17  2009 NEWS
-rw-r--r--  1 t1 1000   1079 Jan  9  2009 README
-rw-r--r--  1 t1 1000    114 Jan  9  2009 THANKS
-rw-r--r--  1 t1 1000    824 Jan  9  2009 TODO
-rw-rw-r--  1 t1 1000 349349 Jun 29  2014 aclocal.m4
-rwxr-xr-x  1 t1 1000   3642 Jan  9  2009 compile
-rwxr-xr-x  1 t1 1000  43632 Jan  9  2009 config.guess
-rw-rw-r--  1 t1 1000   5835 Jun  9  2014 config.h.in
-rwxr-xr-x  1 t1 1000  31175 Jan  9  2009 config.sub
-rwxr-xr-x  1 t1 1000 506137 Jun 29  2014 configure
-rw-r--r--  1 t1 1000  17155 Jun 29  2014 configure.in
drwxrwxr-x  2 t1 1000    376 Jun 29  2014 demos
-rwxr-xr-x  1 t1 1000  15205 Jan  9  2009 depcomp
drwxrwxr-x  2 t1 1000    256 Jun 29  2014 doc
drwxrwxr-x  6 t1 1000    208 Jun 29  2014 include
-rwxr-xr-x  1 t1 1000   9212 Jan  9  2009 install-sh
drwxrwxr-x  2 t1 1000    160 Jun 29  2014 libaux
drwxrwxr-x  2 t1 1000    280 Jun 29  2014 libmisc
drwxrwxr-x  2 t1 1000    712 Jun 29  2014 libreiser4
-rw-r--r--  1 t1 1000   2735 Jan  9  2009 libreiser4.m4
drwxrwxr-x  2 t1 1000    648 Jun 29  2014 librepair
-rw-r--r--  1 t1 1000 283474 Apr  8  2013 ltmain.sh
-rwxr-xr-x  1 t1 1000  10678 Jan  9  2009 missing
-rw-r--r--  1 t1 1000    687 Jan  9  2009 one_touch_install
drwxrwxr-x 15 t1 1000    424 Jun 29  2014 plugin
drwxrwxr-x  6 t1 1000    216 Jun 29  2014 progs
-rw-rw-r--  1 t1 1000   1830 Jun 29  2014 reiser4progs.spec
-rw-r--r--  1 t1 1000   1834 Jan  9  2009 reiser4progs
