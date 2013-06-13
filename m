From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: (reiserfs 3.6) sync command causes continuous writes
Date: Thu, 13 Jun 2013 18:34:37 -0400
Message-ID: <51BA48FD.5060303@suse.com>
References: <loom.20130611T104322-574@post.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2UIOHWQPWVWGXOMCVSKPF"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20130611T104322-574@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: tomnm <tomm@lime-technology.com>
Cc: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2UIOHWQPWVWGXOMCVSKPF
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 6/11/13 4:57 AM, tomnm wrote:
> After typing the 'sync' command all reiserfs 3.6 mounted volumes will b=
e
> continuously written.  For example, suppose 'sdb1' contains a reiserfs
> partition.
>=20
> mount /dev/sdb1 /mnt/data
>=20
> Now type:
> cat /sys/block/sdb/stat
> and note the number of I/O's to the partition.
> wait a couple seconds, look at I/O statistics and see they don't change=
=2E
>=20
> Now type:
> sync
>=20
> Subsequently typing 'cat /sys/block/sdb/stat' every few seconds shows
> increasing I/O.
>=20
> This can be confirmed by trying to spin the drive down:
> hdparm -y /dev/sdb
>=20
> The device spins down but then immediately spins back up due to above I=
/O
> taking place.
>=20
> If you umount the drive and mount again, the continuous I/O stops, only=
 to
> resume again as soon as you type 'sync'.
>=20
> This behavior started with 3.5 kernel.  All 3.4.x kernels are ok.  All =
3.5.x
> and newer kernels exhibit this behavior.
>=20
> This does not seem to occur with ext3 or FAT.

This looks like it is a side effect of commit 033369d1 (reiserfs: get
rid of resierfs_sync_super).

I haven't looked at it deeply enough to understand why it's getting
kicked off by the sync.

I think the right answer is to remove the new code added by that commit.
The superblock is always journaled when we modify it, so we don't need
to do the periodic flushing.

-Jeff


--=20
Jeff Mahoney
SUSE Labs


------enig2UIOHWQPWVWGXOMCVSKPF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJRukkBAAoJEB57S2MheeWyr2YQAKAuj1tZGUby9ZzxD62WvkTW
eVD8GGVdQLvRc47xSjw8l87tI7HURA11HpOZDFhzj6gEHURR4l7il+tEOW1P013P
C0/FPuGP2smfphjfYkZIhaMXEULYK8QIN6cuBMdSWqcUn5sUUMlpFmHt8D7RbHaQ
24AaryWgWdvbXMhPfPgdz4AIjHycuIxPQ/XlhL9MeKG4HswmlO0TU7Af419vnTab
sGD7YpMAmCCG4gF6onTlQ7uXfURBuvYuuEc88p0+jdju2iZVBkINqrtrOLFBAzx7
3DrV5YjQF4V2mnw1UDomIHdQ37qxkiMk4cVrBdmFcQKeh6WpO/c2ic44SVhcCBAF
LTir8Udso2I1M/lgOsM5NpKQPxNfnbQVYzR6gE4+VDucN1QbGI0zLcLskysi/cu0
Uw07hWgHQykwzOBxEYLOlqCp0l3a4gMkvOCJKjF5CWgi+ocnCrGQF6Cm5L7h3BGQ
0DFD+0N+BhHQC0AwuPO8gqe9a6x3lzSZYIMF8hoABishR35rOURH8QafcN3Jgjll
FYjZgS0tDslfSF4Z3oi03A5XHqDO+9M940qAmHYBFONBiCswveUJinO0VZ5aB6vI
5Zlbr5e+rok/c3J4uZXW30xnWrDpybgy8gqz6GX5kecZyaYRZ3k6ceAxtCQguUu2
gDaxg4TkC8A3wfkhUlRi
=kS4v
-----END PGP SIGNATURE-----

------enig2UIOHWQPWVWGXOMCVSKPF--
