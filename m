From: Jose R R <jose.r.r@metztli.com>
Subject: Re: Debian kernel 4.7.2-1 build on Sid and Jessie fails
Date: Sat, 3 Sep 2016 09:14:35 -0700
Message-ID: <CAM12Q5RvH8yVuRtUEzzh9oDTP26HJ3pJYS0uYW3sV882RbuQiw@mail.gmail.com>
References: <20160902103548.87A163318CC@mictlantecuhtli.metztli-it.com> <1472831351.25374.61.camel@decadent.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=SrDspZjWP743OC8NOd44Wka/1XNOmFD44ovuUOCsNJg=;
        b=SAFU8k41GqrAqjY8BS19gq13qECmwtTlQB5JPHkw54+LzEJEP2DrFW8RgIOla6uaA3
         ++04EA0XidARJ22lOx08rXwwXkRQwVsZWByF/IL8HeWVDJTfWZ6vCJW5XQbObS98+9GP
         byOLrOM3+gmD8vJpxMWnVxDgJkBvVjjww44B+fOhaEv+MPtZM2VvRP/SyuoHM/zmIBA8
         pMkI9ckYWnOzT0zg0p705tuoOV5JFEUyH0KXuytE5NZnBSIClx9cNGycMfEXYhppJdUN
         atUugM+bxbQs5HvTkv96OyXw32F/y2/rqS9FHKk4gG/gkJpuZHqFk262cvTZYmbqg8DN
         k9+Q==
In-Reply-To: <1472831351.25374.61.camel@decadent.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: debian-kernel@lists.debian.org, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Much appreciated, Ben!

On Fri, Sep 2, 2016 at 8:49 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Fri, 2016-09-02 at 03:35 -0700, Jose R Rodriguez wrote:
>> Niltze, all!
>>
>> Currently running Reiser4-patched kernel 4.7 built from pristine
>> source upstream:
>>
>> Linux mictlantecuhtli 4.7.0.tezcatlipoca #1 SMP PREEMPT Wed Aug 10
>> 05:04:17 PDT 2016 x86_64 GNU/Linux
>>
>> On the other hand, I have experienced multiple issues building
>> Debian'ized kernel 4.7.2-1 -- first building on Jessie modified for
>> GCC 4.9;
>>  and then attempting build on Jessie-built GCC 5.3. And finally I
>> attempted the build on Debian Unstable and it failed, as well.
>> Below are the offending sections -- which, by the way -- roughly
>> correspond in all instances of Debian and GCC:
> [...]
>
> This happens if you invoke debian/rules directly and not through dpkg-
> buildpackage.
>
> debian/rules.real does:
>
>     ifdef OVERRIDE_HOST_TYPE
>       CROSS_COMPILE := $(OVERRIDE_HOST_TYPE)-
>     else ifneq ($(DEB_BUILD_ARCH),$(DEB_HOST_ARCH))
>       CROSS_COMPILE := $(DEB_HOST_GNU_TYPE)-
>     else
>       CROSS_COMPILE :=
>     endif
>
> So the assumption is that all those architecture variables, or none,
> are defined.  dpkg-buildpackage does define them all.
>
> However, debian/rules does:
>
>     DEB_HOST_ARCH := $(shell dpkg-architecture -qDEB_HOST_ARCH)
>
> and does not define any other architecture variables.
>
> We should probably include /usr/share/dpkg/architecture.mk in
> debian/rules instead.
>
As I began to learn how to build a kernel 'the debian way', I had been
using as reference:

https://kernel-handbook.alioth.debian.org/ch-common-tasks.html#s-common-official-vcs

Accordingly, up to this debian'ized kernel, the directive

fakeroot debian/rules binary-arch

worked well to generate both DEBs *and* UDEBs successfully.

Now, following your advice, Ben, I have replaced the above directive with

dpkg-buildpackage -d -b -us -uc -T binary-arch

(option -d is to override apparent flex dependency show-stopper --
but: "flex is already the newest version", according to apt).

*also* with or without including switches, -us -uc, the kernel build
procedure finishes -- apparently successfully as it generates the
*.deb files; notwithstanding, it fails to generate *.udeb files --
which are required to build Debian-Installer (d-i)

---------------------------------------------------------------

kernel/sound/pci/snd-intel8x0m.ko
                kernel/sound/pci/snd-via82xx-modem.ko
                kernel/sound/synth/emux/snd-emux-synth.ko
                kernel/virt/lib/irqbypass.ko
        kernel-wedge strip-modules 4.7.0-1+reiser4.0.1-amd64
