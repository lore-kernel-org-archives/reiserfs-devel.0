From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Tue, 11 Dec 2012 22:49:47 +0400
Message-ID: <3128977.locbVvMWgS@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <2612159.zxK0OqJdpP@intelfx-laptop> <50C77C83.4080402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=OTOVKpgSI6o/AmJ4h0LGWHISVvuSQrsFF8tBEDS7vIM=;
        b=BEkwn3p79+a5tJGwTcJAtD9FpxpEqoQRHjFrdQZ3lDpNB69/Jr7Bjx4n7oYdb5mYdY
         HoOcSEQLLwdzqdYM3R4DpGQL9wdkqgy85yFOcsHKOMcyKerdusa9XPkbOIr/5Jk1BZCp
         eMuVwsHgHCk+hrI5MjcNs50KicpwQrio6SbHA9f8aYcFId5IiOYHjrGuKzcPSjAkg7Pv
         BiOhGeBTVDlh3BsOTHcIKnURk8ViDxLmzV/y/09JKbu8AazUt/cWcqS4E37z/f9OOx7s
         imZm+cp3zl96eniN9vY1DbJBb26cjpeCSQdgwHEwRYmG/WXLrAQxzJHp/23LdPZvmrDc
         Qbcg==
In-Reply-To: <50C77C83.4080402@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>

On 11 December 2012 19:33:39 Edward Shishkin wrote:
> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
> > Hello!
>=20
> Hello.
>=20
> > With help of Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmail.com> who prov=
ided his kernel config
> > diff I've found a kernel option which, when disabled, greatly reduc=
es
> > (hopefully to zero, but need time to verify it) corruption rate in
> > reiser4.
> >=20
> > It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by it =
like
> > CONFIG_COMPACTION or CONFIG_MIGRATION).
> > For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled
>=20
> How long?

12 hours of indexing, scanning, compiling, repeated execution of
"find <mountpoint> -type f -exec grep wtf {} \;" and so on.

>=20
> >   on kernel
> >=20
> > 3.6.10, and everything seems to be OK so far (so the workaround is
> > version-
> > agnostic).
> >=20
> > Edward, are there any guesses on what can make reiser4 choke on
> > hugepages/compaction/migration?
>=20
> TBH, no ideas. They (hugepages) are _transparent_.
> It means we shouldn't suffer in theory ;)

Maybe it's actually migration who does the damage? If we don't lock the=
 pages=20
properly and they are "stolen" by the migration code... If this is the =
case, I=20
shall eventually get corruptions with current setup (since=20
migration/compaction is not disabled).
If I get them, I'll rebuild without migration at all and will see if=20
corruptions disappear completely. (Then they should disappear, if the=20
prediction is true.)

>=20
> >   I'm not even barely familiar with the kernel
> >=20
> > internals.
> >=20
> > Thanks,
> > Ivan.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
