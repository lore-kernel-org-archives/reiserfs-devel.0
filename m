From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard support
Date: Fri, 02 May 2014 03:51:28 +0400
Message-ID: <2570366.EA3nxE0EOq@intelfx-laptop>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <1B07908E-B768-407D-ADFA-B3C539FABB49@gmail.com> <53613807.7090605@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart31803305.Zq0RvqT2J4"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=HLsG3YPQd6BnqzXK95i+IdS+y56+kHFz2igsbC2swqg=;
        b=seOjrWPUoChRAHH5tQuvL4zCRpQyVTAC4j1TK9oj9js/Grspab+KDssmafrur3BDs3
         5O/MWAHMZttJ3IyoLZYTP/TpBNojlcq78TC1T/IGsKvmlg03fqahrmTLX3HPoQiwKaHT
         qH+vQ6oFztPBnD3McqyUCB//VMfmm3HNU4s0gY7h0C6xbkqQV93oIseHhPDJ7aMQ4kho
         A9HbGdn7KMXaHicj78DCX0ruaiZEOO17a2XRGLFPdZTF/B00FthG2EpWBxzTNZ5LZ4by
         Kpef6wFpjaiwznYGiA71LHjfVhUFFt4/Hc6Y+WoJB0KVZYlr+flu5gx4Fl93hW4bW/5L
         /jfQ==
In-Reply-To: <53613807.7090605@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart31803305.Zq0RvqT2J4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 30 April 2014 at 19:51:03, Edward Shishkin wrote:=09
> On 04/30/2014 05:04 PM, Ivan Shapovalov wrote:
> [...]
>=20
> >> There is a ready implementation of rb-trees in the kernel (see
> >> ./lib/rbtree.c,
> >> ./lib/rbtree_test.c). Could you please take a look at this?
> >=20
> > I've checked it already. Well, in case of trees:
> > - combined extent insertion+adjacent extent merge complexity is
> > O(n*log(n))
>=20
> Actually, this is:
>=20
> 1) Add n extents one-by-one to empty tree:
> log(1) + log(2) + ... + log(n-1)
>=20
> 2) Merge 2 trees of n extents:
> log(n) + log(n+1) + ... + log(2n-1)
>=20
> Total: log(1*2*...*2n-1) =3D log((2n-1)!)
>=20
> in accordance with Stirling's formula:
>=20
> log((2n)!) =3D log(((2n)^(1/2))*(2n/e)^n) =3D
> =3D (1/2)*log(2n) + n*log(2n/e) < n + n*log(n)

Hm.

Consider we fill two data structures with N extents each, then merge th=
ese two=20
data structures and prepare the resulting one for traversal (for lists =
it will=20
be sorting, for trees that's no-op).

For trees:
1) Adding
2*log((n-1)!)

2) Merging
log((2n-1)!/(n-1)!)

3) Sorting
none

Total:
log((2n-1)!) + log((n-1)!)

For lists:
1) Adding
2N

2) Merging
constant

3) Sorting
2N*log(2N)

Total:
2N+2N*log(2N)

Quick testing in WolframAlpha shows that, if these estimations are corr=
ect,=20
lists tend to have lesser complexity starting with approx. N=3D160.

>=20
> Since atoms can be merged in parallel, we have that
> trees work better than lists. Also tree of extents has
> better memory consumption because of merging extents.
>=20
> >  against O(n+n*log(n)) in lists;
> >=20
> > - joining two trees is not less than O(log(n)) against O(1) in list=
s.
> >=20
> > So I can't see any benefit in using trees, and join performance is =
a
> > downside of these. Am I missing something?
>=20
> [...]
>=20
> > Why after reiser4_invalidate_list()? I thought that it should be
> > called between reiser4_write_logs(), but before reiser4_invalidate_=
list().
>=20
> OK, insert before. I think, it doesn't matter, since we don't look
> at this list when issuing discard requests, no? :)

I just don't understand what implications does that function have. It s=
eems to=20
mess with jnodes, and I can imagine that this leads to races with someb=
ody=20
modifying the bitmaps while issue_discard_requests() tries to read them=
 to=20
check discard extents... Again, for me, internals of reiser4 still most=
ly look=20
like heavy wizardry. :)

Thanks for guidance,
=2D-
Ivan Shapovalov / intelfx /

>=20
> > And why not after all reiser4_invalidate_list() calls?
> >=20
> >> Thanks,
> >> Edward.
> >> P.S.: You'll need to set up a debugging environment. Take a look a=
t this:
> >> http://bipinkunal.blogspot.cz/2012/05/kgdb-tutorial.html
> >> Do you have a second machine with a serial port?
> >=20
> > No, I don't. Will a VM suffice?
>=20
> Yes, if it works for you..
>=20
> Thanks,
> Edward.
--nextPart31803305.Zq0RvqT2J4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNi3gkACgkQxUKljSIMAnCDMQD/QSSqndPv+nPwKnzHq2+MwgX0
mYYe6sRXrZXb2RSjdPcA/iRnDjVLwF6KvNCPswGTEvBQwDyu/wai5cgcM7zf7gHX
=arOr
-----END PGP SIGNATURE-----

--nextPart31803305.Zq0RvqT2J4--

