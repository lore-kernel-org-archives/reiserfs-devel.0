From: Jose R R <jose.r.r@metztli.com>
Subject: Re: Building kernel the Debian way fails
Date: Fri, 24 Jul 2015 23:19:15 -0700
Message-ID: <CAM12Q5S6VHj8CydLzQHPjQr8Kaq2TguAeQr-ZgX+RpD1L6nT1A@mail.gmail.com>
References: <CAM12Q5Q0B_kgJ9e8ti2SWaGQwsccGu6zd2-EULz-jvuxXL4Fng@mail.gmail.com>
	<20150725085637.41359b1a@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20150725085637.41359b1a@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D1=81=D1=82=D0=B2=D1=83=D0=B9=D1=82=D0=B5=
, Dimas-

On Fri, Jul 24, 2015 at 10:56 PM, dimas <dimas000@ya.ru> wrote:
> firstly, why don't you use make-kpkg to build?

I need the udebs to create a custom Debian Installation (d-i) CD media.

> and does unpatcheed kernel build? seems, there is nothing relevant to=
 r4

Indeed I can build relevant Linux kernel with Reiser4 support the
non-debian, way but I would not get the needed udebs ;-)

, but
> to xtables

In my query I had to include *all* the variables if I expect to
receive more relevant suggestions.


>
>
> 2015-205 22:23 Jose R R <Jose.r.r@metztli-it.com> wrote:
>> Niltze, all!
>>
>> Trying to build a Linux kernel the Debian way -- since I need to hav=
e
>> udebs for my project. I am building on Stretch/Sid and have followed
>> instructions at:
>>
>> https://wiki.debian.org/DebianInstaller/Modify/CustomKernel
>> http://kernel-handbook.alioth.debian.org/ch-common-tasks.html#s-comm=
on-official
>>
>> I get the source and decompress it:
>> apt-get source linux
>> (tried with linux-4.0.8-1 AND linux-4.0.8-2)
>>
>> Apply existing patches:
>> fakeroot debian/rules source
>>
>> Use quilt to apply Reiser4 patch:
>> gzip -dc ../reiser4-for-4.0.4.patch.gz | quilt fold
>> (finishes without errors)
>>
>> I then change the configuration before build:
>> fakeroot make -f debian/rules.gen setup_amd64
>> make -C debian/build/build_amd64_none_amd64 menuconfig
>> (enable Reiser4 in the kernel and OS/2 HPFS as module)
>>
>> And build for the amd64 flavour:
>> fakeroot make -f debian/rules.gen binary-arch_amd64_none_amd64
>>
>> Procedure executes for a while but then:
>>
>> [...]
>> xt_unregister_targets                            module:
>> net/netfilter/x_tables, version: 0x1ab6dab6 -> 0x967580ea, export:
>> EXPORT_SYMBOL
>> yield_to                                         module: vmlinux,
>> version: 0x64772de8 -> 0x7e986552, export: EXPORT_SYMBOL_GPL
>> zap_vma_ptes                                     module: vmlinux,
>> version: 0x51123f12 -> 0xe4761abe, export: EXPORT_SYMBOL_GPL
>> zero_fill_bio                                    module: vmlinux,
>> version: 0x999a9bec -> 0x2f0438ba, export: EXPORT_SYMBOL
>> zerocopy_sg_from_iter                            module: vmlinux,
>> version: 0x156cb754 -> 0x3396ed70, export: EXPORT_SYMBOL
>> zl10036_attach                                   module:
>> drivers/media/dvb-frontends/zl10036, version: 0x01c15872 ->
>> 0x5ad87e01, export: EXPORT_SYMBOL
>> zl10039_attach                                   module:
>> drivers/media/dvb-frontends/zl10039, version: 0x4d52eac4 ->
>> 0x99661045, export: EXPORT_SYMBOL
>> zl10353_attach                                   module:
>> drivers/media/dvb-frontends/zl10353, version: 0xd7c34f95 ->
>> 0x6f771756, export: EXPORT_SYMBOL
>>
>> Removed symbols:
>> bdi_unregister                                   ignored, module:
>> vmlinux, version: 0xa88ae9e6, export: EXPORT_SYMBOL
>> debian/rules.real:160: recipe for target
>> 'debian/stamps/build_amd64_none_amd64_plain' failed
>> make[1]: *** [debian/stamps/build_amd64_none_amd64_plain] Error 1
>> make[1]: Leaving directory '/mnt/sda8-tekitl/usr/src/linux-4.0.8'
>> debian/rules.gen:25: recipe for target
>> 'binary-arch_amd64_none_amd64_real' failed
>> make: *** [binary-arch_amd64_none_amd64_real] Error 2
>>
>>
>> Thank you in advance for any insight. Appreciated.
>>
>>
>> Best Professional Regards
>>

Cheers!

--=20
Jose R R
http://www.metztli-it.com
-----------------------------------------------------------------------=
----------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
-----------------------------------------------------------------------=
----------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy =
way!
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
