From: Jose R R <Jose.r.r@metztli-it.com>
Subject: "No kernel modules were found" netboot d-i with custom reiser4 kernel.
Date: Wed, 29 Jul 2015 07:52:44 -0700
Message-ID: <CAM12Q5Sh659WuFmOccHdsnFRhdNiKfk9iri9mO1AkJQmHnY2eQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze, all-

Building kernel the 'Debian way':

Replaced abi string at debian/config/defines (from default value of 2)
to a more descriptive string:

[abi]
abiname: reiser4

(guided by hint that debian devs sometimes set abiname string "trunk")

Everything builds beautifully, especially UDEBs for modules/kernel
like couple shown below:
[...]

3.7M  kernel-image-4.0.0-reiser4-amd64-di_4.0.8-2_amd64.udeb
34M   linux-image-4.0.0-reiser4-amd64_4.0.8-2_amd64.deb

Once kernel build is finished, I place the approxiamately 54 generated
UDEBs at the installer/build/localudebs directory and modify
installer/build/config/amd64.cfg

# The version of the kernel to use.
## KERNELVERSION = $(LINUX_KERNEL_ABI)-amd64
KERNELVERSION = 4.0.0-reiser4-amd64
## KERNELMAJOR = 2.6
KERNELMAJOR = 4.0
KERNELNAME = vmlinuz

save modifications and execute command:
make build_netboot-gtk

The resulting netboot d-i iso image uses the custom kernel to start
the Debian installation -- as can be verified by executing in an
alternate shell: uname -a:
Linux [host] 4.0.0-reiser4-amd64 #1 SMP Debian 4.0.8-2 (2015-07-22)
x86_64 GNU/Linux;

nevertheless stops at 'no kernel modules were found' and thus d-i can
not proceed further to install custom built kernel with reiser4
built-into-the-kernel support -- much less to detect/format a
disk/partition win Reiser4.

https://pbs.twimg.com/media/CK-ZehmUwAAjx-V.png:large

Any insight provided will be appreciated. Thanks in advance.


Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
