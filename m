From: <doiggl@velocitynet.com.au>
Subject: Re: =?UTF-8?Q?reiser=34-kmp-default-=30=2E=31=5F=32=2E=36=2E=33=31=5Frc?=
 =?UTF-8?Q?=35=5Fgit=33=5F=32-=32=38=2E=31=33=20and=20linux=20=32=2E=36=2E?=
 =?UTF-8?Q?=33=31-rc=36-=33-desktop=20kernel=20x=38=36=5F=36=34?=
Date: Mon, 31 Aug 2009 20:29:31 +1000
Message-ID: <a2aeb7e27ebc1cc3d7fd122c9ad3849a@mail.velocitynet.com.au>
References: <99097a45fbbd301a1be32dae065cf74d@mail.velocitynet.com.au> <4A9997DA.605@ontolab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A9997DA.605@ontolab.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Stroetmann <stroetmann@ontolab.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>



On Sat, 29 Aug 2009 23:04:26 +0200, Christian Stroetmann
<stroetmann@ontolab.com> wrote:
> Aloha Glenn;
> 
> You got this problem:
>> Hello,
>> I tried to install reiser 4 module on kernel and got some errors.
>> Im using a 'Live cd' opensuse 11.2 milestone6
>>
>
http://ftp5.gwdg.de/pub/opensuse/distribution/11.2-Milestone6/iso/openSUSE-KDE4-LiveCD-Build0235-x86_64.iso
>>
>> # uname -a
>> Linux linux 2.6.31-rc6-3-desktop #1 SMP PREEMPT 2009-08-17 21:11:11
> +0200
>> x86_64 x86_64 x86_64 GNU/Linux
>>
>> I got the error message below.
>> Any ideas about the error
>> Cheers Glenn
>>
>> # smart install reiser4-kmp-default-0.1_2.6.31_rc5_git3_2-28.13
>> Loading cache...
>>
>> Updating cache...
>>
>
#################################################################################
>> [100%]
>>
>> Computing transaction...
>>
>> Installing packages (3):
>>   kernel-default-2.6.31-2.2@x86_64
>> reiser4-kmp-default-0.1_2.6.31_rc5_git3_2-28.13@x86_64
>>   kernel-default-base-2.6.31-2.2@x86_64
>>
>>
>> 35.5MB of package files are needed. 137.9MB will be used.
>>
>> Confirm changes? (Y/n): y
>>
>> Committing transaction...
>>
>> Preparing...
>>
>
#################################################################################
>> [  0%]
>>    1:Installing kernel-default-base
>>
>
#################################################################################
>> [ 33%]
>> Output from kernel-default-base-2.6.31-2.2@x86_64:
>>
>> Setting up /lib/modules/2.6.31-rc5-git3-2-default
>>
>> /etc/modprobe.conf: No such file or directory
>>
>> /etc/modprobe.conf.local: No such file or directory
>>
>>
>> Kernel image:   /boot/vmlinuz-2.6.31-rc5-git3-2-default
>> Initrd image:   /boot/initrd-2.6.31-rc5-git3-2-default
>> cp: cannot stat `/etc/scsi_id.config': No such file or directory
>> Root device:    /dev/root (mounted on / as defaults)
>> Device root not found in sysfs
>>    2:Installing kernel-default
>> ############################################################# [ 66%]
>> Output from kernel-default-2.6.31-2.2@x86_64:
>>
>> Setting up /lib/modules/2.6.31-rc5-git3-2-default
>>
>> /etc/modprobe.conf: No such file or directory
>>
>> /etc/modprobe.conf.local: No such file or directory
>>
>>
>> Kernel image:   /boot/vmlinuz-2.6.31-rc5-git3-2-default
>> Initrd image:   /boot/initrd-2.6.31-rc5-git3-2-default
>> cp: cannot stat `/etc/scsi_id.config': No such file or directory
>> Root device:    /dev/root (mounted on / as defaults)
>> Device root not found in sysfs
>>    3:Installing reiser4-kmp-default
>> ############################################################# [100%]
>> Output from reiser4-kmp-default-0.1_2.6.31_rc5_git3_2-28.13@x86_64:
>>
>> WARNING: /lib/modules/2.6.31-rc5-git3-2-default/updates/reiser4.ko needs
>> unknown symbol breakpoint
>>
>> Kernel image:   /boot/vmlinuz-2.6.31-rc5-git3-2-default
>> Initrd image:   /boot/initrd-2.6.31-rc5-git3-2-default
>> cp: cannot stat `/etc/scsi_id.config': No such file or directory
>> Root device:    /dev/root (mounted on / as defaults)
>> Device root not found in sysfs
>> error: %post(reiser4-kmp-default-0.1_2.6.31_rc5_git3_2-28.13.x86_64)
>> scriptlet failed, exit status 1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.htm
> Could you solve it?
> 
> As always: Have fun
> Christian *<:o)   O>-<   -(D)>-<

Thanks Christian,
In the past Jeff Mahoney has answered many of my queries about this issue.
I try and use the latest kernel and the latest r4 revision and I report the
result back.
Have not been able to resolve it as yet.
Maybe it shows because Im running from a live cd.
When I get the system dual booting after 11.2 release, may get a different
result.
Reiser4 rpms sourced from:
http://download.opensuse.org/repositories/drivers://filesystems/openSUSE_Factory/
Status ->
https://build.opensuse.org/package/show?package=reiser4-kmp&project=drivers%3Afilesystems

Cheers Glenn

