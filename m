From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: reiser4 metas/bmap problem
Date: Wed, 28 Jul 2004 21:25:49 -0400
Message-ID: <20040729012549.GE1439@schnapps.adilger.int>
References: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u+M3zPFM/+rkulSy"
Return-path: <reiserfs-list-return-19848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.44L.0407281754290.11129-100000@unix2.cc.ksu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Matt Stegman <matts@ksu.edu>
Cc: reiserfs-list@namesys.com

--u+M3zPFM/+rkulSy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 28, 2004  18:26 -0500, Matt Stegman wrote:
> I'm finally taking the time to start testing reiser4, and I'm running into
> something odd.  Some of the time, reiser4 doesn't report a file's blocks
> until I run 'sync'.  This shows up in metas/bmap as many blocks are
> reported as 0.
>=20
> # dd if=3D/dev/zero of=3D/mnt/reiser4/file bs=3D1M count=3D50
> 50+0 records in
> 50+0 records out
> # chmod +x /mnt/reiser4/file
> # grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
> 1792
> # sleep 100
> # grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
> 1792
> # sync
> # grep '^0$' /mnt/reiser4/file/metas/bmap | wc -l
> 0
>=20
> I tried waiting to see if it gets written out in the background
> asynchronously.  As you can see, it still shows up after a couple minutes,
> so it doesn't appear to get written until an actual 'sync' command is run.
> But it shows up inconsistently - many files don't show this.

I believe one of the speedups of reiser4 is that it doesn't actually write
data to disk for minutes at a time, vs. 5s or so for most other filesystems.

The ext3_bmap() function flushes all file data to disk when called, and it
would be prudent to do the same with reiser4, since bmap users tend to be
important and not speed critical (e.g. lilo) and failing to do so can mean
not booting later.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/


--u+M3zPFM/+rkulSy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBCFIcpIg59Q01vtYRAu5RAKCh69J1Wb/xgt2Hy3CRIuekFxahKQCfSKfZ
AF7gZytee2zsoX0odMbrQoE=
=4cAJ
-----END PGP SIGNATURE-----

--u+M3zPFM/+rkulSy--
