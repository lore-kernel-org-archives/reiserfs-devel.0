From: gimpel <gimpel@sonnenkinder.org>
Subject: Re: Distributions with out-of-the-box Reiser4 support?
Date: Fri, 12 Aug 2005 09:44:50 +0200
Message-ID: <20050812094450.401549ae@SiRiUS.home>
References: <194f6255050810094849b3164e@mail.gmail.com>
	<20050811133149.6528486a@SiRiUS.home>
	<42FC0E94.5020002@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=Signature_Fri__12_Aug_2005_09_44_50_+0200_WgIFyNFO4FvJQ0lZ;
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <reiserfs-list-return-25421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FC0E94.5020002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Clemens Eisserer <linuxhippy@gmail.com>, reiserfs-list@namesys.com

--Signature_Fri__12_Aug_2005_09_44_50_+0200_WgIFyNFO4FvJQ0lZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Aug 2005 19:51:00 -0700
Hans Reiser <reiser@namesys.com> wrote:

> gimpel wrote:
>=20
> >On Wed, 10 Aug 2005 18:48:30 +0200
> >Clemens Eisserer <linuxhippy@gmail.com> wrote:
> >
> > =20
> >
> >>Hello!
> >>
> >>I hope this questions hasn't been asked too often (since it seems to
> >>be a perfect example for this), but I'm not too long on this list
> >>and for what I've seen it hasn't ... so please don't kill me ;-)
> >>
> >>Does anybody know a number of distrbibutions which support reiser4
> >>out of the box (installer, grub, reiserfs4-utils, ...)?
> >>Is opensuse planned to include reiser4?
> >>
> >>For now I am using Fedora but since a long time I feel uncomfortable
> >>with their use-what-we-tell-you policy, they tell me to use ext3 or
> >>gnome for example and if I want to make a different choice a get
> >>anything but not a perfect installation.
> >>
> >>Thank you in advance, lg Clemens
> >>
> >>   =20
> >>
> >
> >
> >SuSE 9.3 has reiser4 support! Also the online kernel-update for SuSE
> >9.2 contains reiser4. reiser4progs of course too :)
> >
> >cheers!
> > =20
> >
> Does installing it for root work?
>=20
No it can't be selected in YaST, the installer/configurator. I think
that's because parted can't handle reiser4 yet, or not correctly. So
one has to use mkfs and copy to get reiser4 as root partition.

--Signature_Fri__12_Aug_2005_09_44_50_+0200_WgIFyNFO4FvJQ0lZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFC/FN421TUzfKRUn4RAgluAJ0ZUk90Veb5Mb107cUsmqcUvz98twCglPOX
8EQWySaz5MBiTb7SaCYvjIA=
=+x0P
-----END PGP SIGNATURE-----

--Signature_Fri__12_Aug_2005_09_44_50_+0200_WgIFyNFO4FvJQ0lZ--
