From: Zan Lynx <zlynx@acm.org>
Subject: Re: [patch] reiser4: do not allocate struct file on stack
Date: Fri, 05 Oct 2007 10:22:38 -0600
Message-ID: <1191601358.61085.3.camel@localhost>
References: <1190930060.7667.5.camel@localhost>
	 <20070928013024.c7522542.akpm@linux-foundation.org>
	 <1190996517.7344.79.camel@localhost> <46FD8298.5020804@namesys.com>
	 <470575AE.9060902@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-I9ZjS6mjovJOpyl5Q7i2"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932090AbXJEQXP@vger.kernel.org>
In-Reply-To: <470575AE.9060902@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Vladimir V. Saveliev" <vs@clusterfs.com>, Dave Hansen <haveblue@us.ibm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, reiserfs-devel <reiserfs-devel@vger.kernel.org>, hch <hch@infradead.org>


--=-I9ZjS6mjovJOpyl5Q7i2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2007-10-05 at 03:22 +0400, Edward Shishkin wrote:
> Edward Shishkin wrote:
>=20
> > Dave Hansen wrote:
> >
> ...
>=20
> >>
> >> I think that stack allocation is a pretty nasty trick for a structure
> >> that's supposed to be pretty persistent and dynamically allocated, and
> >> is certainly something that needs to get fixed up in a proper way.
> >>
> >>
> >
> > agreed.
> >
> >> This works around the problem for now, but this could potentially caus=
e
> >> more bugs any time we add some member to 'struct file' and depend on i=
ts
> >> state being sane anywhere in the VFS. If there's a list anywhere of
> >> merge-stopper reiser4 bugs around, this should probably go in there.
> >>
> >>
> >
> > will be fixed.
> >
>=20
> The promised fixup is attached.
> Andrew, please apply.
>=20
> Thanks,
> Edward.

There were several copies of this email, so I picked one. :)

I had the crash with 2.6.23-rc8-mm2, so I applied this patch.  Hunk #1
failed, the rest applied with fuzz.  I manually applied hunk #1 and
recompiled.

I am now running with 2.6.23-rc8-mm2 + this patch and things seem good.

(Except for some issues with ACPI battery info moving out of proc and
confusing the heck out of HAL and the GNOME power management scripts).
--=20
Zan Lynx <zlynx@acm.org>

--=-I9ZjS6mjovJOpyl5Q7i2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQBHBmTOG8fHaOLTWwgRAsgeAJ9iNWOUT5HcGxy2uOSpB8/4S6RQtACfbTuu
FYt68Kg4UpK2NPYk5Yun05U=
=hT8B
-----END PGP SIGNATURE-----

--=-I9ZjS6mjovJOpyl5Q7i2--
