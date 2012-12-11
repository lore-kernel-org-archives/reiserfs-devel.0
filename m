From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Tue, 11 Dec 2012 19:33:39 +0100
Message-ID: <50C77C83.4080402@gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <CADW=+3m2s9Yyi7Da1nieTXjFx=KcfLch+mwoRTB50vGj+mZA=w@mail.gmail.com> <CADW=+3kz__Rd_29Sx8mdiA0b_S11pEsXLYG5AGzjAVBC4Hck8w@mail.gmail.com> <2612159.zxK0OqJdpP@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=aRaZzdYI8jJlNU8iPRo7EllMb6DBSh8waAnkViEPkX4=;
        b=nQo23zZ8/vBduIRQ478vmHxtubUCKa5b/XsWcVXOdTR8mR23/v6fKGmVlgxrT0ldBr
         DREX1ZG+Yl2NiqaHkTXmYqqGsyyVPF8bRrwIO+u5npyGP1Zl8BU4HHiQon9GiG5ImWKb
         dynLOUxRPBOwLXQqLD06l+gTifWm7HTVT5YiHRNWhW107YgA67KSsaIHPv1OzoFFGsZ2
         K69fDL4ETL4b51W87k3ddh2v+M+AZA4wlYMGKOAOLYTD/jznDol0hw8fg/6RPM/QfKRV
         0DwYc7D1ib98eVLexEd/kccNSN6lFhZpPNPajNr8kG4s6Q7rCM9OOhUg+mfVNiVTKCkw
         6cGw==
In-Reply-To: <2612159.zxK0OqJdpP@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, =?UTF-8?B?RHXFoWFuIMSM?= =?UTF-8?B?b2xpxIc=?= <dusanc@gmail.com>

On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
> Hello!

Hello.

>
> With help of Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmail.com> who provid=
ed his kernel config
> diff I've found a kernel option which, when disabled, greatly reduces
> (hopefully to zero, but need time to verify it) corruption rate in re=
iser4.
>
> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by it li=
ke
> CONFIG_COMPACTION or CONFIG_MIGRATION).
> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled

How long?

>   on kernel
> 3.6.10, and everything seems to be OK so far (so the workaround is ve=
rsion-
> agnostic).
>
> Edward, are there any guesses on what can make reiser4 choke on
> hugepages/compaction/migration?

TBH, no ideas. They (hugepages) are _transparent_.
It means we shouldn't suffer in theory ;)

>   I'm not even barely familiar with the kernel
> internals.
>
> Thanks,
> Ivan.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
