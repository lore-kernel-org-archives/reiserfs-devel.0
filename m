From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Building kernel the Debian way fails
Date: Fri, 24 Jul 2015 22:23:28 -0700
Message-ID: <CAM12Q5Q0B_kgJ9e8ti2SWaGQwsccGu6zd2-EULz-jvuxXL4Fng@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-kernel@lists.debian.org, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze, all!

Trying to build a Linux kernel the Debian way -- since I need to have
udebs for my project. I am building on Stretch/Sid and have followed
instructions at:

https://wiki.debian.org/DebianInstaller/Modify/CustomKernel
http://kernel-handbook.alioth.debian.org/ch-common-tasks.html#s-common-official

I get the source and decompress it:
apt-get source linux
(tried with linux-4.0.8-1 AND linux-4.0.8-2)

Apply existing patches:
fakeroot debian/rules source

Use quilt to apply Reiser4 patch:
gzip -dc ../reiser4-for-4.0.4.patch.gz | quilt fold
(finishes without errors)

I then change the configuration before build:
fakeroot make -f debian/rules.gen setup_amd64
make -C debian/build/build_amd64_none_amd64 menuconfig
(enable Reiser4 in the kernel and OS/2 HPFS as module)

And build for the amd64 flavour:
fakeroot make -f debian/rules.gen binary-arch_amd64_none_amd64

Procedure executes for a while but then:

[...]
xt_unregister_targets                            module:
net/netfilter/x_tables, version: 0x1ab6dab6 -> 0x967580ea, export:
EXPORT_SYMBOL
yield_to                                         module: vmlinux,
version: 0x64772de8 -> 0x7e986552, export: EXPORT_SYMBOL_GPL
zap_vma_ptes                                     module: vmlinux,
version: 0x51123f12 -> 0xe4761abe, export: EXPORT_SYMBOL_GPL
zero_fill_bio                                    module: vmlinux,
version: 0x999a9bec -> 0x2f0438ba, export: EXPORT_SYMBOL
zerocopy_sg_from_iter                            module: vmlinux,
version: 0x156cb754 -> 0x3396ed70, export: EXPORT_SYMBOL
zl10036_attach                                   module:
drivers/media/dvb-frontends/zl10036, version: 0x01c15872 ->
0x5ad87e01, export: EXPORT_SYMBOL
zl10039_attach                                   module:
drivers/media/dvb-frontends/zl10039, version: 0x4d52eac4 ->
0x99661045, export: EXPORT_SYMBOL
zl10353_attach                                   module:
drivers/media/dvb-frontends/zl10353, version: 0xd7c34f95 ->
0x6f771756, export: EXPORT_SYMBOL

Removed symbols:
bdi_unregister                                   ignored, module:
vmlinux, version: 0xa88ae9e6, export: EXPORT_SYMBOL
debian/rules.real:160: recipe for target
'debian/stamps/build_amd64_none_amd64_plain' failed
make[1]: *** [debian/stamps/build_amd64_none_amd64_plain] Error 1
make[1]: Leaving directory '/mnt/sda8-tekitl/usr/src/linux-4.0.8'
debian/rules.gen:25: recipe for target
'binary-arch_amd64_none_amd64_real' failed
make: *** [binary-arch_amd64_none_amd64_real] Error 2


Thank you in advance for any insight. Appreciated.


Best Professional Regards


-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
