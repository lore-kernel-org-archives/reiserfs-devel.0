From: Alex Malinovich <demonbane@the-love-shack.net>
Subject: Re: reiserfsck 3.6.11 locks up
Date: Sun, 21 Dec 2003 15:47:32 -0600
Message-ID: <1072043251.2090.9.camel@Gollum>
References: <196401c3c7c6$3ff2e1c0$74cb010a@mail2world.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-uSpMsNHYWVaHISmNeQqC"
Return-path: <reiserfs-list-return-16365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <196401c3c7c6$3ff2e1c0$74cb010a@mail2world.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-uSpMsNHYWVaHISmNeQqC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-12-21 at 07:27, David Fendrich wrote:
> I have a disaster on my hands. I have important data on a HD which
> crashed a few days ago. It turns out that the back up system has been
> down for 1 month, so I really need to recover data from this HD. I used
> dd_recover to rescue what I could to a clean drive (very few blocks were
> damaged, fortunately).
>=20
> I then mounted this 200 gig file with losetup and ran reiserfsck --check
> on it. Reiserfsck said that I needed to run with --rebuild-tree. So I
> did. Pass 0 went fine. Pass 1 locked up everything after 40%. I
> downloaded the latest reiserfsck (my first version was 3.6.6 or
> something like that) and tried again. Same result at the exakt same
> position.

I just did this exact thing finishing about half an hour ago. I had a
very badly corrupted RAID 0 array to try and get data from. Using
dd_rescue, each time a read failed the kernel would disconnect the drive
altogether, forcing me to reboot. Altogether I spent about 2 full days
doing nothing but running dd_rescue with various starting points. Here's
my full procedure:

1) run dd_rescue to get the data off the drive and dump it into a file
on another partition. In my case, the file was /backup/sda-rescue

2) Once I had a full backup, I made a copy of sda-rescue on another
drive just in case.

3) I ran the following: reiserfsck --rebuild-tree --logfile
/root/reiserfsck-rebuild-tree.log /backup/sda-rescue

4) This resulted in about 3000 files in lost+found and nothing else. The
original partition had about 130,000 files total. Luckily, I made a copy
of the backup at /other/sda-rescue. :)

5) I re-ran reiserfsck with the --scan-whole-partition option:
reiserfsck --rebuild-tree --scan-whole-partition --logfile
/root/reiserfsck-rebuild-tree.log /other/sda-rescue

6) Once this completed, I mounted the partition with the following
command and got a good chunk of my data back: mount -t reiserfs -o
loop,ro /other/sda-rescue /rescue

Unfortunately, I'm far from being an expert on reiserfs, this just
happened to work for me. Best of luck. :)

--=20
Alex Malinovich
Support Free Software, delete your Windows partition TODAY!
Encrypted mail preferred. You can get my public key from any of the
pgp.net keyservers. Key ID: A6D24837

--=-uSpMsNHYWVaHISmNeQqC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/5hTzBPYwh6bSSDcRAmE/AJ9CheBKtY2131SstMQhJKFcPdkwqACgkDpI
4blGXr2O1Qws1Z/3x1MaHEY=
=FNRv
-----END PGP SIGNATURE-----

--=-uSpMsNHYWVaHISmNeQqC--

