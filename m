From: <doiggl@velocitynet.com.au>
Subject: reiser4-port-for-4.2.patch failed to apply to linux-4.2.tar.xz 81.5 MB
Date: Fri, 25 Sep 2015 16:27:06 +1000
Message-ID: <e7105a014b6a16a0d9e4d91aef9dda8a@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello,
reiser4-port-for-4.2.patch failed to apply to linux-4.2.tar.xz 81.5 MB 
#
Applied as follows:
https://build.opensuse.org/package/view_file/home:doiggl/kernel-vanilla/series.conf?expand=1

How is it fixed ?
--Glenn

Full log
########
https://build.opensuse.org/build/home:doiggl/openSUSE_13.1/x86_64/kernel-vanilla/_log
# Errors

[  111s] + sort -u
[  111s] + sed 's,.*/,,; s,\.ko$,,'
[  111s] + cd linux-4.2
[  111s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[  111s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-port-for-4.2.patch
[  111s] The text leading up to this was:
[  111s] --------------------------
[  111s] |diff -u -r linux-4.1.7/fs/reiser4/flush_queue.c
linux-4.2/fs/reiser4/flush_queue.c
[  111s] |--- linux-4.1.7/fs/reiser4/flush_queue.c	2015-09-17
12:07:53.030274225 +0200
[  111s] |+++ linux-4.2/fs/reiser4/flush_queue.c	2015-09-18
14:32:11.491733319 +0200
[  111s] --------------------------
[  111s] File to patch: 
[  111s] Skip this patch? [y] 
[  111s] 1 out of 1 hunk ignored
[  111s] The text leading up to this was:
[  111s] --------------------------
[  111s] |diff -u -r linux-4.1.7/fs/reiser4/page_cache.c
linux-4.2/fs/reiser4/page_cache.c
[  111s] |--- linux-4.1.7/fs/reiser4/page_cache.c	2015-09-17
12:07:53.035274226 +0200
[  111s] |+++ linux-4.2/fs/reiser4/page_cache.c	2015-09-18
14:36:40.301602905 +0200
[  111s] --------------------------
[  111s] File to patch: 
[  111s] Skip this patch? [y] 
[  111s] 2 out of 2 hunks ignored
[  111s] The text leading up to this was:
[  111s] --------------------------
[  111s] |diff -u -r linux-4.1.7/fs/reiser4/page_cache.h
linux-4.2/fs/reiser4/page_cache.h
[  111s] |--- linux-4.1.7/fs/reiser4/page_cache.h	2015-09-17
12:07:53.036274227 +0200
[  111s] |+++ linux-4.2/fs/reiser4/page_cache.h	2015-09-18
14:32:11.497733317 +0200
[  111s] --------------------------
[  111s] File to patch: 
[  111s] Skip this patch? [y] 
[  111s] 1 out of 1 hunk ignored
[  111s] The text leading up to this was:
[  111s] --------------------------
[  111s] |diff -u -r linux-4.1.7/fs/reiser4/plugin/file/cryptcompress.c
linux-4.2/fs/reiser4/plugin/file/cryptcompress.c
[  111s] |---
linux-4.1.7/fs/reiser4/plugin/file/cryptcompress.c	2015-09-17
12:07:53.040274228 +0200
[  111s] |+++ linux-4.2/fs/reiser4/plugin/file/cryptcompress.c	2015-09-18
14:32:11.502733314 +0200
[  111s] --------------------------
[  111s] File to patch: 
[  111s] Skip this patch? [y] 
[  111s] 2 out of 2 hunks ignored
[  111s] The text leading up to this was:
[  111s] --------------------------
[  111s] |diff -u -r linux-4.1.7/fs/reiser4/plugin/file/file.c
linux-4.2/fs/reiser4/plugin/file/file.c
[  111s] |--- linux-4.1.7/fs/reiser4/plugin/file/file.c	2015-09-17
12:07:53.042274228 +0200
[  111s] |+++ linux-4.2/fs/reiser4/plugin/file/file.c	2015-09-18
14:32:11.503733314 +0200
[  111s] --------------------------
[  111s] File to patch: 
[  111s] Skip this patch? [y] 
[  111s] 1 out of 1 hunk ignored
[  111s] The text leading up to this was:
[  111s] --------------------------
[  111s] |diff -u -r linux-4.1.7/fs/reiser4/plugin/inode_ops.c
linux-4.2/fs/reiser4/plugin/inode_ops.c
[  111s] |--- linux-4.1.7/fs/reiser4/plugin/inode_ops.c	2015-09-17
12:07:53.045274229 +0200
[  111s] |+++ linux-4.2/fs/reiser4/plugin/inode_ops.c	2015-09-18
14:32:11.506733312 +0200
[  111s] --------------------------
[  111s] File to patch: 
[  111s] Skip this patch? [y] 
[  111s] 2 out of 2 hunks ignored
[  111s] The text leading up to this was:
[  111s] --------------------------
[  111s] |diff -u -r linux-4.1.7/fs/reiser4/plugin/object.h
linux-4.2/fs/reiser4/plugin/object.h
[  111s] |--- linux-4.1.7/fs/reiser4/plugin/object.h	2015-09-17
12:07:53.053274231 +0200
[  111s] |+++ linux-4.2/fs/reiser4/plugin/object.h	2015-09-18
14:32:11.516733307 +0200
[  111s] --------------------------
[  111s] File to patch: 
[  111s] Skip this patch? [y] 
[  111s] 1 out of 1 hunk ignored
[  111s] The text leading up to this was:
[  111s] --------------------------
[  111s] |diff -u -r linux-4.1.7/fs/reiser4/wander.c
linux-4.2/fs/reiser4/wander.c
[  111s] |--- linux-4.1.7/fs/reiser4/wander.c	2015-09-17
12:07:53.065274235 +0200
[  111s] |+++ linux-4.2/fs/reiser4/wander.c	2015-09-18 14:32:11.527733302
+0200
[  111s] --------------------------
[  111s] File to patch: 
[  111s] Skip this patch? [y] 
[  111s] 1 out of 1 hunk ignored
[  111s] ++ echo '*** patch ../patches.rpmify/reiser4-port-for-4.2.patch
failed ***'
[  111s] *** patch ../patches.rpmify/reiser4-port-for-4.2.patch failed ***
[  111s] error: Bad exit status from /var/tmp/rpm-tmp.qH2P0V (%prep)
[  111s] 
[  111s] 
[  111s] RPM build errors:
[  111s]     Bad exit status from /var/tmp/rpm-tmp.qH2P0V (%prep)
[  111s] ### WATCHDOG MARKER START ###
[  115s] [   76.302961] SysRq : Power Off
[  115s] [   76.308205] reboot: Power down
[  136s] ### WATCHDOG MARKER END ###

other:
https://build.opensuse.org/package/show/home:doiggl/kernel-vanilla

