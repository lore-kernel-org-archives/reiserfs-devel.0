From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 27 Sep 2016 05:43:15 +0300
Message-ID: <1474944195.1773.15.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
         <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-RJbT/ZAFyTmD7xyrkiae"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=LEBMpnsuY4sXzVUDFsGjqa5fBZCKaqLix2lzgfw1O8M=;
        b=L/tPxRK1jfNdX6XY2smZ7IrQA4XfRmvQiuU8U3gEPJrbT92TPw52HmSKtNArfrdDZ7
         pTHZv3T0hmX6/iZ3/+zTrqxdG7tVbzzzQ2Ftjk5KxH1TbEVRFElU37PsfZEJ9vYj4HSd
         R1MBsvZmmnop71zCVQjgkrNSMNmOYkifuyHd0=
In-Reply-To: <57E9A32D.3000108@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-RJbT/ZAFyTmD7xyrkiae
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

So well, I finished splitting off all known diffs from that big commit.
Tt was 12k(+)/8k(-), now it is 7k(+)/7k(-).

The updated branch is here:=C2=A0https://github.com/intelfx/reiser4
(unfortunately, not fast-forward).

Moreover, my tree has accumulated quite a few differences from your
one. I've dropped trivial discrepancies (comments, formatting etc.)
and put the larger ones in separate branches:

1.=C2=A0https://github.com/intelfx/reiser4/tree/differences/enotty
=C2=A0 =C2=A0(unsupported ioctls return -ENOTTY, not -ENOSYS)

2.=C2=A0https://github.com/intelfx/reiser4/tree/differences/migratepage
=C2=A0 =C2=A0(the ->migratepage() implementation, which I still do not comp=
letely
=C2=A0 =C2=A0 understand, but it works)

3.=C2=A0https://github.com/intelfx/reiser4/tree/differences/renameat2
=C2=A0 =C2=A0(renameat2(RENAME_NOREPLACE) implementation, which you haven't
=C2=A0 =C2=A0 merged somewhy)

4.=C2=A0https://github.com/intelfx/reiser4/tree/differences/adjust-to-3.15
=C2=A0 =C2=A0(part of porting to 3.15 which, again, you haven't merged some=
why)

These branches are on top of that granular "master".
Anyway, please take a look.

--=20
Ivan Shapovalov / intelfx /
--=-RJbT/ZAFyTmD7xyrkiae
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX6dzDAAoJEHveF8jk4w6dnKEQAJP0Fz8YFN2BnU4z9otOack4
n62nw16UlWOZgPOo4jQQPNJqeOOT7mwkZV8aEzLfb+fNOJxKoYkV/e5Ottfx/AFG
CcA4Rz4E4it1h7/Ucwuhm+G/L8EX+4u7T+HB91UPWOa1dJ7l1EX0KAuO3Rx5SXWj
0ezM6bExNru3oY/msjkoz3f+My2lqkLkOS6nh9DFpbBpDg7TakceWQzElBi/JtOf
A06AootThCkGbYz+Cz6GVE8fV2dgTYEPMscYbpyVeGwA+4dhzqX9aqM51LDJtE2x
v8j1c2p8qUXG0Zr71Q/+bWpcWx4WwCKW7zF+yjgYGbvhucTy4HYa6nvDYjVXMHMc
LcIk4C7AjU/Fu6gXYEi7XPQkMuFJWADq0y9WLTtBrUQ2Mv8CVdjgVW1gc62gfjX4
33NEWMVyOdWkP+/Wnqc3A2GzKM//QMT9ePm0N/WUOS5Xv1DvElrs/W8TWPWErNBf
3X4fSAL7D5v+hH5YyH9/wLPcLZc8N/vVmFLXr3dEyC401KwtgRkVcjBDHKBisaIP
a8OrZgMcVymnqogeLUlDtMuOusR1le7aYoG/eKUyLV5FGKrVc2FZ+DzRIgU6MvBk
4XNWR7sTRiPghTtKBt9nHfSQ5BbowAelI2dbOhUad92QD3wzApXz6dZCVyZZW6j4
M5AxmYmUZvaafVbtM4nW
=whLU
-----END PGP SIGNATURE-----

--=-RJbT/ZAFyTmD7xyrkiae--

