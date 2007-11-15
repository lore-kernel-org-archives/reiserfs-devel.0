From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Reiser4 and loop device problems
Date: Thu, 15 Nov 2007 22:44:57 +0100
Message-ID: <20071115224457.2202be3e@sirius>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=a9GjJBJ0xOO7qZCC69p=ee";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

--Sig_/=a9GjJBJ0xOO7qZCC69p=ee
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

in recent reiser4 it is not possible to loopback mount a file located
on a reiser4 partition

* kernel 2.6.24-rc2-git5
* reiser4progs 1.0.6
* reiser4 from 2.6.24-rc2-mm1with following series

	sync_sb_inodes-propagate-errors.patch
	reiser4-sb_sync_inodes.patch
	reiser4-export-remove_from_page_cache.patch
	reiser4-export-find_get_pages.patch
	make-copy_from_user_inatomic-not-zero-the-tail-on-i386-vs-reiser4.patch
	reiser4.patch
	jens-broke-reiser4patch-added-to-mm-tree.patch

* filsystem created with
	$ mkfs.reiser4
* mounted with noatime
* no cryptcompress or anything non-default

$ mount -o loop -t iso9660 /tmp/systemrescuecd-x86-0.4.0.iso /mnt/cdrom=20
ioctl: LOOP_SET_FD: Invalid argument

Regards,
Tom

--Sig_/=a9GjJBJ0xOO7qZCC69p=ee
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHPL3eMQFfAqZTGfwRAt6gAJ9U6YNM2ZYue4FxvnoJYMbq0wXTxwCfVb2p
K/vlZuVRN/CWcQV7ls+bhfc=
=2h3x
-----END PGP SIGNATURE-----

--Sig_/=a9GjJBJ0xOO7qZCC69p=ee--
