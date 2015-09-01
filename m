From: <doiggl@velocitynet.com.au>
Subject: Reiser4 reiser4-for-4.1.5.patch.gz patch failed to build with linux-4.2.tar.xz
Date: Tue, 01 Sep 2015 23:37:12 +1000
Message-ID: <c23690c5c7cc7267f4c591fe76620dbd@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Just found out Reiser4 reiser4-for-4.1.5.patch.gz patch failed to build
with linux-4.2.tar.xz 
Can a version be provided/patched for 4.2x please ?
Thanks Glenn

Error log:
.
.
[  140s] + cd /home/abuild/rpmbuild/BUILD
[  140s] + rm -rf kernel-vanilla-4.2.0
[  140s] + /usr/bin/mkdir -p kernel-vanilla-4.2.0
[  140s] + cd kernel-vanilla-4.2.0
[  140s] + /usr/bin/xz -dc /home/abuild/rpmbuild/SOURCES/linux-4.2.tar.xz
[  140s] + /bin/tar -xf -
[  161s] + STATUS=0
.
.

[  165s] + cd linux-4.2
[  165s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[  165s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-4.1.5.patch
[  165s] 3 out of 8 hunks FAILED -- saving rejects to file
fs/fs-writeback.c.rej
[  165s] 1 out of 1 hunk FAILED -- saving rejects to file
include/linux/mm.h.rej
[  165s] 1 out of 2 hunks FAILED -- saving rejects to file
include/linux/writeback.h.rej
[  165s] ++ echo '*** patch ../patches.rpmify/reiser4-for-4.1.5.patch
failed ***'
[  165s] *** patch ../patches.rpmify/reiser4-for-4.1.5.patch failed ***
[  166s] error: Bad exit status from /var/tmp/rpm-tmp.VdiQ8y (%prep)

build location and log
========================
https://build.opensuse.org/package/show/home:doiggl/kernel-vanilla
https://build.opensuse.org/build/home:doiggl/openSUSE_13.1/x86_64/kernel-vanilla/_log
https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.2.tar.xz
