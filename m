From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 14:48:42 +0200
Message-ID: <20050901144842.34629bcf@SiRiUS.home>
References: <20050901134604.31ddd297@SiRiUS.home>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=Signature_Thu__1_Sep_2005_14_48_42_+0200_Yoe913xV4fRNgD7W;
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-25777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050901134604.31ddd297@SiRiUS.home>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Signature_Thu__1_Sep_2005_14_48_42_+0200_Yoe913xV4fRNgD7W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Sep 2005 13:46:04 +0200
Thomas Kuther <gimpel@sonnenkinder.org> wrote:

> Hello People!
>=20
> Just got a new harddrive and as i'm pretty pleased with reiser4 i
> thought i'll make it reiser4. But then i realized that it uses almost
> 1/6 of the hd "for nothing"
>=20
> mkfs.reiser4 /dev/hde1:
> /dev/hde1  reiser4    222G  7,5M  222G   1% /shared
>=20
> mkfs.reiserfs
> /dev/hde1 reiserfs    233G   33M  233G   1% /shared
>=20
> somehow i had in mind that reiser4 should use much less space than
> reiserfs, but it's exactly the other way round. Loosing 17GB of an
> 250GB disk is hard anyway. but loosing 28GB is simply no go.
>=20
> Now do i need to pass any special options to mkfs.reiser4 or why is
> that? i'm using reiser4progs 1.0.4
>=20
> Thanks in advance
> Tom

OK found out one thing:
Disk /dev/hde: 250.0 GB, 250059350016 bytes <-- crap!=20

# echo "250059350016/1024/1024/1024" | bc
232
^^
but that still doesn't explain why df only sees 222 when formatted with
reiser4.

--Signature_Thu__1_Sep_2005_14_48_42_+0200_Yoe913xV4fRNgD7W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFDFvixaMf8HmTow1YRAsjoAKDVWmAlnXCRiJ8OkuzR4Ka4+IVsBwCcDbf7
/nnrpEOmoI9y41XQGmaUmkw=
=LmkO
-----END PGP SIGNATURE-----

--Signature_Thu__1_Sep_2005_14_48_42_+0200_Yoe913xV4fRNgD7W--
