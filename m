From: "Simon \"Sturmflut\" Raffeiner" <sturmflut@lieberbiber.de>
Subject: Re: Partial data loss with reiserfs3
Date: Wed, 16 Feb 2005 00:03:25 +0100
Message-ID: <200502160003.31421.sturmflut@lieberbiber.de>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt> <87fyzyasxv.fsf@quasar.esben-stien.name> <421208DD.1040704@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3306214.cAYCcNZOjB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <421208DD.1040704@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart3306214.cAYCcNZOjB
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Dienstag 15 Februar 2005 15:36 schrieb _evil:
> AFAIK if you partition a harddisk which is not in use (not mounted any
> of its partitions), the kernel is able to re-read the partition table
> (and says so in the syslog). that way i've created partitions on
> harddisks without rebooting.
>
> i think [s|c]fdisk complains, if it can't re-read the table:
>
> The partition table has been altered!
> Calling ioctl() to re-read partition table.
> WARNING: Re-reading the partition table failed with error 16: Device or
> resource busy.
> The kernel still uses the old table.
> The new table will be used at the next reboot.
> Syncing disks.

I think if / doesn't lie on the same hard disk it will work, at least I've=
=20
never had to reboot a machine while partitioning unused hard drives with [c|
f]disk or parted. The ioctl() was always able to re-read the partition tabl=
e.

=2D-=20
mit freundlichen Gr=FC=DFen

Simon "Sturmflut" Raffeiner

=2D----------------------------------
Die Weltgeschichte ist die Summe dessen, was vermeidbar gewesen w=E4re.
                                                   -- Oscar Wilde

GPG Public Key: 0xB2204FA0 @ hkp://subkeys.pgp.net
http://www.lieberbiber.de/pubkey.gpg

--nextPart3306214.cAYCcNZOjB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCEn/Dd2q78rIgT6ARAitYAJ45TcW1sVP0MojhXF1T1Mgc3J+G9ACfaYN+
y4S0fPecZJodFOEcEVXvB2A=
=expY
-----END PGP SIGNATURE-----

--nextPart3306214.cAYCcNZOjB--
