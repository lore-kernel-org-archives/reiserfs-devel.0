From: <doiggl@velocitynet.com.au>
Subject: patching problem with patch-3.13.5-6 and reiser4-for-3.13.1.patch on 3.13x
Date: Wed, 12 Mar 2014 21:53:21 +1100
Message-ID: <b2691bf95d8fc9c2dfba301dd02003d9@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Why does reiser4-for-3.13.1.patch fail to apply when patch patch-3.13.5-6
is applied as well.



The failed log shows:

[   82s] + cd linux-3.13
[   82s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[   82s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.1
[   82s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.1-2
[   82s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.2-3
[   82s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.3-4
[   82s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.4-5
[   82s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.5-6
[   82s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-3.13.1.patch
[   83s] 1 out of 8 hunks FAILED -- saving rejects to file
fs/fs-writeback.c.rej
[   83s] ++ echo '*** patch ../patches.rpmify/reiser4-for-3.13.1.patch
failed ***'
[   83s] *** patch ../patches.rpmify/reiser4-for-3.13.1.patch failed ***


So I commented out the line:
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.5-6


The passed log now  shows:

[   76s] + cd linux-3.13
[   76s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[   76s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.1
[   76s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.1-2
[   76s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.2-3
[   76s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.3-4
[   77s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.13.4-5
[   77s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-3.13.1.patch
[   77s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/nouveau-make-vga_switcheroo-code-depend-on-vga_switcheroo



The entire log is at: {it is still being compiled}

https://build.opensuse.org/package/live_build_log/home:doiggl/kernel-reiser4/openSUSE_13.1/x86_64

project:
https://build.opensuse.org/package/show/home:doiggl/kernel-reiser4

Here is a link to file which contains patch patch-3.13.5-6
https://build.opensuse.org/source/home:doiggl/kernel-reiser4/patches.kernel.org.tar.bz2?rev=38b66b574f22e579e7a43371a74eac05

Link on how to apply patches:
https://build.opensuse.org/source/home:doiggl/kernel-reiser4/series.conf?rev=38b66b574f22e579e7a43371a74eac05

I wonder what lines in patch causes the fail, and is there a fix for
this,or just leave/comment out the patch.  patch-3.13.5-6 ?
Thanks Glenn
