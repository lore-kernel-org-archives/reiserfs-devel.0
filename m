From: <doiggl@velocitynet.com.au>
Subject: Here is a plain kernel based on 3.14.x with the reiser4 patch enabled.
Date: Fri, 09 May 2014 12:43:53 +1000
Message-ID: <e38b27fde6e08d696c81e148358867c7@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Here is a plain kernel based on 3.14.x with the reiser4 patch built with
the Opensuse build service [obs] system.

The project is here

->https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl

The built rpms are here

->
https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser4?repository=openSUSE_Factory

Architecture: i586

    kernel-reiser4-3.14.0-4.1.i686.rpm
    kernel-reiser4-3.14.0-4.1.nosrc.rpm
    kernel-reiser4-debuginfo-3.14.0-4.1.i686.rpm
    kernel-reiser4-debugsource-3.14.0-4.1.i686.rpm
    kernel-reiser4-devel-3.14.0-4.1.i686.rpm
    kernel-reiser4-devel-debuginfo-3.14.0-4.1.i686.rpm

Architecture: x86_64

    kernel-reiser4-3.14.0-4.1.nosrc.rpm
    kernel-reiser4-3.14.0-4.1.x86_64.rpm
    kernel-reiser4-debuginfo-3.14.0-4.1.x86_64.rpm
    kernel-reiser4-debugsource-3.14.0-4.1.x86_64.rpm
    kernel-reiser4-devel-3.14.0-4.1.x86_64.rpm
    kernel-reiser4-devel-debuginfo-3.14.0-4.1.x86_64.rpm

The log of the build is here {x86_64} as an example. [Its a long buildlog]
https://build.opensuse.org/package/live_build_log/home:doiggl/kernel-reiser4/openSUSE_Factory/x86_64

The .spec used file is here

->
https://build.opensuse.org/package/view_file/home:doiggl/kernel-reiser4?expand=1&file=kernel-reiser4.spec

Thanks to the opensuse-kernel list members for compilation advice.
http://lists.opensuse.org/opensuse-kernel/

It looks like obs built the rpms.
Post the results to the list.

Cheers Glenn
