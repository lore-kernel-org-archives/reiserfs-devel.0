From: Francesco Biscani <biscani@pd.astro.it>
Subject: Re: Vanilla kernel patch
Date: Mon, 11 Oct 2004 11:32:23 +0200
Message-ID: <200410111132.29059.biscani@pd.astro.it>
References: <200410071402.33421.biscani@pd.astro.it> <20041008162925.3e0e03c4.lists@mjh.name>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart6072609.ofIg2QYZL9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041008162925.3e0e03c4.lists@mjh.name>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart6072609.ofIg2QYZL9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thanks for your response Milan.

On Friday 08 October 2004 16:29, Milan Holz=E4pfel wrote:
> > What are the pitfalls I'm falling in, doing this? Is this safe or is
> > there stuff in -mm that is absolutely needed by reiser4?
>
> Well I'd make the guess that if there is something in the mm kernel
> which is absolutely needed by reiser4 then the thing won't link or you
> will be unable to load the module if you chose to compile it as a
> module.

That's my guess too. I've also noticed that apart from the changes I talked=
=20
about in my previous mail, the reiser4 patches applied cleanly.

However I still would like to hear from the devs about this issue. I've got=
=20
my / partition on reiser4, so forgive me if I'm pretty picky about this ;-)

Best regards,

=2D-=20
Dr. Francesco Biscani

Dipartimento di Astronomia
Universit=E0 di Padova

biscani@pd.astro.it

--nextPart6072609.ofIg2QYZL9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.10 (GNU/Linux)

iD8DBQBBalMssknZM9JqQs0RAi3PAJ90CDJkEDrwXFATUvgQHUXJlqSjvQCfaq8L
0Rn4m5TJXQMWoZ7tzuO2BZQ=
=YC8L
-----END PGP SIGNATURE-----

--nextPart6072609.ofIg2QYZL9--
