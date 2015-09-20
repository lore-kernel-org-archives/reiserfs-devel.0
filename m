From: Jose R R <jose.r.r@metztli.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Sun, 20 Sep 2015 06:48:18 -0700
Message-ID: <CAM12Q5SvTNm4XCycPgpP6cxiYWgtQx846JkSnYWvVQN=aNPNbA@mail.gmail.com>
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
	<1442505391.4102.6.camel@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1442505391.4102.6.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org

On Thu, Sep 17, 2015 at 8:56 AM, Ivan Shapovalov <intelfx100@gmail.com> wrote:
> On 2015-09-17 at 05:10 -0700, Jose R R wrote:
>> On Sun, Sep 13, 2015 at 6:06 AM, Ivan Shapovalov <
>> intelfx100@gmail.com> wrote:
>> > On 2015-09-13 at 05:57 -0700, Jose R R wrote:
>> > > Here is some additional info:
>> > >
>> > > A while back, I installed Debian Jessie AMD64 into a KVM virtual
>> > > machine and also included the initial non-systemd boot argument:
>> > > preseed/late_command="in-target apt-get install -y sysvinit-core"
>> > > < https://wiki.debian.org/systemd#Installing_without_systemd >
>> > >
>> > > Afterwards a previous reiser4-patched Linux kernel 4.0.x was
>> > > installed
>> > > into the virtual machine and its root fs was subsequently
>> > > formatted
>> > > to
>> > > reiser4.. The virtual machine was working fine:
>> > > < https://pbs.twimg.com/media/CKIKgoZUAAIFx12.png:large >
>> > >
>> > > Yesterday, I installed into the vm a newer 4.1.6 kernel built
>> > > "the
>> > > debian way" except that it was customized with the newer 4.0.1
>> > > Reiser4
>> > > patch. Upon rebooting the VM, I captured a sequence of 4
>> > > snapshots
>> > > (by
>> > > paging down) that basically recreate the fail that I experienced
>> > > priorly in the physical machine:
>> > >
>> > > < https://metztli.it/blog/index.php/ixiptli/non-systemd-debian-si
>> > > d-re
>> > > iser4 >
>> > >
>> > > Accordingly, seems the *lack of systemd* is enough for a Debian
>> > > Sid
>> > > instance to create a bad initrd.img. I have no idea if issue only
>> > > appears with Reiser4 root fs or if it includes other file systems
>> > > as
>> > > root. Work in progress...
>> >
>> > It's presence/absence of crc32c module that matters. Reiser4 does
>> > not
>> > specify that it needs one.
>> >
>> Applied your 3 patches
>> 1/3 < http://marc.info/?l=reiserfs-devel&m=144218573602435&w=2 >
>> 2/3 < http://marc.info/?l=reiserfs-devel&m=144218573602436&w=2 >
>> 3/3 < http://marc.info/?l=reiserfs-devel&m=144218573702437&w=2 >
>>
>> into kernel.org Linux Kernel 4.1.7, but Non-systemd Debian still
>> boots
>> into an emergency shell
>> [...]
>> mount: mounting /dev/sdaX on /root failed: no such file or directory
>> Target fileystem doesn't have requested /sbin/init
>> mount: mounting /dev on /root/dev failed: no such file or directory
>> No init found. Try passing init= bootarg.
>> [...]
>
> Correct; it's now a "cleanly" reported error instead of an oops.
> You will have to manually add crc32c or crc32c_intel module to the
> initramfs, though. I could not find a way to express an explicit
> intermodule dependency in the code (to make module reiser4 depend on
> module crc32c).
>
> Edward's patch selects module crc32c when reiser4 is selected in the
> build config, but it does not make sure that crc32c will end up in the
> initramfs if reiser4 is there (that is, modules.dep will not be
> altered). I'm still wondering how to do that properly.
>
I applied Ed's patch, as well
< http://marc.info/?l=reiserfs-devel&m=144250028326153&w=2 >
but the non-systemd Debian instance continued to generate a bad initrd.img-.

Notwithstanding, based on your suggestions, Ivan, the solution that
works for non-systemd system is to include module directive
crc32c_intel right *before* module reiser4 directive in debian's
/etc/initramfs-tools/modules file, thus:
[...]
crc32c_intel
reiser4
[...]

and those modules will be included during initramfs-tools creation of
initrd.img-<version> file.

Thus, for a new Reiser4(4.0.1)-patched kernel image created "the
debian way", having an initrd image like: initrd.img-4.1.0-2-amd64,

update-initramfs -dk 4.1.0-2-amd64  # Removes (-d) an existing version
(-k) initramfs
update-initramfs -ck 4.1.0-2-amd64   # Creates (-c) a new version (-k) initramfs

Thus, the non-systemd Debian will generate a proper
initrd.img-<version> which will contain *both* sequenced modules *and*
will be able to successfully boot the sysvinit-based system.

I have been running a small PoC non-systemd Debian Jessie, with
Reiser4-patched Linux kernel, on Google Compute Engine (GCE)
infrastructure for over two months now[1].

< https://pbs.twimg.com/media/CPWcGMQVEAElVdi.png:large >

And I was concerned about its survival if this issue persisted.

Thank you all.


Best Professional Regards.


[1]< http://marc.info/?l=reiserfs-devel&m=143237396102328&w=2 >


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
