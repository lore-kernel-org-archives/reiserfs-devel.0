From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 30 Jun 2006 10:46:27 -0700
Message-ID: <1151689588.5927.18.camel@ipso.snappymail.ca>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
	 <1151608355.6335.79.camel@tribesman.namesys.com>
	 <1151612146.11510.4.camel@ipso.snappymail.ca>
	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>
	 <44A5598E.9060502@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Un43o6dz+gjWhEH4qFIS"
Return-path: <reiserfs-list-return-28881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44A5598E.9060502@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

--=-Un43o6dz+gjWhEH4qFIS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have emailed the results of debugreiserfs -m /dev/hda1 to Vladimir
already, Jeff I can email it to you as well if you want?

Just you so you know, there is a thread about this on the MythTV mailing
list (http://www.gossamer-threads.com/lists/mythtv/users/208573) and it
looks like there might be as many as 5 other people experiencing the
same issue.=20

We originally thought it was caused by IVTV drivers, but one other
person and myself (after profiling) discovered it was related to how
much disk space we have available on our reiserfs partitions.=20

I also haven't _noticed_ a gradual increase in load as the free space
decreases, as I would expect if reiserfs had to spend longer searching
for unused blocks, it seems the box all of a sudden gets hit at a
certain point and the load spikes to 10 and writing slows to a crawl.


On Fri, 2006-06-30 at 10:04 -0700, Hans Reiser wrote:
> I have to apologize, I just now read the part where find_next_zero is
> using 42% of CPU.
>=20
> Jeff, this has the "feel" of a bug (affecting performance not
> correctness).  I am skeptical that we are searching only bitmap blocks
> in which we successfully find and use a free block.  Could you look at
> the code and his results with some care?  This profiling result is what
> I would have expected to see BEFORE your optimizations occurred, and I
> would not expect it now.  Thanks Mike for bringing this to our attention.
>=20
> Hans
>=20
> -------------------------
>=20
> From: Jeff Mahoney <jeffm@suse.com>
> Subject: [PATCH 5/5] reiserfs: make bitmap use cached first zero bit
>=20
>  Currently, the bitmap code uses half of the hinting data gathered and
> cached
>  and wastes the other half. We'll skip completely full bitmaps, but start
>  scanning in bitmaps at locations where if we consulted the zero bit hint=
,
>  we'd know there aren't any free bits available.
>=20
>  This patch uses the first zero hint to bump the beginning of the search
>  window to where we know there is at least one zero bit.
>=20
>  fs/reiserfs/bitmap.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletion(-)
>=20
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>=20
> diff -ruNpX ../dontdiff linux-2.6.15.orig.staging1/fs/reiserfs/bitmap.c
> linux-2.6.15.orig.staging2/fs/reiserfs/bitmap.c
> --- linux-2.6.15.orig.staging1/fs/reiserfs/bitmap.c    2006-01-16
> 16:53:35.663319136 -0500
> +++ linux-2.6.15.orig.staging2/fs/reiserfs/bitmap.c    2006-01-16
> 16:53:35.673317616 -0500
> @@ -187,7 +187,10 @@ static int scan_bitmap_block(struct reis
>              return 0;    // No free blocks in this bitmap
>          }
> =20
> -        /* search for a first zero bit -- beggining of a window */
> +        if (*beg < bi->first_zero_hint)
> +            *beg =3D bi->first_zero_hint;
> +
> +        /* search for a first zero bit -- beginning of a window */
>          *beg =3D reiserfs_find_next_zero_le_bit
>              ((unsigned long *)(bh->b_data), boundary, *beg);
> =20
>=20
>=20
--=20
Mike Benoit <ipso@snappymail.ca>

--=-Un43o6dz+gjWhEH4qFIS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEpWNzMhKjsejwBhgRAsNQAJ4ykdpXlXI3EirHGVJAfU8dN8yegwCfSdgW
QA6nZ3U5a5JRV1soq8LBqx0=
=FZQu
-----END PGP SIGNATURE-----

--=-Un43o6dz+gjWhEH4qFIS--

