From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Wed, 28 Sep 2016 00:51:02 +0300
Message-ID: <1475013062.1621.5.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
                 <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
                 <1474944195.1773.15.camel@intelfx.name>
                 <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
         <1475001384.1609.2.camel@intelfx.name> <57EAE900.8060301@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-dC0Q0pUpTk9VMHwq8AlH"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=6h634/9Mz1qlo5opI+p1dMBBR7JgU9BWeorMnbhk8EY=;
        b=TxmqR6vRluRBtmuGRRl2ALY3GhEIN9Lhkfek8JS19r1Jq9e0taBTeUr5s9VJ6gmFZB
         ObMr1Owq3KJ0uBiqe9LQWLi97D6cPrmq67uFfrAkBp4YmDXAF866oCURJxzyEb49qsaL
         FPXqSE+76CL7vrrSA/JNPc52EKjDDRTV7d8Mw=
In-Reply-To: <57EAE900.8060301@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-dC0Q0pUpTk9VMHwq8AlH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-27 at 23:47 +0200, Edward Shishkin wrote:
>=20
> On 09/27/2016 08:36 PM, Ivan Shapovalov wrote:
> >=20
> > On 2016-09-27 at 16:13 +0200, Edward Shishkin wrote:
> > >=20
> > > On 09/27/2016 04:43 AM, Ivan Shapovalov wrote:
> > > >=20
> > > > On 2016-09-27 at 00:37 +0200, Edward Shishkin wrote:
> > > > >=20
> > > > > On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
> > > > > >=20
> > > > > > On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
> > > > > > >=20
> > > > > > > Hello everyone,
> > > > > > >=20
> > > > > > > I have set up the updated Namesys repositories at my
> > > > > > > Github
> > > > > > > page.
> > > > > > > Those repositories are supposed to contain the latest
> > > > > > > updates
> > > > > > > in
> > > > > > > the (stable) master branch and in other (experimental)
> > > > > > > branches
> > > > > > > that
> > > > > > > I'll announce.
> > > > > > >=20
> > > > > > > 1) https://github.com/edward6/reiser4
> > > > > > >=20
> > > > > > > This is a "standalone" reiser4 tree, which doesn't
> > > > > > > include
> > > > > > > specific
> > > > > > > changes of Linux kernel needed for reiser4 port. Such
> > > > > > > changes
> > > > > > > can
> > > > > > > be
> > > > > > > found at the project's page on Sourceforge:
> > > > > > > https://sourceforge.net/projects/reiser4/
> > > > > > >=20
> > > > > > > An example of work with the standalone reiser4 tree:
> > > > > > >=20
> > > > > > > . Patch the respective kernel with the latest available
> > > > > > > stuff
> > > > > > > from
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Sourceforge;
> > > > > > > . cd to the "fs" directory;
> > > > > > > . delete the directory reiser4;
> > > > > > > . instead of the deleted stuff clone the standalone
> > > > > > > reiser4
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0repository from Github;
> > > > > > > . build and install as usual.
> > > > > > >=20
> > > > > > > 2) Libaal and Reiser4progs:
> > > > > > >=20
> > > > > > > https://github.com/edward6/libaal
> > > > > > > https://github.com/edward6/reiser4progs
> > > > > > >=20
> > > > > > > Before building Libaal and Reiser4progs execute the
> > > > > > > ./prepare
> > > > > > > script,
> > > > > > > which will create files needed for build process.
> > > > > > >=20
> > > > > > > Thanks,
> > > > > > > Edward.
> > > > > > Wow, finally.
> > > > > >=20
> > > > > > Maybe we could avoid that "all changes for 10 years"
> > > > > > commit?
> > > > > Hi Ivan,
> > > > > Sorry, don't have a time to granulate it.
> > > > >=20
> > > > > >=20
> > > > > > I tried to keep track of all patches since 3.2...
> > > > > There will be "all changes for 6 years" commit.
> > > > > Is it much better?
> > > > So well, I finished splitting off all known diffs from that big
> > > > commit.
> > > > Tt was 12k(+)/8k(-), now it is 7k(+)/7k(-).
> > > >=20
> > > > The updated branch is here: https://github.com/intelfx/reiser4
> > > > (unfortunately, not fast-forward).
> > > >=20
> > > > Moreover, my tree has accumulated quite a few differences from
> > > > your
> > > > one. I've dropped trivial discrepancies (comments, formatting
> > > > etc.)
> > > > and put the larger ones in separate branches:
> > > >=20
> > > > 1. https://github.com/intelfx/reiser4/tree/differences/enotty
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(unsupported ioctls return -ENOTTY, n=
ot -ENOSYS)
> > > >=20
> > > > 2. https://github.com/intelfx/reiser4/tree/differences/migratep
> > > > age
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(the ->migratepage() implementation, =
which I still do not
> > > > completely
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0understand, but it works)
> > > >=20
> > > > 3. https://github.com/intelfx/reiser4/tree/differences/renameat
> > > > 2
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(renameat2(RENAME_NOREPLACE) implemen=
tation, which you
> > > > haven't
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0merged somewhy)
> > > >=20
> > > > 4. https://github.com/intelfx/reiser4/tree/differences/adjust-t
> > > > o-3.
> > > > 15
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(part of porting to 3.15 which, again=
, you haven't merged
> > > > somewhy)
> > > >=20
> > > > These branches are on top of that granular "master".
> > > > Anyway, please take a look.
> > > It was definitely useful work,
> > > I'll look at those differences..
> > Maybe you could also consider rebasing things on top of that
> > extracted
> > granular history?
> >=20
>=20
> Interesting idea, but I am not able to estimate
> complexity of such rebasing for now.
>=20


