From: Alex Malinovich <demonbane@the-love-shack.net>
Subject: Re: --rebuild-tree with bad blocks (Was: Need a boot disk...)
Date: Fri, 31 Oct 2003 12:51:27 -0600
Message-ID: <1067626286.727.10.camel@Gollum>
References: <20031030181457.GA31387@the-love-shack.net>
	 <Pine.LNX.4.58.0310301336010.8142@renaissance.laroia.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-mYDre8viAIvxVuo4ehNM"
Return-path: <reiserfs-list-return-15952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0310301336010.8142@renaissance.laroia.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-mYDre8viAIvxVuo4ehNM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-10-30 at 12:38, Asheesh Laroia wrote:
> Consider booting from a recent version of Knoppix.  Even if it doesn't
> have the tools you need, you'll be able to download them and install them
> in the ramdisk Knoppix provides you.  I think that the main Knoppix
> distribution is RAID-aware, but I've never been lucky enough to have a
> RAID setup on which to test it.
>=20
> Consider passing it the option of not booting into a GUI if RAM is an
> issue.
>=20
> Also, do run badblocks or your RAID setup's physical-error-detection
> program to make sure it's not that your disks are broken themselves.

Thanks for the response. I actually had a Knoppix CD image already
downloaded... unfortunately, it was in the affected partition. Instead I
deleted my swap partition and used the space to do a quick install of
Debian so that I could try running the latest reiserfsprogs.
Unfortunately, I've found out that it seems to be a bad block issue. I
ran 3ware's 3DM monitoring utility and allowed it to do a media scan
overnight. It generated a page full of ECC errors and was apparently
unable to fix any of them. (According to 3ware's tech support, if an ECC
error is fixable, it will be fixed and marked as such in the log.)

So now I'm left with quite a dilemma. I have a relatively small number
of blocks killing the rebuild-tree scan and the computer along with it.
(I start getting various scsi0: Command failed and IO errors and the
disk becomes unresponsive). Is there any way that I can just avoid those
blocks? Only about 15% of the data on that drive is REALLY important. I
don't mind losing all the rest if I can just get that 15% moved
somewhere safe somehow. Any way to do that?

--=20
Alex Malinovich
Support Free Software, delete your Windows partition TODAY!
Encrypted mail preferred. You can get my public key from any of the
pgp.net keyservers. Key ID: A6D24837

--=-mYDre8viAIvxVuo4ehNM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/oq8uBPYwh6bSSDcRAmVRAJ0bRbCqLbFCwqlnTXtoWo4DDzPNKwCfaS2A
xlrytaQHitqQw+zuTeEF+dY=
=xhu2
-----END PGP SIGNATURE-----

--=-mYDre8viAIvxVuo4ehNM--

