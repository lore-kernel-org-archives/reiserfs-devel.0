From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: 2 Terabyte install
Date: Fri, 07 May 2004 11:44:20 -0600
Message-ID: <1083951860.2985.35.camel@wraith.lrp.advansoft.us>
References: <409AC2FF.7080800@lindows.com>
Reply-To: lamont@gurulabs.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-SAZq47qTH4hFxz7m7kkD"
Return-path: <reiserfs-list-return-18542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <409AC2FF.7080800@lindows.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-SAZq47qTH4hFxz7m7kkD
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-05-06 at 16:58, Clifford Beshers wrote:
> What are the current size limitations for disks/partitions/filesystems
> with the following combinations?  My googling has produced
> inconsistent answers.
>         { linux 2.4.24, linux 2.6.5 } X { reiserfs3, reiser4 }
> We have a new machine with a 3-ware 8 port controller (looks like a
> scsi controller to the system, but actually drives 8 ide drives).  We
> have 8 x 300GB drives attached for a total > 2TB.

Under the 2.4 kernels, the VFS limits a single device to 2TB; I think
the exact value, IIRC, is (2^41)-1 bytes.  For the 2.6 kernel, I have
read that this was raised to approximately 16TB, though I have not taken
the time yet to verify this in the source.

> Our IT guy has been unable to install Linspire on it (linux 2.6.5,
> reiserfs3).  I'm about to go look in more detail, but I thought I'd
> find out what the bounds were for sure.

OK, the kernel should not be limiting it (unless there is something
stupid in the 3ware driver).  I think Vitally would the one to answer
whether reiserfs3 could be limiting it. Is mkreiserfs thinking that the
VFS will stop it at 2TB, perhaps?
--=20
Lamont R. Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs, L.C. http://www.GuruLabs.com/

--=-SAZq47qTH4hFxz7m7kkD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAm8r0RK8Q4zt1QRURAqr8AJ9n1jc4TnWbVKR3TRL5HEgyY9ZTdwCgm8O3
UzM1HIWDYE0LwOn3bku9zEw=
=xPoi
-----END PGP SIGNATURE-----

--=-SAZq47qTH4hFxz7m7kkD--

