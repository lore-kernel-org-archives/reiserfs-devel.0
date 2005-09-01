From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 15:05:07 +0200
Message-ID: <20050901150507.3d6f53c7@SiRiUS.home>
References: <20050901134604.31ddd297@SiRiUS.home>
	<20050901144842.34629bcf@SiRiUS.home>
	<4316F9CC.2090904@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=Signature_Thu__1_Sep_2005_15_05_07_+0200_vYtLn8SyYjD7Hpqy;
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-25780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4316F9CC.2090904@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Signature_Thu__1_Sep_2005_15_05_07_+0200_vYtLn8SyYjD7Hpqy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 01 Sep 2005 16:53:32 +0400
"Vladimir V. Saveliev" <vs@namesys.com> wrote:

> Hello
>=20
> Thomas Kuther wrote:
> > On Thu, 1 Sep 2005 13:46:04 +0200
> > Thomas Kuther <gimpel@sonnenkinder.org> wrote:
> >=20
> >>Hello People!
> >>
> >>Just got a new harddrive and as i'm pretty pleased with reiser4 i
> >>thought i'll make it reiser4. But then i realized that it uses
> >>almost 1/6 of the hd "for nothing"
> >>
> >>mkfs.reiser4 /dev/hde1:
> >>/dev/hde1  reiser4    222G  7,5M  222G   1% /shared
> >>
> >>mkfs.reiserfs
> >>/dev/hde1 reiserfs    233G   33M  233G   1% /shared
> >>
> >>somehow i had in mind that reiser4 should use much less space than
> >>reiserfs, but it's exactly the other way round. Loosing 17GB of an
> >>250GB disk is hard anyway. but loosing 28GB is simply no go.
> >>
> >>Now do i need to pass any special options to mkfs.reiser4 or why is
> >>that? i'm using reiser4progs 1.0.4
> >>
> >>Thanks in advance
> >>Tom
> >=20
> > OK found out one thing:
> > Disk /dev/hde: 250.0 GB, 250059350016 bytes <-- crap!=20
> >=20
> > # echo "250059350016/1024/1024/1024" | bc
> > 232
> > ^^
> > but that still doesn't explain why df only sees 222 when formatted
> > with reiser4.
>=20
> reiser4 reserves 5% of disk space for its internal needs.
>=20

Ah OK, that computes. So i'll go with reiserfs on that big one (11 GB
for internal stuff is too much i have to admit).

Thanks!
Tom

--Signature_Thu__1_Sep_2005_15_05_07_+0200_vYtLn8SyYjD7Hpqy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFDFvyJaMf8HmTow1YRAqW9AJ4hPMI2oU4gEx/6UagglJwvHuxxFgCgjjQY
sS+o+Uw06SFpZn7yal0FY9A=
=/qKm
-----END PGP SIGNATURE-----

--Signature_Thu__1_Sep_2005_15_05_07_+0200_vYtLn8SyYjD7Hpqy--
