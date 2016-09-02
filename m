From: jose.r.r@metztli.com (Jose R Rodriguez)
Subject: Debian kernel 4.7.2-1 build on Sid and Jessie fails
Date: Fri,  2 Sep 2016 03:35:48 -0700 (PDT)
Message-ID: <20160902103548.87A163318CC@mictlantecuhtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1472813466; h=From: Date: Message-Id: To: Subject: Sender;
 bh=rM1JM2UUiSiUuOLTBMhtnSQ/KI9Rb6xPgxZMsRPGKlQ=; b=sXdZ/SbKbaUWglUErWwYs13cLB02tkGU3/3HQiy97bl53n7WkQWtRlicYrxJcFmgXDXDsYds
 lS8zd+K2d1eJi6AEJB76xad1bi5PU33cGyPWWWOaV3v3iuMDZnNDRiAwDMsFZ9WasSN/V+z2
 XR3BK56cqsZVkjyEewVH+1vSycY=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-kernel@lists.debian.org, debian-boot@lists.debian.org, reiserfs-devel@vger.kernel.org

Niltze, all!

Currently running Reiser4-patched kernel 4.7 built from pristine source upstream:

Linux mictlantecuhtli 4.7.0.tezcatlipoca #1 SMP PREEMPT Wed Aug 10 05:04:17 PDT 2016 x86_64 GNU/Linux

On the other hand, I have experienced multiple issues building Debian'ized kernel 4.7.2-1 -- first building on Jessie modified for GCC 4.9;
 and then attempting build on Jessie-built GCC 5.3. And finally I attempted the build on Debian Unstable and it failed, as well.
Below are the offending sections -- which, by the way -- roughly correspond in all instances of Debian and GCC:

------Sid Unstable with GCC 5.x and 6.x from Debian repos------------

dh_installchangelogs
dh_installdeb
dh_installman
dh_strip
dh_gencontrol -- -Vkernel:Arch=amd64
Can't exec "-strip": No such file or directory at /usr/share/perl5/Debian/Debhelper/Dh_Lib.pm line 242.
dh_strip: -strip --remove-section=.comment --remove-section=.note debian/linux-cpupower/usr/bin/cpupower failed to to execute: No such file or directory
make[2]: *** [install-cpupower] Error 2
debian/rules.real:538: recipe for target 'install-cpupower' failed
make[2]: *** Waiting for unfinished jobs....
dh_lintian
dh_installdocs
 install -m755 'modpost' '/mnt/sid-buildirectory/usr/src/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
 install -m755 'modpost.real-lsb-32' '/mnt/sid-buildirectory/usr/src/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
 install -m755 'modpost.real-lsb-64' '/mnt/sid-buildirectory/usr/src/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
 install -m755 'modpost.real-msb-32' '/mnt/sid-buildirectory/usr/src/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
 install -m755 'modpost.real-msb-64' '/mnt/sid-buildirectory/usr/src/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'

------------------------------------

 INSTALL usr/include/linux/byteorder/ (2 files)
  INSTALL usr/include/linux/caif/ (2 files)
  INSTALL usr/include/linux/can/ (5 files)
  INSTALL usr/include/linux/dvb/ (8 files)
Can't exec "-strip": No such file or directory at /usr/share/perl5/Debian/Debhelper/Dh_Lib.pm line 242.
dh_strip: -strip --strip-debug --remove-section=.comment --remove-section=.note --enable-deterministic-archives debian/libusbip-dev/usr/lib/libusbip.a failed to to execute: No such file or directory
  INSTALL usr/include/rdma/hfi/ (1 file)
make[2]: *** [install-usbip] Error 2
debian/rules.real:584: recipe for target 'install-usbip' failed
  INSTALL usr/include/rdma/ (6 files)
Can't exec "-objcopy": No such file or directory at /usr/share/perl5/Debian/Debhelper/Dh_Lib.pm line 242.
dh_strip: -objcopy --only-keep-debug --compress-debug-sections debian/liblockdep4.7/usr/lib/x86_64-linux-gnu/liblockdep.so.4.7 debian/.debhelper/liblockdep4.7/dbgsym-root/usr/lib/debug/.build-id/81/6e7b2c74f1a2aff094a8e3a442c3b135461b72.debug failed to to execute: No such file or directory
make[2]: *** [install-liblockdep] Error 2
debian/rules.real:644: recipe for target 'install-liblockdep' failed
  INSTALL usr/include/linux/hdlc/ (1 file)
  INSTALL usr/include/scsi/fc/ (4 files)

-----------------------------------

 INSTALL usr/include/linux/tc_act/ (12 files)
  INSTALL usr/include/linux/usb/ (11 files)
  INSTALL usr/include/linux/ (429 files)
