From: <doiggl@velocitynet.com.au>
Subject: Here is a plain kernel based on 4.2.x with the reiser4 patch enabled.
Date: Mon, 28 Sep 2015 23:36:50 +1000
Message-ID: <5210c8cef34d1be6aec4cb05495abc12@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello,
Here is a plain kernel based on 4.2.x with the reiser4 patch built with
the Opensuse build service system.

patches applied:
patches.kernel.org/patch-4.2.1
patches.rpmify/reiser4-for-4.2.2.patch

The built rpms are here:

->https://build.opensuse.org/package/binaries/home:doiggl/kernel-reiser4?repository=openSUSE_13.2

Architecture: i586

kernel-reiser4-4.2.1-3.1.gd2bbe7f.i686.rpm
kernel-reiser4-4.2.1-3.1.gd2bbe7f.nosrc.rpm
kernel-reiser4-debuginfo-4.2.1-3.1.gd2bbe7f.i686.rpm
kernel-reiser4-debugsource-4.2.1-3.1.gd2bbe7f.i686.rpm
kernel-reiser4-devel-4.2.1-3.1.gd2bbe7f.i686.rpm

Repository has been published Architecture: x86_64

kernel-reiser4-4.2.1-3.1.gd2bbe7f.nosrc.rpm
kernel-reiser4-4.2.1-3.1.gd2bbe7f.x86_64.rpm
kernel-reiser4-debuginfo-4.2.1-3.1.gd2bbe7f.x86_64.rpm
kernel-reiser4-debugsource-4.2.1-3.1.gd2bbe7f.x86_64.rpm
kernel-reiser4-devel-4.2.1-3.1.gd2bbe7f.x86_64.rpm

#
The project is here
->https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl

The log of the build is here {x86_64} as an example. [Its a long buildlog]
->https://build.opensuse.org/build/home:doiggl/openSUSE_13.2/x86_64/kernel-reiser4/_log

The .spec used file is here

->https://build.opensuse.org/package/view_file/home:doiggl/kernel-reiser4?expand=1&file=kernel-reiser4.spec

Thanks to the opensuse-kernel list members for compilation advice.

It looks like obs built the rpms.
Post the results to the list.
