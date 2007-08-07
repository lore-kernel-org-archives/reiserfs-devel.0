From: Zan Lynx <zlynx@acm.org>
Subject: Re: Interesting observation on Reiser4 flush delays and IO
	scheduler
Date: Tue, 07 Aug 2007 11:40:28 -0600
Message-ID: <1186508428.232321.10.camel@localhost>
References: <1186086508.14479.14.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-U1dQSNtoQcH32C+B5Ozd"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1186086508.14479.14.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>


--=-U1dQSNtoQcH32C+B5Ozd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2007-08-02 at 14:28 -0600, Zan Lynx wrote:
> On my laptop while running heavy disk read/write loads, I have
> discovered that the deadline IO scheduler gives me a much better "feel"
> and much shorter (and fewer) system freezes.  This is as compared to the
> CFQ scheduler.

Something else I found today.  I'm back to the CFQ scheduler.  Deadline
was better in the heavy write-out situation, but not so good at reading.

It appears nr_requests was too low at the default of 128.  I have bumped
it to 1024.  Watching iostat's avgqu-sz field during writeout, I see it
hit over 450 now.  Pauses in things like music playback are much
reduced.

My theory is that an atom writeout stalls and blocks read requests if it
can't stuff the whole thing into the disk queue.

If that's true, it'd almost be nice to have a printk "stall warning" or
just have Reiser4 shove nr_requests up automatically until the queue can
hold a complete atom write.

I'm probably wrong with my theory, but I hope the nr_requests suggestion
can help other's with lag problems.
--=20
Zan Lynx <zlynx@acm.org>

--=-U1dQSNtoQcH32C+B5Ozd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iD8DBQBGuK6MG8fHaOLTWwgRArmlAJ9O29E832adOcWuR89w1/o+c+SUrACggw+I
BnZH36kxWkttywkC4UCGP1M=
=u0Cc
-----END PGP SIGNATURE-----

--=-U1dQSNtoQcH32C+B5Ozd--

