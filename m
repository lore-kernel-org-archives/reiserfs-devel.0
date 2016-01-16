From: <doiggl@velocitynet.com.au>
Subject: Here is a plain kernel based on 4.4.0 with the reiser4 patch enabled. [reiser4-for-4.4.0.patch]
Date: Sat, 16 Jan 2016 19:35:42 +1100
Message-ID: <fa4a37e0768443f81dc2e00cfab91a53@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Here is a plain kernel based on 4.4.0 with the reiser4 patch built with
the Opensuse build service [obs] system.

The built rpms are here

https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser4?repository=openSUSE_13.1

Architecture: i586

kernel-reiser4-4.4.0-2.1.i686.rpm
kernel-reiser4-4.4.0-2.1.nosrc.rpm
kernel-reiser4-debuginfo-4.4.0-2.1.i686.rpm
kernel-reiser4-debugsource-4.4.0-2.1.i686.rpm
kernel-reiser4-devel-4.4.0-2.1.i686.rpm

Architecture: x86_64

kernel-reiser4-4.4.0-2.1.nosrc.rpm
kernel-reiser4-4.4.0-2.1.x86_64.rpm
kernel-reiser4-debuginfo-4.4.0-2.1.x86_64.rpm
kernel-reiser4-debugsource-4.4.0-2.1.x86_64.rpm
kernel-reiser4-devel-4.4.0-2.1.x86_64.rpm

The project is here
https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl

The log of the build is here {x86_64} as an example. [Its a long buildlog]
https://build.opensuse.org/package/live_build_log/home:doiggl/kernel-reiser4/openSUSE_13.1/x86_64

The .spec used file is here
https://build.opensuse.org/package/view_file/home:doiggl/kernel-reiser4?expand=1&file=kernel-reiser4.spec

Thanks to the opensuse-kernel list members for compilation advice.

Patches applied:
reiser4-for-4.4.0.patch
