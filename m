From: <doiggl@velocitynet.com.au>
Subject: Does node41 support work with reiser4progs version 1.0.9 ?
Date: Tue, 17 Feb 2015 11:49:10 +1100
Message-ID: <25803146be5362f281d7afd75fb7acea@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I try and build reiser4progs with
reiser4progs-1.0.9-add-node41-support.patch but the patch fails.

- Does node41 support work with reiser4progs version 1.0.9 ?

Thanks Glenn

details as follows:

Project
 https://build.opensuse.org/package/show/home:doiggl/reiser4progs

Spec file

https://build.opensuse.org/package/view_file/home:doiggl/reiser4progs/reiser4progs.spec?expand=1


using files:
reiser4progs-1.0.9-add-node41-support.patch
reiser4progs-1.0.9.tar.gz
reiser4progs.changes

other:
http://www.spinics.net/lists/reiserfs-devel/msg04589.html

[1] patch errors and log
https://build.opensuse.org/package/live_build_log/home:doiggl/re

[   83s] + rm -rf reiser4progs-1.0.9
[   83s] + /usr/bin/gzip -dc
/home/abuild/rpmbuild/SOURCES/reiser4progs-1.0.9.tar.gz
[   83s] + /bin/tar -xf -
[   83s] + STATUS=0
[   83s] + '[' 0 -ne 0 ']'
[   83s] + cd reiser4progs-1.0.9
[   83s] + /usr/bin/chmod -Rf a+rX,u+w,g-w,o-w .
[   83s] + echo 'Patch #1 (reiser4progs-1.0.9-add-node41-support.patch):'
[   83s] Patch #1 (reiser4progs-1.0.9-add-node41-support.patch):
[   83s] + /usr/bin/patch -p1 --fuzz=0
[   83s] + /usr/bin/cat
/home/abuild/rpmbuild/SOURCES/reiser4progs-1.0.9-add-node41-support.patch
[   83s] patching file configure.in
[   83s] patching file include/reiser4/plugin.h
[   83s] Hunk #2 FAILED at 955.
[   83s] 1 out of 3 hunks FAILED -- saving rejects to file
include/reiser4/plugin.h.rej
[   83s] patching file plugin/Makefile.am
[   83s] patching file plugin/node/Makefile.am
[   83s] patching file plugin/node/node41/Makefile.am
[   83s] patching file plugin/node/node41/node41.c
[   83s] patching file plugin/node/node41/node41.h
[   83s] patching file libreiser4/factory.c
[   83s] Hunk #1 FAILED at 239.
[   83s] 1 out of 1 hunk FAILED -- saving rejects to file
libreiser4/factory.c.rej
[   83s] patching file libreiser4/profile.c
[   83s] patching file plugin/node/node41/node41_repair.c
[   83s] patching file plugin/node/node41/node41_repair.h
[   83s] patching file plugin/node/node40/node40.h
[   83s] patching file plugin/node/node40/node40.c
[   83s] Hunk #1 FAILED at 68.
[   83s] Hunk #4 FAILED at 165.
[   83s] Hunk #5 FAILED at 175.
[   83s] Hunk #6 FAILED at 218.
[   83s] Hunk #9 FAILED at 654.
[   83s] Hunk #16 FAILED at 1646.
[   83s] 6 out of 17 hunks FAILED -- saving rejects to file
plugin/node/node40/node40.c.rej
[   83s] patching file plugin/node/node40/node40_repair.c
[   83s] Hunk #2 FAILED at 58.
[   83s] Hunk #3 FAILED at 76.
[   83s] Hunk #6 FAILED at 175.
[   83s] Hunk #7 FAILED at 258.
[   83s] Hunk #8 FAILED at 275.
[   83s] Hunk #10 FAILED at 390.
[   83s] Hunk #11 FAILED at 432.
[   83s] Hunk #12 FAILED at 598.
[   83s] 8 out of 13 hunks FAILED -- saving rejects to file
plugin/node/node40/node40_repair.c.rej
[   83s] patching file plugin/node/node40/node40_repair.h
[   83s] patching file include/reiser4/format.h
[   83s] patching file libreiser4/filesystem.c
[   83s] Hunk #2 FAILED at 288.
[   83s] 1 out of 2 hunks FAILED -- saving rejects to file
libreiser4/filesystem.c.rej
[   83s] patching file libreiser4/format.c
[   83s] patching file libreiser4/tree.c
[   83s] Hunk #1 FAILED at 856.
[   83s] Hunk #2 FAILED at 873.
[   83s] 2 out of 3 hunks FAILED -- saving rejects to file
libreiser4/tree.c.rej
[   83s] patching file plugin/format/format40/format40.c
[   83s] Hunk #1 FAILED at 47.
[   83s] 1 out of 3 hunks FAILED -- saving rejects to file
plugin/format/format40/format40.c.rej
[   83s] patching file plugin/format/format40/format40.h
[   83s] Hunk #1 FAILED at 43.
[   83s] 1 out of 3 hunks FAILED -- saving rejects to file
plugin/format/format40/format40.h.rej
[   83s] error: Bad exit status from /var/tmp/rpm-tmp.K4UZIv (%prep)
