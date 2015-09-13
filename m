From: Jose R R <jose.r.r@metztli.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Sun, 13 Sep 2015 05:57:23 -0700
Message-ID: <CAM12Q5TCFxqrUpPC37MUWq7bSbu-fq2Ny0-E9iAhVDfECY7U9w@mail.gmail.com>
References: <55E470E0.2070304@gmail.com>
	<CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
	<CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
	<CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
	<1441804577.3968.2.camel@gmail.com>
	<CAM12Q5Q4Si+hAh92gw3pUHL4x9--bqTNbDyNugkKiy3shdBS2Q@mail.gmail.com>
	<1441887004.4227.2.camel@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1441887004.4227.2.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org

Here is some additional info:

A while back, I installed Debian Jessie AMD64 into a KVM virtual
machine and also included the initial non-systemd boot argument:
preseed/late_command="in-target apt-get install -y sysvinit-core"
< https://wiki.debian.org/systemd#Installing_without_systemd >

Afterwards a previous reiser4-patched Linux kernel 4.0.x was installed
into the virtual machine and its root fs was subsequently formatted to
reiser4.. The virtual machine was working fine:
< https://pbs.twimg.com/media/CKIKgoZUAAIFx12.png:large >

Yesterday, I installed into the vm a newer 4.1.6 kernel built "the
debian way" except that it was customized with the newer 4.0.1 Reiser4
patch. Upon rebooting the VM, I captured a sequence of 4 snapshots (by
paging down) that basically recreate the fail that I experienced
priorly in the physical machine:

< https://metztli.it/blog/index.php/ixiptli/non-systemd-debian-sid-reiser4 >

Accordingly, seems the *lack of systemd* is enough for a Debian Sid
instance to create a bad initrd.img. I have no idea if issue only
appears with Reiser4 root fs or if it includes other file systems as
root. Work in progress...

On Thu, Sep 10, 2015 at 5:10 AM, Ivan Shapovalov <intelfx100@gmail.com> wrote:
> On 2015-09-10 at 04:57 -0700, Jose R R wrote:
>> On Wed, Sep 9, 2015 at 6:16 AM, Ivan Shapovalov <intelfx100@gmail.com
>> > wrote:
>> > On 2015-09-09 at 00:54 -0700, Jose R R wrote:
>> > > Scratch my previous issue, Ed. It is *not* related to your new
>> > > Reiser4
>> > > software release 4.0.1 module nor reiser4progs.
>> > >
>> > > My usual development environment is a modified non-systemd Debian
>> > > Sid
>> > > (unstable) on a Reiser4 root partition. The kernels built won't
>> > > boot
>> > > in *that* particular instance due to a least one other additional
>> > > issue:
>> > > target filesystem does not have requested /sbin/init
>> >
>> > Could you please elaborate?
>>
>> I can only describe what's going on; still searching for a solution
>> myself.
>>
>> < http://without-systemd.org/wiki/index.php/Main_Page >
>>
>> initrd.imgs created within a debian Sid environment -- with systemd
>> replaced by init -- will fail to mount new reiser4 root file system
>> during boot; whereas,
>> initrd.imgs created within a debian Sid environment -- with systemd -
>> -
>> will mount *any* (systemd and non-systemd) new reiser4 root fs and
>> boots system -- as it should.
>>
>> Issue closely resembles recent ZFS issue <
>> https://github.com/zfsonlinux/zfs/issues/3605 > except that, in this
>> non-systemd particular case, neither mkinitramfs-tools nor
>> dracut-created initrd.imgs are successful.
>>
>> As I am running a couple of more or less similar AMD64 Debian Sid on
>> Reiser4 root fs, I built the initrd.img for a non-systemd Debian Sid
>> inside the environment of a systemd Debian Sid.
>>
>> I already disassembled an older 3.xy.z initrd and compared its
>> contents with a initrd.img 4.1.6 built into this non-systemd Debian
>> Sid but file trees appears similar.
>>
>> < http://linux.koolsolutions.com/2009/11/12/initramfs-ramfs-tmpfs-com
>> pressed-image/
>> >
>>
>> Thus, a kernel I built in this non-systemd environment (Sept. 07,
>> 2015) can be installed in a systemd environment and it will boot;
>> moreover, I can take the initrd.img produced in the systemd
>> enviroment
>> (during kernel installation) and use it to boot this non-systemd
>> system -- and will proceed smoothly into its new Reiser4 4.0.1 root
>> fs.
>>
>> < https://pbs.twimg.com/media/COiiyUtUkAAw95X.png:large >
>>
>
> Very interesting, thanks for the observations. I'm surprised with the
> fact that systemd makes a difference here...
>
> --
> Ivan Shapovalov / intelfx /
>



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
