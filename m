From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: "No kernel modules were found" netboot d-i with custom reiser4 kernel.
Date: Mon, 24 Aug 2015 01:15:21 -0700
Message-ID: <CAM12Q5QPPQ6CaS=fsbadLfo+xhH5180QLVB7t32unK2C8d0fYw@mail.gmail.com>
References: <CAM12Q5Sh659WuFmOccHdsnFRhdNiKfk9iri9mO1AkJQmHnY2eQ@mail.gmail.com>
	<20150729150045.GC23647@mraw.org>
	<CAM12Q5RUYpU+hKgf5MBGv_puOuWtiUTStVjpSw9GvnTKNyhkCQ@mail.gmail.com>
	<CAM12Q5Rbje6nReoTpSDw2Xf6_AxJxH5dhGh7fNTCi=89ogZ+Lg@mail.gmail.com>
	<1439461210.10857.88.camel@decadent.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1439461210.10857.88.camel@decadent.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Cyril Brulebois <kibi@debian.org>, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze, all!


On Thu, Aug 13, 2015 at 3:20 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Thu, 2015-08-13 at 02:45 -0700, Jose R R wrote:
> [...]
>> QUESTION:
>> How do I specify -- prior to building a reiser4-patched kernel the
>> 'debian way' -- a directive to build the *extra* reiser4 module  UDEB?
>>
>> Before/After specifying reiser4 as a module in .config (i.e., make -C
>> debian/build/build_amd64_none_amd64 menuconfig ), I have tried adding
>> the reiser4 directive to the debian/rules.gen inside the kernel tree
>> source -- still it does not generate a reiser4 module UDEB.
> [...]
>
> Look under debian/installer in the linux source package and read the
> kernel-wedge documentation.
>

After some effort, I was successful in creating the *extra*
reiser4-modules UDEB:
reiser4-modules-4.1.0-2-amd64-di_4.1.5-2_amd64.udeb
for
kernel-image-4.1.0-2-amd64-di_4.1.5-2_amd64.udeb

I included relevant directives in the build/pkg-lists/netboot/amd64.cfg, thus:
[...]
fat-modules-${kernel:Version}
ext4-modules-${kernel:Version}   # Without this, d-i won't know about Ext2/3/4
jfs-modules-${kernel:Version}      # Without this, d-i won't know about JFS
reiser4-modules-${kernel:Version} # Thus I thought this would allow
d-i to *know* about reiser4
mkreiser4-udeb                           # This provides mkfs.reiser4 to d-i
reiser4progs-udeb                        # This provides fsck.reiser4 to d-i
[...]

After "make build_netboot" finished and tested the installation mini.iso:

lsmod: shows reiser4 module (which I loaded manually from the d-i shell utility)
https://pbs.twimg.com/media/CNKHCDyUkAA0lic.png:large

However d-i partman still does not recognize the reiser4-formatted partition:
https://pbs.twimg.com/media/CNKHCDmUcAAc6pT.png:large

Which means, I now should attempt to create a partman-reiser4 udeb for d-i?

Thank you for all your help and I appreciate your hints and suggestions.


Best professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
