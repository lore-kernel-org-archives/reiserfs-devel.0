From: Matthew Toseland <mtoseland@blueyonder.co.uk>
Subject: Re: copying partition to partition, sector by sector, live
Date: Mon, 22 Apr 2002 23:47:55 +0100
Message-ID: <20020422224755.GA1710@amphibian.dyndns.org>
References: <20020421181614.GA11239@vega.ipal.net> <20020422010733.GA2379@amphibian.dyndns.org> <20020422013955.GB8407@vega.ipal.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <reiserfs-list-return-10130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020422013955.GB8407@vega.ipal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: reiserfs-list@namesys.com

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 21, 2002 at 08:39:55PM -0500, Phil Howard wrote:
> On Mon, Apr 22, 2002 at 02:07:33AM +0100, Matthew Toseland wrote:
>=20
> | Ummm, LVM snapshots? (man lvcreate).
>=20
> No.  Nothing to do with LVM.
I was suggesting a solution. Your problem is that reiserfs's metadata is
so dynamic that if you copy the partition while it is active, you end up
with metadata loss, which has to be fixed by reiserfsck. A possible
solution is to get a consistent snapshot. To do this, do:

lvcreate -n <snapshotname> -L 500M -v /dev/<vgname>/<partition name>
dd if=3D/dev/<vgname>/snapshotname of=3D/usr/local/temp/snapshot.img bs=3D1M
lvremove -f /dev/<vgname>/snapshotname

(1) 500M could be anything; it is the amount of space needed to log all
changes to the partition while the dd is going on; you can extend it later
but once it fills up completely, you're scr00d; presumably the dd will
return an error
(2) set dd parameters as usual
(3) unfortunately the original partition must be LVM, and the snapshot
will be allocated in the same group
(4) /dev/<vgname>/snapshotname is a read-only snapshot of the LV
(partition) at the time of the lvcreate. It will not change, so it gives
you a consistent snapshot. End of problem. No need to do risky fscks,
just take a consistent snapshot in the first place.
>=20
> --=20
> -----------------------------------------------------------------
> | Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
> | phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
> -----------------------------------------------------------------
>=20

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8xJMbmlVGrEH/+qIRAgLVAJ9WQ+vNaArqSQvKWTQZ9ZEHefADlgCfecTk
tN7UwBZE2Qw44Nyc5rSWik4=
=iiLD
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
