From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCH 0/7] reiser4: batch discard support (FITRIM ioctl): initial implementation.
Date: Sun, 17 Aug 2014 20:38:31 +0400
Message-ID: <36112491.T42Uk65rmW@intelfx-laptop>
References: <1408290206-7427-1-git-send-email-intelfx100@gmail.com> <5846460.pSnBE1QeaT@intelfx-laptop> <CADW=+3=B_3pKNzph7EtfXNLbVxxn4dxsykm_RF+ayce9RsoVUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1833731.AXTYomZ59G"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=RhKl6MmmtLpG8JaE+0Hr9gH3Udmt8lEesYrSnwJKAWo=;
        b=SYNpgZ+0rk+OeylIlwVHCzbJ3O1xm/7XzSlXJir2mp6l/oRcYBaQGE9KCEih4jnk4S
         LyTQyLaR52U3Z70iTHbmzx3cvA+FNeZSm3hZdk/ioPcxCzVWCBGo7xpTIi8JF2AMJup4
         eI8sZ87bs6MUJrV7o/a2qXfYYLPA0JsjqCw+4dUtVrsdAMnMG/KSNWvGTOPoOYmzL09A
         7hyMJfCzf9U44ODm5Ha0UoxIAkfgCXgZm+fZtwvhGDp7VP3whUO4GNqghlANVx83jPYv
         WyqQx6ILd+k78PZVgwFMcGfPqXyn3pD/RJnpVqMraPTlFwhw5WQfHpeOshEHMe7to313
         Jetg==
In-Reply-To: <CADW=+3=B_3pKNzph7EtfXNLbVxxn4dxsykm_RF+ayce9RsoVUQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>


--nextPart1833731.AXTYomZ59G
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sunday 17 August 2014 at 18:37:11, Du=C5=A1an =C4=8Coli=C4=87 wrote:=
=09
> On Aug 17, 2014 6:18 PM, "Ivan Shapovalov" <intelfx100@gmail.com> wro=
te:
> >
> > On Sunday 17 August 2014 at 18:14:10, Du=C5=A1an =C4=8Coli=C4=87 wr=
ote:
> > > [...]
> > > >
> > > > Points I'm really uncertain of:
> > > > - grabbing fixed amount of space (new BA_SOME_SPACE flag, grabs=
 25% of
> > > disk space)
> > >
> > > Maybe grabbing 25% of remaining empty disk space would be better?=

> >
> > What do you mean by "remaining"? 25% is recalculated on each iterat=
ion.
> > However, the reserved and allocated disk space is reclaimed at the =
end
> > of each iteration, so the amount really stays the same.
> >
> I meant not to grab 25% of whole partition size but grab amount of di=
sk
> space equal to 25% of empty partition space so if we have only 10% of=
 free
> space left we grab only 2.5% of it per iteration so to not get ENOSPA=
CE if
> we used 25% of whole disk size and grabbed whole remaining disk space=
.

Ah. I've meant "25% of free disk space at the moment of discarding".
It's already done the correct way, I've just misworded it.

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> > --
> > Ivan Shapovalov / intelfx /
> >
> > >
> > > > - creation of empty atoms (reiser4_create_atom())
> > > > - handling of empty atoms in commit_current_atom()
> > > >
> > > [...]
--nextPart1833731.AXTYomZ59G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPw2ocACgkQxUKljSIMAnBZhAD/cemSib3HPh1phHZRMFKK5XnJ
mFhQJZnTtMccS+IOI2MA/2GXGCcjn1JNALMIxjMP1FavXNhfO1w9SgvwWvKWssnR
=cfjH
-----END PGP SIGNATURE-----

--nextPart1833731.AXTYomZ59G--