kernel-wedge check kernel-image-4.7.0-1+reiser4.0.1-amd64-di
nic-modules-4.7.0-1+reiser4.0.1-amd64-di
nic-wireless-modules-4.7.0-1+reiser4.0.1-amd64-di
nic-shared-modules-4.7.0-1+reiser4.0.1-amd64-di
serial-modules-4.7.0-1+reiser4.0.1-amd64-di
usb-serial-modules-4.7.0-1+reiser4.0.1-amd64-di
ppp-modules-4.7.0-1+reiser4.0.1-amd64-di
pata-modules-4.7.0-1+reiser4.0.1-amd64-di
cdrom-core-modules-4.7.0-1+reiser4.0.1-amd64-di
firewire-core-modules-4.7.0-1+reiser4.0.1-amd64-di
scsi-core-modules-4.7.0-1+reiser4.0.1-amd64-di
scsi-modules-4.7.0-1+reiser4.0.1-amd64-di
loop-modules-4.7.0-1+reiser4.0.1-amd64-di
btrfs-modules-4.7.0-1+reiser4.0.1-amd64-di
ext4-modules-4.7.0-1+reiser4.0.1-amd64-di
isofs-modules-4.7.0-1+reiser4.0.1-amd64-di
jfs-modules-4.7.0-1+reiser4.0.1-amd64-di
reiser4-modules-4.7.0-1+reiser4.0.1-amd64-di
ntfs-modules-4.7.0-1+reiser4.0.1-amd64-di
xfs-modules-4.7.0-1+reiser4.0.1-amd64-di
fat-modules-4.7.0-1+reiser4.0.1-amd64-di
md-modules-4.7.0-1+reiser4.0.1-amd64-di
multipath-modules-4.7.0-1+reiser4.0.1-amd64-di
usb-modules-4.7.0-1+reiser4.0.1-amd64-di
usb-storage-modules-4.7.0-1+reiser4.0.1-amd64-di
pcmcia-storage-modules-4.7.0-1+reiser4.0.1-amd64-di
fb-modules-4.7.0-1+reiser4.0.1-amd64-di
input-modules-4.7.0-1+reiser4.0.1-amd64-di
event-modules-4.7.0-1+reiser4.0.1-amd64-di
mouse-modules-4.7.0-1+reiser4.0.1-amd64-di
nic-pcmcia-modules-4.7.0-1+reiser4.0.1-amd64-di
pcmcia-modules-4.7.0-1+reiser4.0.1-amd64-di
nic-usb-modules-4.7.0-1+reiser4.0.1-amd64-di
sata-modules-4.7.0-1+reiser4.0.1-amd64-di
core-modules-4.7.0-1+reiser4.0.1-amd64-di
acpi-modules-4.7.0-1+reiser4.0.1-amd64-di
i2c-modules-4.7.0-1+reiser4.0.1-amd64-di
crc-modules-4.7.0-1+reiser4.0.1-amd64-di
crypto-modules-4.7.0-1+reiser4.0.1-amd64-di
crypto-dm-modules-4.7.0-1+reiser4.0.1-amd64-di
efi-modules-4.7.0-1+reiser4.0.1-amd64-di
ata-modules-4.7.0-1+reiser4.0.1-amd64-di
mmc-core-modules-4.7.0-1+reiser4.0.1-amd64-di
mmc-modules-4.7.0-1+reiser4.0.1-amd64-di
nbd-modules-4.7.0-1+reiser4.0.1-amd64-di
squashfs-modules-4.7.0-1+reiser4.0.1-amd64-di
speakup-modules-4.7.0-1+reiser4.0.1-amd64-di
virtio-modules-4.7.0-1+reiser4.0.1-amd64-di
uinput-modules-4.7.0-1+reiser4.0.1-amd64-di
sound-modules-4.7.0-1+reiser4.0.1-amd64-di
hyperv-modules-4.7.0-1+reiser4.0.1-amd64-di
udf-modules-4.7.0-1+reiser4.0.1-amd64-di
fuse-modules-4.7.0-1+reiser4.0.1-amd64-di
dh_fixperms
make[2]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux'
make[1]: Leaving directory '/mnt/sdb5/usr/src/build/tekitl-4.7.2-1/linux'

----------------------------from------------------------------------
http://paste.debian.net/806348/


Thank you again, Ben.


Best Professional Regards

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
