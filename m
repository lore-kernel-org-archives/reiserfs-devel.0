From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [veryRFC] [PATCH 0/2] reiser4: discard before dealloc: first approximation.
Date: Wed, 16 Jul 2014 18:19:56 +0400
Message-ID: <2203254.JufQtcPeU0@intelfx-laptop>
References: <53C652BE.4010203@gmail.com> <1405509844-30070-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8271459.JD8iG9oTCk"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=pvd8I7MFeOCx5WkAwRaQzxshAAVTpqWN/Fut2U6yUE0=;
        b=VLOTZee++7r9akEorRLfhNmbuplw4Y7p0g+u1b7CLf8Q3UfTX93Slt39aMF1z9S33N
         gVeCgZDDlyVQJup/Q1nymrJ+umeR/W+ya3oWTu25TKRKMKwSIcHJT/0VGk31NLLcrvLp
         Nti90rDxuEEiVc56zo6dhQfNoo7tk7VuwHK+tWG1OckJ7LZ5QvkXLnELh3Lrfwl5i6t/
         kjF8Gga93iR69zcZyFtGwFPRRX6yw6jKDEHkBPyPdARpa4njzoZ/AwIzSGQpQtHqlcl0
         B4WfaqJibsdGrRmQ+aHCSmqEbFymDuDb8pk++otrsdZ1DLSGjcLoL0x1qI9Czc3pKD7x
         X8oA==
In-Reply-To: <1405509844-30070-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com


--nextPart8271459.JD8iG9oTCk
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 July 2014 at 15:24:02, Ivan Shapovalov wrote:=09
> This needs your version of discard algorithm, because blocks inside e=
xtents of
> discard set are now marked as allocated.
>=20
> BTW, have you dropped the case with erase unit size < block size? Thi=
s is
> probably OK, but configurations with nonzero alignments are then brok=
en. Not
> worth handling these, I think, but nevertheless a warning could be us=
eful ;)
>=20
> Ivan Shapovalov (2):
>   reiser4: discard support: perform discards and deallocations after =
writing logs.
>   reiser4: discard support: proof-of-concept for "discard before deal=
loc".
>=20
>  fs/reiser4/block_alloc.c | 48 +++++++++++++++++++-------------------=

>  fs/reiser4/discard.c     | 60 ++++++++++++++++++++++++++++++++++----=
=2D---------
>  fs/reiser4/discard.h     |  4 +++-
>  fs/reiser4/txnmgr.c      | 35 ----------------------------
>  fs/reiser4/txnmgr.h      | 13 ++---------
>  fs/reiser4/wander.c      |  3 ++-
>  6 files changed, 73 insertions(+), 90 deletions(-)

...and yes, these patches should be considered nothing but a payload fo=
r testing
whatever you use for systematic full-system backups :)

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart8271459.JD8iG9oTCk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPGigwACgkQxUKljSIMAnCUyQD/Z7pGTXLTCCHOlEFOR7wR8zfn
vRFJhDqWdiWD9WKWeisA/R9U1pTfo2JvBcMS68OFa9RXXAFlY/MUL4J13NCcBoTm
=fxDi
-----END PGP SIGNATURE-----

--nextPart8271459.JD8iG9oTCk--

