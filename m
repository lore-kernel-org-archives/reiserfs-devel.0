From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Thu, 17 Sep 2015 16:31:17 +0200
Message-ID: <55FACEB5.6040803@gmail.com>
References: <55E470E0.2070304@gmail.com>
 <CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
 <CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
 <CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
 <1441804577.3968.2.camel@gmail.com>
 <CAM12Q5Q4Si+hAh92gw3pUHL4x9--bqTNbDyNugkKiy3shdBS2Q@mail.gmail.com>
 <1441887004.4227.2.camel@gmail.com>
 <CAM12Q5TCFxqrUpPC37MUWq7bSbu-fq2Ny0-E9iAhVDfECY7U9w@mail.gmail.com>
 <1442149593.3827.1.camel@gmail.com>
 <CAM12Q5QySio0eJMYe91YQEB19Z+xwmJ6sjVEKDD9Be8TCf5Bvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090302000803020005070601"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type;
        bh=yJqBk4zsQw+e8+IHEvJFTD8hKQMNgPXPct+7DCbSeT8=;
        b=DOEJjPQ2AJpYDS5GKjiyY+d+cU5WLWBPqDFYQVQEioP1uqe6M3QKuAagDiG7cqibEY
         G24AqEeMdsVVQ/DiBJiLvoTE9RXhw/5TdyC3sJDoVsI6G7kASEKpRDc7DuGgTOov/x/k
         Q84Ff5ZZO7may9NVm+YVS0CIvEV5EAK8d0zPPBir+VGh08zCsoI+2wGnobK+A1R2eonW
         pa42+4dk0wrkq8bMLFqYu927T29ognbJ/Ei2KZK7NjEkPdOwgPDFd7AUcT8YEc0a2hiL
         X/X8tqkJmahAeq+9Rv8PUEn2N4v0LQQXY5N2ag1wi6n71mq8hIjb8sFYxxnAIClGPwxO
         Rqfw==
In-Reply-To: <CAM12Q5QySio0eJMYe91YQEB19Z+xwmJ6sjVEKDD9Be8TCf5Bvg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <jose.r.r@metztli.com>, Ivan Shapovalov <intelfx100@gmail.com>
Cc: =?UTF-8?Q?Milan_Bu=c5=a1ka?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org

This is a multi-part message in MIME format.
--------------090302000803020005070601
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Does the attached patch help?

Edward.

On 09/17/2015 02:10 PM, Jose R R wrote:
> On Sun, Sep 13, 2015 at 6:06 AM, Ivan Shapovalov <intelfx100@gmail.com> wrote:
>> On 2015-09-13 at 05:57 -0700, Jose R R wrote:
>>> Here is some additional info:
>>>
>>> A while back, I installed Debian Jessie AMD64 into a KVM virtual
>>> machine and also included the initial non-systemd boot argument:
>>> preseed/late_command="in-target apt-get install -y sysvinit-core"
>>> < https://wiki.debian.org/systemd#Installing_without_systemd >
>>>
>>> Afterwards a previous reiser4-patched Linux kernel 4.0.x was
>>> installed
>>> into the virtual machine and its root fs was subsequently formatted
>>> to
>>> reiser4.. The virtual machine was working fine:
>>> < https://pbs.twimg.com/media/CKIKgoZUAAIFx12.png:large >
>>>
>>> Yesterday, I installed into the vm a newer 4.1.6 kernel built "the
>>> debian way" except that it was customized with the newer 4.0.1
>>> Reiser4
>>> patch. Upon rebooting the VM, I captured a sequence of 4 snapshots
>>> (by
>>> paging down) that basically recreate the fail that I experienced
>>> priorly in the physical machine:
>>>
>>> < https://metztli.it/blog/index.php/ixiptli/non-systemd-debian-sid-re
>>> iser4 >
>>>
>>> Accordingly, seems the *lack of systemd* is enough for a Debian Sid
>>> instance to create a bad initrd.img. I have no idea if issue only
>>> appears with Reiser4 root fs or if it includes other file systems as
>>> root. Work in progress...
>> It's presence/absence of crc32c module that matters. Reiser4 does not
>> specify that it needs one.
>>
> Applied your 3 patches
> 1/3 < http://marc.info/?l=reiserfs-devel&m=144218573602435&w=2 >
> 2/3 < http://marc.info/?l=reiserfs-devel&m=144218573602436&w=2 >
> 3/3 < http://marc.info/?l=reiserfs-devel&m=144218573702437&w=2 >
>
> into kernel.org Linux Kernel 4.1.7, but Non-systemd Debian still boots
> into an emergency shell
> [...]
> mount: mounting /dev/sdaX on /root failed: no such file or directory
> Target fileystem doesn't have requested /sbin/init
> mount: mounting /dev on /root/dev failed: no such file or directory
> No init found. Try passing init= bootarg.
> [...]
>
> Typing dmesg:
> [...]
> reiser4[exe(801)]: reiser4_init_csum_tfm
> (fs/reiser4/checksum.c:11)[intelfx-81]:WARNING: Could not load crc32c
> driver
>
> In a couple of days I will build the kernel "the Debian way"; I will
> specify -- in relevant module section, at file [kernel source
> tree]debian/installer/package-list:
> [...]
>
> Package: reiser4-modules
> Depends: kernel-image crc-modules # <--- will add that
> Priority: extra
> Description: Reiser4 filesystem support
>   This package contains the Reiser4 filesystem module for the kernel.
> [...]
>
> As well as at /usr/share/kernel-wedge/package-list
>
> We will see what happens.
>
>
>> --
>> Ivan Shapovalov / intelfx /
>>
>
>


--------------090302000803020005070601
Content-Type: text/x-patch;
 name="reiser4-select-crc32c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-select-crc32c.patch"

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/fs/reiser4/Kconfig
+++ b/fs/reiser4/Kconfig
@@ -5,6 +5,7 @@ config REISER4_FS
 	select LZO_COMPRESS
 	select LZO_DECOMPRESS
 	select CRYPTO
+	select CRYPTO_CRC32C
 	help
 	  Reiser4 is a filesystem that performs all filesystem operations
 	  as atomic transactions, which means that it either performs a

--------------090302000803020005070601--
