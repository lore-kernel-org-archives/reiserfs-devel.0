From: Chris White <chriswhite@gentoo.org>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 09:34:45 +0900
Message-ID: <200509180934.50789.chriswhite@gentoo.org>
References: <432AFB44.9060707@namesys.com> <200509171356.14497.vda@ilport.com.ua> <200509171415.50454.vda@ilport.com.ua>
Reply-To: chriswhite@gentoo.org
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8365185.0ZjyuWgaIn";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26020-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509171415.50454.vda@ilport.com.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Denis Vlasenko <vda@ilport.com.ua>
Cc: Christoph Hellwig <hch@infradead.org>, Hans Reiser <reiser@namesys.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

--nextPart8365185.0ZjyuWgaIn
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

CC-List trimmed

On Saturday 17 September 2005 20:15, Denis Vlasenko wrote:
> > At least reiser4 is smaller. IIRC xfs is older than reiser4 and had more
> > time to optimize code size, but:
> >
> > reiser4        2557872 bytes
> > xfs            3306782 bytes
>
> And modules sizes:
>
> reiser4.ko        442012 bytes
> xfs.ko            494337 bytes

All this is fine and dandy, but saying "My code is better than yours!!" sti=
ll=20
doesn't solve the issue this thread hopes to achieve, that being "I'd like =
to=20
get reiser4 into the kernel".  There seems to be a lot of (historical?)=20
tension present here, but all that seems to be doing is making things worse=
=2E =20
PLEASE keep this thing a tad on par.  Keeping this up is hurting everyone=20
more than helping.  I wish I could say something as simple as "let's just b=
e=20
friends", but that's saying a lot.  I can say this though: this is open=20
source, and that means that our source is open, and we should be too.

Chris White

--nextPart8365185.0ZjyuWgaIn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDLLYqFdQwWVoAgN4RAqLiAJ45bbLt80lAjBr7n60OzhWS6Lw4XwCcCM9S
wAcGa8G84ZhHCCkL4iJHRFw=
=RlIP
-----END PGP SIGNATURE-----

--nextPart8365185.0ZjyuWgaIn--