dh_strip
dh_md5sums
Can't exec "-objcopy": No such file or directory at /usr/share/perl5/Debian/Debhelper/Dh_Lib.pm line 242.
dh_strip: -objcopy --only-keep-debug --compress-debug-sections debian/linux-kbuild-4.7/usr/lib/linux-kbuild-4.7/scripts/conmakehash debian/.debhelper/linux-kbuild-4.7/dbgsym-root/usr/lib/debug/.build-id/a3/a76f127dacfc8bf8ebe737d923c0a63aa6aa8e.debug failed to to execute: No such file or directory
make[2]: *** [install-kbuild] Error 2
debian/rules.real:517: recipe for target 'install-kbuild' failed
dh_builddeb -- -Zxz
dpkg-deb: building package 'linux-headers-4.7.0-1+reiser4.0.1-all' in '../linux-headers-4.7.0-1+reiser4.0.1-all_4.7.2-1+reiser4.0.1_amd64.deb'.
dpkg-deb: building package 'linux-headers-4.7.0-1+reiser4.0.1-all-amd64' in '../linux-headers-4.7.0-1+reiser4.0.1-all-amd64_4.7.2-1+reiser4.0.1_amd64.deb'.
make[3]: Leaving directory '/mnt/sid-buildirectory/usr/src/linux'
  INSTALL usr/include/asm/ (65 files)
  CHECK   usr/include/misc/ (1 files)
  CHECK   usr/include/mtd/ (5 files)

----------------------------------

dh_gencontrol --
dh_md5sums
dh_builddeb -- -Zxz
dpkg-deb: building package 'linux-libc-dev' in '../linux-libc-dev_4.7.2-1+reiser4.0.1_amd64.deb'.
make[3]: Leaving directory '/mnt/sid-buildirectory/usr/src/linux'
make[2]: Leaving directory '/mnt/sid-buildirectory/usr/src/linux'
make[1]: *** [binary-arch_amd64_real] Error 2
debian/rules.gen:30: recipe for target 'binary-arch_amd64_real' failed
make[1]: Leaving directory '/mnt/sid-buildirectory/usr/src/linux'
make: *** [binary-arch] Error 2
debian/rules:55: recipe for target 'binary-arch' failed

-----End of Sid fragment errors------------------------------



----------------------------------



------Jessie Stable with GCC 4.9 from Debian repos------------

install -m755 'modpost.real-lsb-64' '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
 install -m755 'modpost.real-msb-32' '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
 install -m755 'modpost.real-msb-64' '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
make[4]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/build/build-tools/scripts/mod'
make[3]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/build/build-tools/scripts'
dh_link /usr/lib/linux-kbuild-4.7 /usr/src/linux-kbuild-4.7
dh_installchangelogs
dh_installdocs
dh_strip
Can't exec "-objcopy": No such file or directory at /usr/share/perl5/Debian/Debhelper/Dh_Lib.pm line 242.
dh_strip: -objcopy --only-keep-debug --compress-debug-sections debian/linux-kbuild-4.7/usr/lib/linux-kbuild-4.7/scripts/conmakehash debian/.debhelper/linux-kbuild-4.7/dbgsym-root/usr/lib/debug/.build-id/3c/9fadf2ee8a92e81301012980c4776ef50ae8de.debug failed to to execute: No such file or directory
make[2]: *** [install-kbuild] Error 2
make[1]: *** [binary-arch_amd64_real] Error 2
make: *** [binary-arch] Error 2
debian/rules.real:517: recipe for target 'install-kbuild' failed
make[2]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux'
debian/rules.gen:30: recipe for target 'binary-arch_amd64_real' failed
make[1]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux'
debian/rules:55: recipe for target 'binary-arch' failed

------Jessie Stable with GCC 4.9 from Debian repos END------------

------------------------------



------Jessie Stable with GCC 5.3 built on this instance BEGIN------------

install -m755 'modpost.real-lsb-64' '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
 install -m755 'modpost.real-msb-32' '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
 install -m755 'modpost.real-msb-64' '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/linux-kbuild-4.7//usr/lib/linux-kbuild-4.7/scripts/mod'
make[4]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/build/build-tools/scripts/mod'
make[3]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux/debian/build/build-tools/scripts'
dh_link /usr/lib/linux-kbuild-4.7 /usr/src/linux-kbuild-4.7
dh_installchangelogs
dh_installdocs
dh_strip
Can't exec "-strip": No such file or directory at /usr/share/perl5/Debian/Debhelper/Dh_Lib.pm line 242.
dh_strip: -strip --remove-section=.comment --remove-section=.note debian/linux-kbuild-4.7/usr/lib/linux-kbuild-4.7/scripts/conmakehash failed to to execute: No such file or directory
make[2]: *** [install-kbuild] Error 2
make[1]: *** [binary-arch_amd64_real] Error 2
make: *** [binary-arch] Error 2
debian/rules.real:517: recipe for target 'install-kbuild' failed
make[2]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux'
debian/rules.gen:30: recipe for target 'binary-arch_amd64_real' failed
make[1]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux'
debian/rules:55: recipe for target 'binary-arch' failed

---------------------------------------------------------------


Any insight would be greately appreciated.


Best Professional Regards.

Download Debian-Reiser4 for free! Reiser4 -enabled Jessie Debian Installer for AMD64 https://sf.net/projects/debian-reiser4/ via @sourceforge
