From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: yeah, it was hardware error, we can ship!
Date: Wed, 04 Aug 2004 12:56:20 -0600
Message-ID: <1091645780.2391.15.camel@wraith.lrp.advansoft.us>
References: <41112B30.2050509@namesys.com>
Reply-To: lamont@gurulabs.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-08nMVlYm79cWJ97rVknS"
Return-path: <reiserfs-list-return-20001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41112B30.2050509@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--=-08nMVlYm79cWJ97rVknS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-08-04 at 12:30, Hans Reiser wrote:
> I excerpt the evidence of it:
>=20
>  kernel: hda: drive_cmd: status=3D0x51 { DriveReady SeekComplete Error }
>  kernel: hda: drive_cmd: error=3D0x04 { DriveStatusError }
>  kernel: ide: failed opcode was: 0xef
>  [powersave_proxy][2907]: WARNING: hdparm returned error 5
>  kernel: hda: task_no_data_intr: status=3D0x51 { DriveReady SeekComplete =
Error
> }
>  kernel: hda: task_no_data_intr: error=3D0x04 { DriveStatusError }
>  kernel: ide: failed opcode was: 0xef
>  [powersave_proxy][2907]: WARNING: hdparm returned error 5
>  ifup: No configuration found for sit0
>  kernel: hdb: drive_cmd: status=3D0x51 { DriveReady SeekComplete Error }

David, what distribution were you using when he got these errors?  What
desktop environment was running on X at the time?

I ask because I started to see some similar errors on my notebook a
couple of months ago after I upgraded to FC2 (from FC1/FC2test hybrid).=20
I thought that my hard drive was starting to turn on me.

After replacing it with a new drive and installing FC2 from scratch, I
still saw the same errors.  I was also experiencing massive DMA timeout
errors for hda that were causing hard lockups.

The really weird part was that it only happens after about two minutes
logged on using Red Hat's build of KDE.  Using Gnome (or any other
desktop) the problems disappeared entirely.  I know Red Hat cuts up and
rearranges KDE when they build it, but I do not know what they are doing
differently that would account for this error.  I also tried KDE's
packages for FC2; that worked perfectly and this problem did not appear.

BTW: I have ext3 and reiserfs (3.6) partitions on this notebook.  On the
old hard drive, I used plain old partitions.  On the new drive, I use
LVM for everything except /boot and swap.
--=20
Lamont R. Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs, L.C. http://www.GuruLabs.com/

--=-08nMVlYm79cWJ97rVknS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBETFTRK8Q4zt1QRURAmNLAJ94wk3iQ6aCBaeJXCs5pZ4Af8WArgCeK+ah
zHEJ/6XWxfFO6gZectAxB+4=
=iIA/
-----END PGP SIGNATURE-----

--=-08nMVlYm79cWJ97rVknS--