While we do not have any forks and can afford non-fast-forward updates
of master, the complexity is almost nil.

To rebase your format41 branch, one can do this:

git rebase --preserve-merges --onto 3c7b3c5802e20381496f641fe64b6c1573228c6=
e 8a896fd48ed35c7dfa0188f9b7f4cbdfd469cacb format41

where 8a896fd is merge-base of format41 and master (that big commit),
and 3c7b3c5=C2=A0is the corresponding commit of the synthesized history.

Both commits have identical file content (`git diff 8a896fd 3c7b3c5`
yields empty output).

--=20
Ivan Shapovalov / intelfx /
--=-dC0Q0pUpTk9VMHwq8AlH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX6unGAAoJEHveF8jk4w6d4X8P/3V+/UwFLHbGrFftjM0oIlMr
y5SC6Dwh4v7PPSm7HazZomnOF2gQdTCc4lI5tSuhYrxn2DREdrGlWTw8VFOtoW54
wgwXIokMX1WH+vY5XHqiTzqk4bHUEt28pZpIMzLDTqMGBQvIEEiKvZMr10Vtc0Ra
8WDypNluBhfhqOlUGFCU2u+v3iwPLlWHWbUtptl51aPft/UX7eOOJPTQoJcV21bZ
p+HfHr9jI9/sU7lMbf1SeMSeOSw8wUqXg59MO86iLs1TZyVhRcxB0k/XBdKuqVtk
zBVqXx0dmpLiGkXGcy+X07LcI2I2o55oTj531BnOS8yS3eExugGmar6bjMxhHPSb
TAWKb3Fl1n3DzqYABdSOQRF+G9YuGtm2nEpohbIhJzuQae65KbD3sHqgD/z3TuIq
6rsRxkMjIJrQNjeCJEev7JWKmN2bHakfWMD1ZA83/i7Aqjz6+EsqMPV+VQkodzC3
nWtIdPvBUHT6SokeLLwl3fHd9hW2UOx0NNHEjyEHP3YZ8dNhNz3Tg6BYmGVP2+Ts
RG1YBe11FRMpP85oWVC3MdOh/7PJZmQvkORTfqheYRINCI4h1Qs4rLCbWJpTB6c1
uXA3pq8vDWJzn4ZjYV5h4wMfRnzuUryYbrBjnIn/M0IhKDhu6zKDuZ4zuNdurgOX
muqghI8HkFoakDR3hrev
=jSYh
-----END PGP SIGNATURE-----

--=-dC0Q0pUpTk9VMHwq8AlH--

