From: <doiggl@velocitynet.com.au>
Subject: Reiser4 patch  [reiser4-for-4.6.0.patch] fails to apply to  linux-4.7
Date: Sat, 30 Jul 2016 18:42:06 +1000
Message-ID: <6fe272738b66d93e54de5fd6e27c7d97@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Reiser4 patch  [reiser4-for-4.6.0.patch] fails to apply to  linux-4.7
please fix
--Glenn

log #
https://build.opensuse.org/build/home:doiggl/openSUSE_13.1/x86_64/kernel-vanilla/_log
spec #
https://build.opensuse.org/package/view_file/home:doiggl/kernel-vanilla/kernel-vanilla.spec?expand=1
patches
#https://build.opensuse.org/package/view_file/home:doiggl/kernel-vanilla/series.conf?expand=1

[   39s] + cd linux-4.7
[   39s] + /home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
[   39s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/lustre-lloop-dont-change-logical-size
[   39s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/i915-fix-build-error-with-werror
[   39s] + patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-4.6.0.patch
[   39s] 1 out of 5 hunks FAILED -- saving rejects to file
fs/read_write.c.rej
[   39s] 1 out of 8 hunks FAILED -- saving rejects to file
include/linux/fs.h.rej
[   39s] 1 out of 2 hunks FAILED -- saving rejects to file mm/vmscan.c.rej
[   39s] ++ echo '*** patch ../patches.rpmify/reiser4-for-4.6.0.patch
failed ***'
[   39s] *** patch ../patches.rpmify/reiser4-for-4.6.0.patch failed ***
[   39s] error: Bad exit status from /var/tmp/rpm-tmp.OBEacE (%prep)
[   39s] 
[   39s] 
[   39s] RPM build errors:
[   39s]     Bad exit status from /var/tmp/rpm-tmp.OBEacE (%prep)
[   39s] 
[   39s] build84 failed "build kernel-vanilla.spec" at Sat Jul 30 07:15:05
UTC 2016.
[   39s] 
[   39s] ### WATCHDOG MARKER START ###
[   43s] [   36.485157] sysrq: SysRq : Power Off
[   43s] [   36.511881] reboot: Power down
[   44s] ### WATCHDOG MARKER END ###
[   44s] 
[   44s] build84 failed "build kernel-vanilla.spec" at Sat Jul 30 07:15:11
UTC 2016.
[   44s] 

