From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 27 Sep 2016 02:03:18 +0300
Message-ID: <1474930998.1773.1.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
         <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-ELJ2YBBfdmDQY6MfxXpk"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=4HfSp9duAaaJGDFelNAtHjzXE7hMRJ+/qa2lpxax5E0=;
        b=MhmKAtxtJSb8JoO117g5wcZgGHct0ioYzQmqWX08qcJxPhBkSGbOuv0xwYJw5m1aAV
         0GbAN0ioH4XfZpEJOSw9He9xDta1JFdNUKl9sMmq+8wpTZZYLn5IxrCPlKyXO2ivlg+n
         /nWstlT1AJAuhWQE7oOIZB+LASL+yyMmXLwMw=
In-Reply-To: <57E9A32D.3000108@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-ELJ2YBBfdmDQY6MfxXpk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-27 at 00:37 +0200, Edward Shishkin wrote:
> On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
> >=20
> > On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
> > >=20
> > > Hello everyone,
> > >=20
> > > I have set up the updated Namesys repositories at my Github page.
> > > Those repositories are supposed to contain the latest updates in
> > > the (stable) master branch and in other (experimental) branches
> > > that
> > > I'll announce.
> > >=20
> > > 1) https://github.com/edward6/reiser4
> > >=20
> > > This is a "standalone" reiser4 tree, which doesn't include
> > > specific
> > > changes of Linux kernel needed for reiser4 port. Such changes can
> > > be
> > > found at the project's page on Sourceforge:
> > > https://sourceforge.net/projects/reiser4/
> > >=20
> > > An example of work with the standalone reiser4 tree:
> > >=20
> > > . Patch the respective kernel with the latest available stuff
> > > from
> > > =C2=A0=C2=A0=C2=A0=C2=A0Sourceforge;
> > > . cd to the "fs" directory;
> > > . delete the directory reiser4;
> > > . instead of the deleted stuff clone the standalone reiser4
> > > =C2=A0=C2=A0=C2=A0=C2=A0repository from Github;
> > > . build and install as usual.
> > >=20
> > > 2) Libaal and Reiser4progs:
> > >=20
> > > https://github.com/edward6/libaal
> > > https://github.com/edward6/reiser4progs
> > >=20
> > > Before building Libaal and Reiser4progs execute the ./prepare
> > > script,
> > > which will create files needed for build process.
> > >=20
> > > Thanks,
> > > Edward.
> > Wow, finally.
> >=20
> > Maybe we could avoid that "all changes for 10 years" commit?
>=20
> Hi Ivan,
> Sorry, don't have a time to granulate it.
>=20
> >=20
> > I tried to keep track of all patches since 3.2...
>=20
> There will be "all changes for 6 years" commit.
> Is it much better?

I'll check how much better it is exactly :)

--=20
Ivan Shapovalov / intelfx /
--=-ELJ2YBBfdmDQY6MfxXpk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX6ak2AAoJEHveF8jk4w6dX1oP/0sUS4moDCidoGMSO+k54D+s
5sAHfJlMczD0mcB2d9k0UXQbtRC3QDAUUHXS8tp09PJ6KaeGWGE021F0Y9enQSuh
N9N9p6Zn/D5sWWuUDgGROfY3QIJuRIOn8UeFd7mO8PQsdD6iRzz1q3Cj5S1VQcH0
BtaB/Q8kQV3jLqfDkqAoO+e3llkztc/BeHiEVoMNjTYSA5Cg/B/BAuI9CYUjeQcy
Vkf3fwKRttCjVnfdu+k/XTqU0o1Lyc3cY/pjIpSuVY/vOq5djPVV8Kzw5gVqNRWN
7NuQeIG9j/oo+GfkjZE8H8IdJwn3jcFkJttrAMKZuWaZuG24RBJQAYvfYeh36Fx7
Z3A+HgbO8d/B1UANzxcMl6pCmwX3egmiJFwtwyiYhbqaJfMZgf2zMcacSA7COyMD
Ve05lQL1DzEuaGurGrmzAjBQylSU/VA+JaTqQ8fdAw++uGDfXl9kHu1Q5uVhBcm8
gMDWCMxXPD8fT9XlWvSiXXDypyBmBIbUj+PABdxWBoJZa781fTkOYyRMFNzzI5GH
tiEpfpc/L936KHITz2lrZljJ/0afuzy2dWVuQ/9ZX65CRsR08Sqi3YD+WgUfne4h
orgYpO8NnQSaujs7d/dyLQrOvX5rRDezf3+7fuMVkujAs4hx2kxnyCXKIFAjyr+y
fif0ruyznNBObjDXipVd
=Iadg
-----END PGP SIGNATURE-----

--=-ELJ2YBBfdmDQY6MfxXpk--

