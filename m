From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 29 Jun 2006 14:01:16 -0700
Message-ID: <1151614877.11510.10.camel@ipso.snappymail.ca>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
	 <1151608355.6335.79.camel@tribesman.namesys.com>
	 <1151612146.11510.4.camel@ipso.snappymail.ca>
	 <1151612523.6335.95.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-6Y1OiJhzPQ3fkOtGGlBd"
Return-path: <reiserfs-list-return-28863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1151612523.6335.95.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--=-6Y1OiJhzPQ3fkOtGGlBd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-06-30 at 00:22 +0400, Vladimir V. Saveliev wrote:
> > This seems strange, because to me this type of workload would lend
> > itself to being less fragmented then most workloads. All the box
> does is
> > records TV programs, so over the course of 30-60min periods I would
> > guess 95+% of the writes are sequential.=20
> >=20
>=20
> do you ever remove files?

Yes, files are deleted when the drive starts to fill up, which is how I
discovered this issue in the first place. I always kept a minimum of
10gb free, and when I got close to that limit is when the load would
spike. I have since set to the limit to 40gb and I haven't seen the
problem since, but I can't use that 40gb of space either though.

>=20
> > Why would the fragmentation be so bad? Is there a way to tell what
> the
> > fragmentation rate is?
> >=20
>=20
> can you please run debugreiserfs -m /dev/hda1 > bitmap and send me
> that
> file?
> bitmap should contain dump of free and used blocks. If most of bitmap
> blocks contain a lot of interleaving free/used sections - free space
> is
> highly fragmented and allocating new free blocks can be CPU
> expensive.=20

I do record two programs at once from time to time, so I can understand
how that would cause fragmentation. However after each program I also
transcode them to a different format one at a time. So I would think
that would reduce fragmentation that may have occurred from recording
two programs at once? Although I suppose if I was transcoding and
recording at the same time, it would just make things worse.

I will send Vladimir the debugreiserfs output privately.=20

--=20
Mike Benoit <ipso@snappymail.ca>

--=-6Y1OiJhzPQ3fkOtGGlBd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEpD+cMhKjsejwBhgRAghgAJ0XxueZVq6uBuXg8cZLIHaWpH3P1ACfa11E
V+z4fjijbpGQClAtxF/3zUg=
=FOJ0
-----END PGP SIGNATURE-----

--=-6Y1OiJhzPQ3fkOtGGlBd--

