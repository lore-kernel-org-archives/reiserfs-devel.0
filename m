From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Reiser4 panic at fs/reiser4/lock.c:434
Date: Thu, 25 Mar 2004 12:41:54 -0700
Message-ID: <1080243714.31969.6.camel@localhost.localdomain>
References: <1080175834.13000.10.camel@localhost.localdomain>
	 <16482.50006.976095.680498@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-N2Xah8eMYddUBpwoNOs9"
Return-path: <reiserfs-list-return-17478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16482.50006.976095.680498@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-N2Xah8eMYddUBpwoNOs9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-03-25 at 04:32, Nikita Danilov wrote:
> Jonathan Briggs writes:
>  > The system is running Linux kernel 2.6.5-rc2.  It's tainted by Nvidia
>  > drivers.
>  >=20
>  > The system was compiling the kernel, and Reiser4 panicked.
>=20
> Was compilation multi-threaded (make -j)?

No, it was just plain make.  There were other programs using the disk at
the same time, though.  Evolution, rhythmbox, other desktop stuff.

[snip]
> Please try following patch:
[patch snipped]

I tried to apply the patch, but it must be against a newer version of
Reiser4.  I haven't been following the internal-testing snapshots.=20
Should I have been?  I'm still using the 2004-02-25 snapshot.  What
should I be using to apply your patch to?

Thanks.
--=20
Jonathan Briggs
jbriggs@esoft.com

--=-N2Xah8eMYddUBpwoNOs9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAYzYCG8fHaOLTWwgRApc7AKCOrVg6Y4G46RiwQH2oOOk/lbfWegCfeAQ6
ipdrrZ+5edGOpODGRtjVKq4=
=j1pd
-----END PGP SIGNATURE-----

--=-N2Xah8eMYddUBpwoNOs9--

