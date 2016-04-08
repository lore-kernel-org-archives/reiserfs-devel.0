From: <doiggl@velocitynet.com.au>
Subject: Here is a plain kernel based on 4.5.0 with the reiser4 patch enabled. [reiser4-for-4.5.0.patch]
Date: Fri, 08 Apr 2016 11:12:05 +1000
Message-ID: <2973d3661147d37b144cd5b5d035d61f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Here is a plain kernel based on 4.5.0 with the reiser4-for-4.5.0.patch
built with the Opensuse build service [obs] system.

The built rpms are here

https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser4?repository=openSUSE_13.2

Architecture: i586

    kernel-reiser4-4.5.0-7.1.i686.rpm
    kernel-reiser4-4.5.0-7.1.nosrc.rpm
    kernel-reiser4-debuginfo-4.5.0-7.1.i686.rpm
    kernel-reiser4-debugsource-4.5.0-7.1.i686.rpm
    kernel-reiser4-devel-4.5.0-7.1.i686.rpm

Architecture: x86_64

    kernel-reiser4-4.5.0-7.1.nosrc.rpm
    kernel-reiser4-4.5.0-7.1.x86_64.rpm
    kernel-reiser4-debuginfo-4.5.0-7.1.x86_64.rpm
    kernel-reiser4-debugsource-4.5.0-7.1.x86_64.rpm
    kernel-reiser4-devel-4.5.0-7.1.x86_64.rpm

The project is here
https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl

The log of the build is here {x86_64} as an example. [Its a long buildlog]
https://build.opensuse.org/package/live_build_log/home:doiggl/kernel-reiser4/openSUSE_13.2/x86_64

The .spec used file is here
https://build.opensuse.org/package/view_file/home:doiggl/kernel-reiser4?expand=1&file=kernel-reiser4.spec

Thanks to the opensuse-kernel list members for compilation advice.

Patches applied:
reiser4-for-4.5.0.patch

It looks like obs built the rpms.
Post the results to the list.

Cheers Glenn
