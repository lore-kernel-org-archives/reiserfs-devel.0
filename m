From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: [BUG] nikita-1481, nikita-717 and nikita-373 here and there
Date: Tue, 01 Aug 2006 21:39:16 +0100
Message-ID: <1154464756.8960.55.camel@teratron.lan.etheus.net>
References: <449B2D1D.9000507@iki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Hue4RFiEl7j+X/PiHOzd"
Return-path: <reiserfs-list-return-29423-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <449B2D1D.9000507@iki.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-Hue4RFiEl7j+X/PiHOzd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-06-23 at 02:51 +0300, Jussi Judin wrote:
> After that I upgraded to Debian patched kernel 2.6.16-14 and to reiser4=20
> patch 2.6.16-4 for that kernel and ran fsck.reiser4. Then I got errors=20
> like this in kern.log after a while:
>=20
> WARNING: Error for inode 1731981 (-2)
> reiser4[nfsd(3817)]: key_warning=20
> (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
> WARNING: Error for inode 1703086 (-2)
> reiser4[nfsd(3818)]: key_warning=20
> (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
> WARNING: Error for inode 1726433 (-2)
> reiser4[nfsd(3818)]: key_warning=20
> (fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:

I too am getting these warnings:

Jul 27 06:28:15 prometheus kernel: reiser4[find(10770)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
Jul 27 06:28:15 prometheus kernel: WARNING: Error for inode 3922698 (-2)
[REPEATED 17 TIMES]
Jul 27 06:28:15 prometheus kernel: reiser4[find(10770)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
Jul 27 06:28:15 prometheus kernel: WARNING: Error for inode 3922697 (-2)
[REPEATED 17 TIMES]
Jul 27 06:28:16 prometheus kernel: reiser4[find(10770)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
Jul 27 06:28:16 prometheus kernel: WARNING: Error for inode 3922696 (-2)
[REPEATED 17 TIMES]

...
...

Jul 27 06:28:19 prometheus kernel: reiser4[find(10770)]:
cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
Jul 27 06:28:19 prometheus kernel: WARNING: Keys are inconsistent. Fsck?
Jul 27 06:28:19 prometheus kernel: reiser4[find(10770)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
Jul 27 06:28:19 prometheus kernel: WARNING: Error for inode 3922690 (-5)


System information:
Kernel: 2.6.16.20
Patches: reiser4-for-2.6.16-4.patch.gz
Reiser4progs: 1.0.5

This machine is used for recording TV using a DVB card, compresses the
files, and serves them via NFS and Samba.

Until recently, the system ran kernel linux-2.6.11.6, and performed
flawlessly for over a year. After upgrading the kernel, I upgraded
reiser4progs, and fscked all reiser4 partitions. No errors were found.

The system is run on a UPS, and does not have a history of memory or IO
trouble.
I am currently investigating why the samba shares have failed, and
noticed this in the log.

I believe problem/bug this is related to the kernel upgrade, rather than
some random corruption because it seem too much of a coincidence to
happen so soon after upgrading the kernel.

Any help/advice is greatly appreciated.

...back to the samba investigation.

Many Thanks,

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-Hue4RFiEl7j+X/PiHOzd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBEz7v05OI9vmOoVqERAi4BAJ9pH1bfdKzuqpThlh+jznBXHZxSwgCfc8CD
4qp0JqxhtMslC+NlB8vNX18=
=m/zy
-----END PGP SIGNATURE-----

--=-Hue4RFiEl7j+X/PiHOzd--

