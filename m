From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: Reiserfs Data Recovery
Date: Mon, 8 Mar 2004 12:41:24 -0600
Message-ID: <20040308184124.GE5817@dbz.icequake.net>
References: <404C81B9.4050504@nsanity.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Return-path: <reiserfs-list-return-17127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <404C81B9.4050504@nsanity.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--maH1Gajj2nflutpK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Mon, Mar 08, 2004 at 08:22:49AM -0600, Nick Vahalik wrote:
> My system crashed yesterday (xscreensaver... bah!) and when I rebooted=20
> my /raid partition wouldn't mount. So I ran reiserfsck /dev/sda1 and it=
=20
> said I needed to rebuild my superblock because my Root Super Block 0 was=
=20
> corrupt. So I ran reiserfsck --rebuild-sb /dev/sda1 and after that it=20
> was saying that it failed and I needed to run reiserfsck --rebuild-tree.=
=20

Note: whatever you do, do _not_ touch the second drive of your array
with reiserfsck.  Assuming it is still in the state where it was before
you started playing around, it may be the _only_ thing that ends up
saving your ass!  When you need a new copy of the corrupt filesystem to
play with, just dd the mirror drive *TO* the playground drive (don't
accidentally confuse the if and of), and only play around with the copy
you made.  If worse comes to worse, having a copy of the filesystem that
is not messed around with, will give the RFS pay-for support a better
chance of getting all your data back.

> screwed. Will normal data recovery methods work (like, Encase or=20
> Ontrack?) or is there a better way?

I don't know of any analytic data recovery tool that works with
ReiserFS.  I think your best bet, especially if you depend on this data,
is to suck it up and pay the $20 before something worse happens.
Think about which is worth more... a consulting fee, or all your work.

Good luck!

--=20
Ryan Underwood, <nemesis@icequake.net>

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATL5UIonHnh+67jkRAmeeAJ9p7bgZAwXm6aBHKLJg3DcIaAtp6ACfVmX6
cqMV/0YtAA+i9p5Jo5/4olY=
=Eqp1
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
