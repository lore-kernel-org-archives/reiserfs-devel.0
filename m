From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Building kernel the Debian way fails
Date: Sat, 25 Jul 2015 08:12:42 -0700
Message-ID: <CAM12Q5S3rsaOR0H+n4x0fyCJKzGbkC8aCGti0Pudo4ZfLMt_VQ@mail.gmail.com>
References: <CAM12Q5Q0B_kgJ9e8ti2SWaGQwsccGu6zd2-EULz-jvuxXL4Fng@mail.gmail.com>
	<1437836335.12842.7.camel@decadent.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1437836335.12842.7.camel@decadent.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: debian-kernel@lists.debian.org, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Appreciated, Ben!


On Sat, Jul 25, 2015 at 7:58 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Fri, 2015-07-24 at 22:23 -0700, Jose R R wrote:
> [...]
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
> [...]
>
> See
> <http://kernel-handbook.alioth.debian.org/ch-versions.html#s-abi-maintenance>
>
> Ben.
>
> --
> Ben Hutchings
> It is easier to change the specification to fit the program than vice versa.
>

A couple of hours ago I increased the abi and repeated the
instructions for the procedure -- which finally ended successfully.


Best Professional Regards.

-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
