From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard support
Date: Fri, 02 May 2014 15:06:47 +0400
Message-ID: <1946519.CBPeGJLD6P@intelfx-laptop>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <2570366.EA3nxE0EOq@intelfx-laptop> <CAJZSrNK4=o9vocDfSM=4W5ZgtqZ6RVpmU66sGCu6HFsdN47OHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4761953.yxGdPmKY5U"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=2BT/oOGIILU8YbNtaMteBo5IDYxMXLQ+7bkjZoQNNf4=;
        b=t5r5+jCLIal4wXsYOjs1ZcVE28g/PCa/C8+YyvkTb0S9Ci2JOxUmgmK+Ra1tJVpJNa
         RneQq1/1hA/1sbKFZYq+lmWbbLdwsWTcyne2VVguQ8SZVgWLxGvWajukjSJumVOhU/J0
         CAbPjrjvjKfX9l3u3ikWNvIO8LF0fmpcXGjz2swOInzh4Dd1mQGU2oo4a1kTZf6EiGfc
         O5hrZxpxBEo51Ii6bIVGZ8BFnLc6e4fPuiBbTjI2tfLiW3LSj+JhnWPvaP6jmAEbsNtc
         75Cvy8/wdHIcFG8BaGKZy8T9gZFs7H/28BWVv1dMHRPqccZmBdu5alQzta7EB2FeJpRS
         3/FA==
In-Reply-To: <CAJZSrNK4=o9vocDfSM=4W5ZgtqZ6RVpmU66sGCu6HFsdN47OHw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Daniel Horne <daniel.horne@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>


--nextPart4761953.yxGdPmKY5U
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 02 May 2014 at 02:28:24, Daniel Horne wrote:=09
> When you say
>=20
> > For lists:
> > 1) Adding
> > 2N
> >=20
> > 2) Merging
> > constant
> >=20
> > 3) Sorting
> > 2N*log(2N)
> >=20
> > Total:
> > 2N+2N*log(2N)
>=20
> For the sorting pass, are you assuming use of quicksort? That would r=
equire
> constant-time random access characteristics to achieve that efficienc=
y (in
> other words, transfer it to an array prior to sorting). Otherwise, yo=
u'd
> have to add in a multiple of N for a linear scan on each item, making=
 it
> O(2N^2) by my reckoning.
>=20
>=20
> (ps, apologies for possible duplicate post - hit reply to Ivan instea=
d of
> the list )
>=20
> --
> DH

I'm assuming usage of the in-kernel list_sort(), which uses merge sort =
and=20
claims to have a complexity of O(n*log(n)).

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart4761953.yxGdPmKY5U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNjfEwACgkQxUKljSIMAnBnEwD9Hful9N/ALXBmuxOZAsA/EmWh
T4Gk3NdQiSKWbBcgk8cA/jaCRA8R+aJRTG5H4SVksntJ+IIgRIYJ85xyxs+AfQ6f
=SvMV
-----END PGP SIGNATURE-----

--nextPart4761953.yxGdPmKY5U--

