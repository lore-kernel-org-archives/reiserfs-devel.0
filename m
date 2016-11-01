From: jose@mictlantecuhtli.metztli-it.com (Jose R Rodriguez)
Subject: Debian GCC6 and reiser4-patched Linux kernel build issues
Date: Tue,  1 Nov 2016 10:59:11 -0700 (PDT)
Message-ID: <20161101175911.6BDFD303179@mictlantecuhtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1478023153; h=From: Date: Message-Id: To: Subject: Sender;
 bh=E5FIpPIzeeSQ8bNHAJ8jP1aZAIznDVVOefSs9ShE6Ro=; b=Op0btK2etuVoNbQFSMr9rCJNah53zrgsutlkQFD2vDpWHcRQR/Xj5lwtXI8B34fM/9EEfp+w
 tqveqinfVCQf3fXlf6ScPsqlDE5ZapAnEnIv7s7QtoiRGxTtjLY3v3WtZRhRSyKDDnj0lmqC
 BR7O73wmyofQUu3o+wHV3F82BvE=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

---------- Forwarded message ----------
From: Jose R R <Jose[]@metztli.it>
Date: Tue, Nov 1, 2016 at 10:25 AM
Subject: Re: Bug#841368: gcc-6 6.2.0-7 breaks kernel build if stack protection is enabled
To: Konstantin Demin <rock[]@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


On Tue, Nov 1, 2016 at 8:04 AM, Konstantin Demin <rockdrilla@gmail.com> wrote:
> Nota bene: please answer to this mail directly without CC-ing to
> debian mailing lists ;)
>
> I've done refactor on top of debian source package "linux".
> If you're interested, I'll send you sources :)
>
> $ dpkg-parsechangelog
> Source: linux
> Version: 4.8.6-1000
> Distribution: experimental
> Urgency: high
> Maintainer: Konstantin Demin <rockdrilla@gmail.com>
> Timestamp: 1477980554
> Date: Tue, 01 Nov 2016 09:09:14 +0300
> Changes:
> linux (4.8.6-1000) experimental; urgency=high
> .
>   * New upstream release: https://kernelnewbies.org/Linux_4.8
>   * New upstream stable update:
>     https://www.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.8.1
>     https://www.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.8.2
>     https://www.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.8.3
>     https://www.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.8.4
>     https://www.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.8.5
>     https://www.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.8.6
> .
>   [ Konstantin Demin ]
>   * merge changes from Debian
>   * drop Debian DFSG patches (I'll go to hell for this)
>   * drop patches for unsupported architectures (and this too)
>   * update 3rd party patches:
>     - AuFS:  4.7-20160912  >  4.8-20161010
>     - BFQ:   4.7-v8r3      >  4.8-v8r4
>     - BFS:   4.7-502+      >  4.8-512+
>     - UKSM:  4.7-0.1.2.5   >  4.8-0.1.2.5
>   * refresh patches
>   * update configs
>
> --
> SY,
> Konstantin Demin

If shared your particular flags to debian bug list was to provide additional input so they can fix the GCC6 issue upstream -- as it is very annoying.

I build most of my kernels patched with Reiser4 as that is the environment where I work, even in the Google Compute Engine (GCE) Cloud.
Additionally, I have built a Reiser4-enabled Jessie Debian-Installer (d-i), which I offer free to download at SourceForge:

Please see: https://sf.net/projects/debian-reiser4/

At the moment I am sticking to Linux kernel 4.7.x since reiser4 patch does not currently apply to 4.8.x - but thanks for your kind offer.

We will keep in touch.


Best Professional Regards.
-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------

