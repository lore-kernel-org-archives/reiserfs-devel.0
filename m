From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Wed, 12 Dec 2012 07:23:53 +0400
Message-ID: <11611692.SVSRPcoVIL@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <50C77C83.4080402@gmail.com> <3128977.locbVvMWgS@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=oj5bwQ/vXsyJR5w3FiB0ylTueFSQUqkJQhYfJ+XF8qE=;
        b=BRIk94hhtUfLHbh+hLaKAsT5fHswqOd7a3H4b3liRZk5xwghLaCa4RqNrsYrHW7q5T
         iAvPjAFCyqPh9bLjnSKqHJt09speznqErxkAhhfP8RtytIl0Yur94YNZ70qWXtL3dNHz
         38zeaY1Af6sSQWJ9OP+pzsRySKPAdhHQvyk+INJvWQcEFQUQfnMUeUMOQBolZzXk9U5U
         SiW+ZkGo5BgY6u4b05e41M/ZrTiqQoKOJ7TDVJ5kZye7JVx2a8AhhInpZYog43RJW3/L
         oZVqnkdD9DwKHqvFgWaoRbMmi8UfC6YLkCHPi563xEK4o2bmEYjgls3pRibA6ACNW6iP
         TQxg==
In-Reply-To: <3128977.locbVvMWgS@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>

On 11 December 2012 22:49:47 Ivan Shapovalov wrote:
> On 11 December 2012 19:33:39 Edward Shishkin wrote:
> > On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
> > > Hello!
> >=20
> > Hello.
> >=20
> > > With help of Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmail.com> who pr=
ovided his kernel
> > > config
> > > diff I've found a kernel option which, when disabled, greatly red=
uces
> > > (hopefully to zero, but need time to verify it) corruption rate i=
n
> > > reiser4.
> > >=20
> > > It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by i=
t like
> > > CONFIG_COMPACTION or CONFIG_MIGRATION).
> > > For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled
> >=20
> > How long?
>=20
> 12 hours of indexing, scanning, compiling, repeated execution of
> "find <mountpoint> -type f -exec grep wtf {} \;" and so on.
>=20
> > >   on kernel
> > >=20
> > > 3.6.10, and everything seems to be OK so far (so the workaround i=
s
> > > version-
> > > agnostic).
> > >=20
> > > Edward, are there any guesses on what can make reiser4 choke on
> > > hugepages/compaction/migration?
> >=20
> > TBH, no ideas. They (hugepages) are _transparent_.
> > It means we shouldn't suffer in theory ;)
>=20
> Maybe it's actually migration who does the damage? If we don't lock t=
he
> pages properly and they are "stolen" by the migration code... If this=
 is
> the case, I shall eventually get corruptions with current setup (sinc=
e
> migration/compaction is not disabled).
> If I get them, I'll rebuild without migration at all and will see if
> corruptions disappear completely. (Then they should disappear, if the
> prediction is true.)

=2E..So, the kernel did not pass the overnight testing with usual error=
s of=20
"cluster corrupted" and etc (which is just as planned).

I'm now rebuilding without CONFIG_COMPACTION and CONFIG_MIGRATION.

>=20
> > >   I'm not even barely familiar with the kernel
> > >=20
> > > internals.
> > >=20
> > > Thanks,
> > > Ivan.
--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=A8=D0=B0=D0=BF=D0=BE=D0=B2=D0=B0=D0=BB=D0=BE=D0=B2 =D0=98=D0=B2=D0=B0=
=D0=BD.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
