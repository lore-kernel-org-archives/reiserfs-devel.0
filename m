From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: Reiserfs make System Reboots
Date: Mon, 15 Mar 2004 10:44:17 -0700
Message-ID: <1079372657.3286.60.camel@wraith.lrp.advansoft.us>
References: <4055AA2E.8010505@netpar.com.br>
Reply-To: lamont@gurulabs.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Uv+yI9/uwOTHmNlMfGdE"
Return-path: <reiserfs-list-return-17227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4055AA2E.8010505@netpar.com.br>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-Uv+yI9/uwOTHmNlMfGdE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-03-15 at 06:05, julio menezes wrote:
> Dear ReiserFs team.
>=20
> Thanks for this nice file system.
>=20
> I would like to report a first crash after one year.
> I'm a linux new by so, it must be my fault.
>=20
> I was on the Internet using Netscape.
> After a power  failure, Netscape lost my mail-box.
> After that, any operation like tar or mkdir makes my system reboot.

I do not know if this could be related to the same cause for my
experience below, or not.

> Some dir shows estrange files, they can not be removed, even as root.

I experienced the same thing a few years ago (twice) on one of my
systems.  As best as I could narrow it down (at the time), the directory
(in my case) which held the affected files was placed on top of a bad
block on the drive.  The only way I ever did *anything* to those files
was to reformat the drive.

The first time this happened, I was in the process of shuffling some
data around in preparation to update the SUSE version installed.  I
figured that I must of somehow screwed up the group of files.  As I
started to update, I realized that the new version of SUSE I was
installing was willing to use the "new" ReiserFS 3.6, so I decided to
just reformat.

The second time was about 5-6 months later.  I do not now remember what
I was doing to "make" this problem show up, but this was the same drive
it had happened on before.  Sure enough, when I checked the disk out
thoroughly (with spin-rite) it tuned out there were some bad blocks on
the disk.  After backing up all the data I could, I marked those blocks
as bad so the drive would not use them and reformated.  That drive has
been perfect ever since.

> My system:
> Slackware 9.0 (as is, no patches)
> /dev/hda1 =3D dos
> /dev/hda2 =3D linux swap
> /dev/hda3 =3D linux /
> /dev/hda4 =3D /home (users accounts)
>=20
> I'm sending my dmesg and the same reports of reiserfsck.
>=20
> My steps:
> 1- I made back-ups of my /etc and /home of my users.
> 2- Reinstall the Slackware 9.0 - using Ext3 at /dev/hda3. I wanna try=20
> Ext3 for a while.
> I have other hosts with reiserfs (Slackware 9.0 defaults)
> 3- add every user on /dev/hda3 /home  (Certainly not in the same=20
> sequence as I did before)
> 4- run reiserfsck and rebuilt the tree on /dev/hda4.
>=20
> After that, the /dev/hda4 was OK but the owner and group was mixed, like=20
> this.
> # mount -t reiserfs /dev/hda4 /mnt/hd -o ro
> ls -l /mnt/hd >> old-hda4-home.txt
>=20
> drwx--x--x   25 spam     users        1224 Mar 10 11:35 aeromapa
> drwx--x--x    4 opengl   users         160 Feb 12 17:47 aerosul
> drwx--x--x    2 wbib     users          80 Feb 13 08:07 cazeca
> drwx--x--x    5 programa users         304 Feb 20 18:30 clamav
> drwxr-xr-x   16 cmaismai users         728 Feb 12 16:58 cmaismais
> drwxr-xr-x    2 root     root           48 Feb 26  2001 ftp
> drwx--x--x   63 jmenezes users        2872 Mar 12 14:27 jmenezes
> drwxr-xr-x    2 root     root          160 Feb  8 20:58 lixo
> drwx------    2 root     root          112 Mar 14 18:31 lost+found
> drwxr-xr-x   39 cazeca   users        1528 Mar  5 14:46 opengl
> drwxrwxrwx    9 root     root         1256 Mar 10 11:18 pub
> drwx--x--x   15 aeromapa users         784 Feb 26 15:30 spam
> drwxr-x--x   28 aerosul  users        1104 Feb 20 12:42 wbib
>=20
>=20
> I know, it was my fault, I should keep the same ID for my users. I will=20
> fix it.
>=20
> that is it.
>=20
>=20
> thanks again by the reiserfs.
>=20
> []s
> julio menezes
>=20
> www.netpar.com.br/jmenezes
>=20
--=20
Lamont Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs <http://www.gurulabs.com/>

--=-Uv+yI9/uwOTHmNlMfGdE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAVetxRK8Q4zt1QRURAhWBAJ9DFeEH1SRUPptoDhzCo0pxIXWuMACfSuiD
RPzeN5sOfxA8lFFj3Ef/gas=
=W2Wc
-----END PGP SIGNATURE-----

--=-Uv+yI9/uwOTHmNlMfGdE--

