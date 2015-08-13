From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: "No kernel modules were found" netboot d-i with custom reiser4 kernel.
Date: Thu, 13 Aug 2015 02:45:10 -0700
Message-ID: <CAM12Q5Rbje6nReoTpSDw2Xf6_AxJxH5dhGh7fNTCi=89ogZ+Lg@mail.gmail.com>
References: <CAM12Q5Sh659WuFmOccHdsnFRhdNiKfk9iri9mO1AkJQmHnY2eQ@mail.gmail.com>
	<20150729150045.GC23647@mraw.org>
	<CAM12Q5RUYpU+hKgf5MBGv_puOuWtiUTStVjpSw9GvnTKNyhkCQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5RUYpU+hKgf5MBGv_puOuWtiUTStVjpSw9GvnTKNyhkCQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Brulebois <kibi@debian.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Thu, Jul 30, 2015 at 10:49 PM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> On Wed, Jul 29, 2015 at 8:00 AM, Cyril Brulebois <kibi@debian.org> wrote:
>> Hi,
>>
>> Jose R R <Jose.r.r@metztli-it.com> (2015-07-29):
>>> Niltze, all-
>>>
>>> Building kernel the 'Debian way':
>>>
>>> Replaced abi string at debian/config/defines (from default value of 2)
>>> to a more descriptive string:
>>>
>>> [abi]
>>> abiname: reiser4
>>>
>>> (guided by hint that debian devs sometimes set abiname string "trunk")
>>>
>>> Everything builds beautifully, especially UDEBs for modules/kernel
>>> like couple shown below:
>>> [...]
>>>
>>> 3.7M  kernel-image-4.0.0-reiser4-amd64-di_4.0.8-2_amd64.udeb
>>> 34M   linux-image-4.0.0-reiser4-amd64_4.0.8-2_amd64.deb
>>>
>>> Once kernel build is finished, I place the approxiamately 54 generated
>>> UDEBs at the installer/build/localudebs directory and modify
>>> installer/build/config/amd64.cfg
>>>
>>> # The version of the kernel to use.
>>> ## KERNELVERSION = $(LINUX_KERNEL_ABI)-amd64
>>> KERNELVERSION = 4.0.0-reiser4-amd64
>>> ## KERNELMAJOR = 2.6
>>> KERNELMAJOR = 4.0
>>> KERNELNAME = vmlinuz
>>>
>>> save modifications and execute command:
>>> make build_netboot-gtk
>>>
>>> The resulting netboot d-i iso image uses the custom kernel to start
>>> the Debian installation -- as can be verified by executing in an
>>> alternate shell: uname -a:
>>> Linux [host] 4.0.0-reiser4-amd64 #1 SMP Debian 4.0.8-2 (2015-07-22)
>>> x86_64 GNU/Linux;
>>>
>>> nevertheless stops at 'no kernel modules were found' and thus d-i can
>>> not proceed further to install custom built kernel with reiser4
>>> built-into-the-kernel support -- much less to detect/format a
>>> disk/partition win Reiser4.
>>>
>>> https://pbs.twimg.com/media/CK-ZehmUwAAjx-V.png:large
>>>
>>> Any insight provided will be appreciated. Thanks in advance.
>>
>> Stuff you put under localudebs/ is only used to replace/complement
>> what's in the archive if something pulls it in. You probably want to
>> add some packages to some list under build/pkg-lists.
>
I am making progress as I have built UDEBs for mkfs.reiser4 and fsck.reiser4:
mkreiser4-udeb_1.0.9-2_amd64.udeb
reiser4progs-udeb_1.0.9-2_amd64.udeb

which in turn I have also placed under build/localudebs.

Prior to d-i's: make build_netboot,

I have also specified at build/pkg-lists/netboot/amd64.cfg

mkreiser4-udeb
reiser4progs-udeb
...
ext4-modules-${kernel:Version}
jfs-modules-${kernel:Version}

the above ext/jfs module UDEBs were generated automatically by
building kernel the 'Debian way', but...

QUESTION:
How do I specify -- prior to building a reiser4-patched kernel the
'debian way' -- a directive to build the *extra* reiser4 module  UDEB?

Before/After specifying reiser4 as a module in .config (i.e., make -C
debian/build/build_amd64_none_amd64 menuconfig ), I have tried adding
the reiser4 directive to the debian/rules.gen inside the kernel tree
source -- still it does not generate a reiser4 module UDEB.

It seems the reiser4 module is needed for the d-i to format and
recognize reiser4. Note that by Ctrl -Alt -Fn I am able to go under
the installer shell and format in reiser4 and subsequently modify the
/etc/fstab from an di-JFS-formatted partition --using nano;
subsequently the installer will continue the installation of Debian
into reiser4-formatted media *unaware* that it was *tricked*.

< https://pbs.twimg.com/media/CMR2xY_UEAAA4M3.png:large >

Thanks in advance for any insight.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
