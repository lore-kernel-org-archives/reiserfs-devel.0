From: Todd Lyons <todd@mrball.net>
Subject: Re: Still wrong reported file size after --rebuild-tree
Date: Wed, 30 Oct 2002 19:57:36 -0800
Message-ID: <20021031035736.GG14386@mrball.net>
References: <20021030193045.69179289.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vSsTm1kUtxIHoa7M"
Return-path: <reiserfs-list-return-11848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021030193045.69179289.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs <reiserfs-list@namesys.com>

--vSsTm1kUtxIHoa7M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Philippe Gramoull=E9 wanted us to know:

>I just wanted to let you know that after rebuilding the tree for a 500Go
>volume, i still have wrong file size reported :
>/dev/sdb1            572418604 174714996 397703608  31% /storage

Hmmm, ours showed 96% or something like that.  I'll check to see if it's
accurate.

>-r-x--x---    1 19415372 19415373 83388383504122186 Aug 13  1970 25s_lb.jpg
>-r--rw-rw-    1 19415354 19415355 83388306194710840 Aug 13  1970 25slight.=
jpg
>-r---wxrwx    1 19415331 19415332 83388207410463009 Aug 13  1970 25slight_=
ln.jpg

We had these too.  Humongous uid and gid numbers.

>I'll make metadata available as soon as debugreiserfs is finised.
>(reiserfsck used was 3.6.4 ( 3.6.4 pre3)

I really don't think it's a requirement to see our metadata as our
problems were caused by faulty hardware and not any bugs in the fs
itself.
--=20
Blue skies...		Todd
| Get a bigger hammer!   | Security is like an onion.  It's made   |
| http://www.mrball.net  | up of several layers and makes you cry. |
| http://faq.mrball.net  |                         --Howard Chu    |
   Linux kernel 2.5.44   3 users,  load average: 0.00, 0.00, 0.00

--vSsTm1kUtxIHoa7M
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9wKowIBT1264ScBURAmhtAJsFIlE8l0qJ+SFIan+tCFWTELYejQCgsb7H
So5QTvB7SKlsc3F5IJLaAS4=
=zwfe
-----END PGP SIGNATURE-----

--vSsTm1kUtxIHoa7M--
