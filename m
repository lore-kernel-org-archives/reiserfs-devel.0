From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Fri, 14 Dec 2012 07:14:15 +0400
Message-ID: <1389717.RAQAZZVsPt@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <CADW=+3nctUOzekb0NMV88CCqJj2Z8fgC=HjuoesirhNPCBxy_A@mail.gmail.com> <50CA5AEE.2050003@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=ZO4cU1je4TN48Inv3N1QETd+Yjo9xyPgh/BmeIL9dmg=;
        b=IfnvlGovhV8BSzpA39srd3MACiIGtA6efKH1zWWIzXxE0FgMFs0FUX682YPEF6GykG
         wc1FY8MGl3moit/46+ytuSIB5/JDmEYTJfqysY0Tctpsl0t0OKqRNlYPD+5NMJVvrhZS
         CyJGRUgklNWxYhayBgG/iRmWcQUXp/4o2+mhmGY0XgPsalvY6rKxrTrnxlRsd7PnYbAS
         0uMOYpS35bk9IaYUt5Z3SvRWHAR0MpF7Rvi1kcyjqsElve0QQy7hnz7w2W7MDk5fiZ+a
         q9xX5yTJF4jvza1fPWDNkGnCnlMwpgd8uhbBtii8mnhC64irde0NzWBcMYaEDWQ3svsy
         yy4A==
In-Reply-To: <50CA5AEE.2050003@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 13 December 2012 23:47:10 Edward Shishkin wrote:
> On 12/11/2012 09:54 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> > On Tue, Dec 11, 2012 at 7:33 PM, Edward Shishkin
> >=20
> > <edward.shishkin@gmail.com>  wrote:
> >> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
> >>> Hello!
> >>=20
> >> Hello.
> >>=20
> >>> With help of Du=C5=A1an =C4=8Coli=C4=87<dusanc@gmail.com>  who pr=
ovided his kernel
> >>> config
> >>> diff I've found a kernel option which, when disabled, greatly red=
uces
> >>> (hopefully to zero, but need time to verify it) corruption rate i=
n
> >>> reiser4.
> >>>=20
> >>> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by i=
t like
> >>> CONFIG_COMPACTION or CONFIG_MIGRATION).
> >>> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled
> >>=20
> >> How long?
> >=20
> > For me the difference in uptime is months without vs hours with it =
:D
> > on 2.6.39.4
>=20
> Hm, indeed: my setup with enabled migration can not survive even one
> kernel compilation, while with disabled migration everything looks ok=
=2E.

The overnight testing also showed no errors...
So shall we release reiser4-for-3.7 and announce FIXED(?) once again?
:)

Regards,
Ivan.

>=20
> >>>    on kernel
> >>>=20
> >>> 3.6.10, and everything seems to be OK so far (so the workaround i=
s
> >>> version-
> >>> agnostic).
> >>>=20
> >>> Edward, are there any guesses on what can make reiser4 choke on
> >>> hugepages/compaction/migration?
> >>=20
> >> TBH, no ideas. They (hugepages) are _transparent_.
> >> It means we shouldn't suffer in theory ;)
> >>=20
> >>>    I'm not even barely familiar with the kernel
> >>>=20
> >>> internals.
> >>>=20
> >>> Thanks,
> >>> Ivan.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
