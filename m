From: <doiggl@velocitynet.com.au>
Subject: ERROR: "__inode_attach_wb" [fs/reiser4/reiser4.ko] undefined! - patches.kernel.org/patch-4.2.1 + reiser4-for-4.2.1.patch
Date: Sat, 26 Sep 2015 23:10:15 +1000
Message-ID: <7adcbd1c7a5d4fb1a8f30836d3ac3b0e@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello,
Got this from build log:
Full build
log:https://build.opensuse.org/build/home:doiggl/openSUSE_13.1/x86_64
/kernel-reiser4/_log
- https://build.opensuse.org/package/show/home:doiggl/kernel-reiser4
- Is there a fix for the error  ?
--Glenn

[  128s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[  128s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-4.2.1
[  129s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-4.2.1.patch
[  130s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/lustre-lloop-dont-change-logical-size
[  130s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/firmware-path
[  130s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/rpm-kernel-config
[  130s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/split-package
[  130s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/cloneconfig.diff
.
.
[ 4809s]   LD      arch/x86/boot/setup.elf
[ 4809s]   OBJCOPY arch/x86/boot/setup.bin
[ 4810s]   BUILD   arch/x86/boot/bzImage
[ 4810s] Setup is 17292 bytes (padded to 17408 bytes).
[ 4810s] System is 5145 kB
[ 4810s] CRC 86bb67
[ 4810s] Kernel: arch/x86/boot/bzImage is ready  (#1)
[ 4864s]   MODPOST 3507 modules
[ 5308s] ERROR: "__inode_attach_wb" [fs/reiser4/reiser4.ko] undefined!
[ 5311s] make[3]: *** [__modpost] Error 1
[ 5311s] make[2]: *** [modules] Error 2
[ 5311s] make[1]: *** [sub-make] Error 2
[ 5311s] make: *** [__sub-make] Error 2
[ 5311s] + test 2 -eq 0
[ 5311s] + test 00 -gt 0
[ 5311s] + exit 1
[ 5312s] error: Bad exit status from /var/tmp/rpm-tmp.qmoZLx (%build)

https://build.opensuse.org/package/view_file/home:doiggl/kernel-reiser4/series.conf?expand=1
