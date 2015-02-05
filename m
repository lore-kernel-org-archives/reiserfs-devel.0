From: <doiggl@velocitynet.com.au>
Subject: Here is a plain kernel based on 3.17.3 with the reiser4 patch enabled.
Date: Thu, 05 Feb 2015 15:21:03 +1100
Message-ID: <88a5d6f2e24cba7990522bf6fd444e9b@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Here is a plain kernel based on 3.17.3 with the reiser4 patch built with
the Opensuse build service [obs] system.

The built rpms are here

https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser4?repository=openSUSE_13.1

Architecture: i586

kernel-reiser4-3.17.3-1.1.gd2bbe7f.i686.rpm
kernel-reiser4-3.17.3-1.1.gd2bbe7f.nosrc.rpm
kernel-reiser4-debuginfo-3.17.3-1.1.gd2bbe7f.i686.rpm
kernel-reiser4-debugsource-3.17.3-1.1.gd2bbe7f.i686.rpm
kernel-reiser4-devel-3.17.3-1.1.gd2bbe7f.i686.rpm

Architecture: x86_64

kernel-reiser4-3.17.3-1.1.gd2bbe7f.nosrc.rpm
kernel-reiser4-3.17.3-1.1.gd2bbe7f.x86_64.rpm
kernel-reiser4-debuginfo-3.17.3-1.1.gd2bbe7f.x86_64.rpm
kernel-reiser4-debugsource-3.17.3-1.1.gd2bbe7f.x86_64.rpm
kernel-reiser4-devel-3.17.3-1.1.gd2bbe7f.x86_64.rpm

The project is here
https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl

The log of the build is here {x86_64} as an example. [Its a long buildlog]
https://build.opensuse.org/package/live_build_log/home:doiggl/kernel-reiser4/openSUSE_13.1/x86_64

The .spec used file is here
https://build.opensuse.org/package/view_file/home:doiggl/kernel-reiser4?expand=1&file=kernel-reiser4.spec

Thanks to the opensuse-kernel list members for compilation advice.

Patches applied:

/home/abuild/rpmbuild/SOURCES/apply-patches --vanilla
/home/abuild/rpmbuild/SOURCES/series.conf ..
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.kernel.org/patch-3.17.3
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/reiser4-for-3.17.3.patch
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/3.17.3-reiser4-precise-discard-support.patch
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/chipidea-clean-up-dependencies
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/lustre-lloop-dont-change-logical-size
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/firmware-path
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/rpm-kernel-config
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/split-package
patch -s -F0 -E -p1 --no-backup-if-mismatch -i
../patches.rpmify/cloneconfig.diff

It looks like obs built the rpms.
Post the results to the list.

Cheers Glenn
