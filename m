From: "ionita ioan" <ionut0007@hotmail.com>
Subject: Reiser4 documentation
Date: Wed, 24 Mar 2004 00:39:05 -0500
Message-ID: <BAY99-F42DjFbUcOV1E00010e2a@hotmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17419-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-list@namesys.com

Hello,
After looking at some of the benchmarks for the new Reiser4, I was very=20
excited and decided to try it out. I followed all the steps to patch the=20
kernel, install libaal 0.5.0 (with stand-alone and memory-manager both=20
enabled), reiser4progs-0.5.2 (with stand-alone and symlinks both enabled), =

made the reiser4 partition, was able to mount it and use it,  then decided =

to try to boot from it.  I got the latest version of grub (0.94), applied=20
the latest reiser4 patch for grub-0.94 configured with --enable-reiser4, an=
d=20
found out that the reiser4 stage files had not been built.  After a little =

inquiry, with my limited knowledge, found out that after the configuration,=
=20
the generated config.h had undef for aal-alone and reiser4-alone library an=
d=20
the makefiles contained no instructions for building the reiser4 files. =20
Both libaal-alone and libreiser4-alone exist in /usr/lib and i have issued =

ldconfig repeatedly. I attempted to build grub-0.93 with the reiser4 patch =

from the snapshots page. Again, no reiser4 stage files were created. I am=20
frustrated with the lack of documentation concerning reiser4 bootloader=20
support. I believe that the burden lies on the reiser4 developers at this=20
point, and not the bootloader coders, as long as reiser4 is not released as=
=20
stable. It's in the best interest of the reiser4  coders to add better=20
documentation for this matter, as this would enable more people to test the=
=20
product and maybe report bugs.
Best wishes

_________________________________________________________________
MSN Toolbar provides one-click access to Hotmail from any Web page =96 FREE=
=20
download! http://toolbar.msn.com/go/onm00200413ave/direct/01/

