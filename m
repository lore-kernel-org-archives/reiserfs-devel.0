From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 0/6] reiser4: discard support: "precise discard" aka padding of extents to erase unit boundaries.
Date: Sun, 14 Dec 2014 11:03:10 +0300
Message-ID: <1847370.hWhlfNze1m@intelfx-laptop>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com> <548CBFCA.60105@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2233619.ETcgBRvobT"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=QZCNMQ4O7nYcVeKYXGk6EtG+/vmdmZzKy8U4NLW93aw=;
        b=qokp9Vq+mrSHfImAnelkk7UY503ICi+a1/WnojoGqqDm2UkX0rcnK8a0v/QJbvwY+B
         EafR52r5nkuR6fvZ/7e8WMrtr46wiJmsrxO4nlYDDhsp17WKDXI2a+rKv7oQ4NzYTbwR
         2y8wEcaLApV468FYbMUhf16/mtDzEVCu3J5qdTzqTTlDY8XDIcVUYXRBFWO0ujmgQieW
         7Uh18pw2ZmcVlOK0KcSJnOhtcO8MaQa8uaafIT5wOd/437B6ZM63zPy/nYcVzLr4K5pF
         G//7k5BKgqkLMyxW3WBZnMUgEmvMYUlGw1JYL2U4D1yYf/W6E5nV4t46OTXasjnZ0/Pe
         AaQA==
In-Reply-To: <548CBFCA.60105@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2233619.ETcgBRvobT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 13 December 2014 at 23:38:02, Edward Shishkin wrote:=09
>=20
> On 12/12/2014 10:10 PM, Ivan Shapovalov wrote:
> > So, this patchset uses your algorithm of padding/gluing extents to =
be discarded.
> > I've added exact allocation primitives (is it what you've been talk=
ing about?
>=20
>=20
> So, we found out that the old bitmap primitives don't allow us to imp=
lement
> precise discard, and I asked for new ones. Also we wanted to implemen=
t the
> general case, when precise discard works for any pair (offset, unit).=
=20
> Currently
> it works only for ones determined by the function convert_lattice_par=
ams().
> For some reasons (that I don't remember) I was sure, that the general=
 case
> should be obtained from this partial case by a small transformation o=
f the
> function discard_sorted_merged_extents().
>=20
> Well, I'll try to dive into details and generalize things on the holi=
days.
> If generalization is impossible, then we'll switch to non-precise=20
> discard every
> time when convert_lattice_params() fails.

I don't quite understand you here... Do you mean that some non-insane c=
ombinations
of discard unit, discard offset and blocksize are not handled (but wort=
h
handling)?

TBH, convert_lattice_params() looks magic-ish to me...

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2233619.ETcgBRvobT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlSNRD4ACgkQxUKljSIMAnCfPQEA3GkZ9jiakm1yKhmE6+NZ6d7Y
ouhioJ9F01SgJxA/h9gBANBWHqWMhoLdQIpmG/UKXxltF5dcGqwCbS251VC591zi
=CAXZ
-----END PGP SIGNATURE-----

--nextPart2233619.ETcgBRvobT--

