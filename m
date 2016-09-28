From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Wed, 28 Sep 2016 13:36:21 +0300
Message-ID: <1475058981.10051.1.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
         <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
         <1474944195.1773.15.camel@intelfx.name>
         <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
         <1475001384.1609.2.camel@intelfx.name> <57EAE900.8060301@gmail.com>
         <1475013062.1621.5.camel@intelfx.name>
         <b2b6b412-6a80-37d3-0055-3fe84a195afd@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-m8pIg9MnkLPy2enLXDY9"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=JT81G2Fpdidh8w6ljnDrxXgE8osPF7jdbk8jUEZm/Q8=;
        b=YPiVfPA04VpIq+HIhOdpGxHu/sWNb23greehTJ/gSmC5Xscy3NqrPvDUcjnsukLea+
         L76J5JGLdx4PBR0b7PswyntOEbDeNrwsG3VrVW9/PSH5jHyu+s/MHxVvEAQVwo+nJx6z
         MLFSi4eyQx84RTEMxsb0uSmsldcBu2pKcreQQ=
In-Reply-To: <b2b6b412-6a80-37d3-0055-3fe84a195afd@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-m8pIg9MnkLPy2enLXDY9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-28 at 12:17 +0200, Edward Shishkin wrote:
> On 09/27/2016 11:51 PM, Ivan Shapovalov wrote:
> > On 2016-09-27 at 23:47 +0200, Edward Shishkin wrote:
> > > On 09/27/2016 08:36 PM, Ivan Shapovalov wrote:
> > > > On 2016-09-27 at 16:13 +0200, Edward Shishkin wrote:
> > > > > On 09/27/2016 04:43 AM, Ivan Shapovalov wrote:
> > > > > > On 2016-09-27 at 00:37 +0200, Edward Shishkin wrote:
> > > > > > > On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
> > > > > > > > On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
> > > > > > > > > Hello everyone,
> > > > > > > > >=20
> > > > > > > > > I have set up the updated Namesys repositories at my
> > > > > > > > > Github
> > > > > > > > > page.
> > > > > > > > > Those repositories are supposed to contain the latest
> > > > > > > > > updates
> > > > > > > > > in
> > > > > > > > > the (stable) master branch and in other
> > > > > > > > > (experimental)
> > > > > > > > > branches
> > > > > > > > > that
> > > > > > > > > I'll announce.
> > > > > > > > >=20
> > > > > > > > > 1) https://github.com/edward6/reiser4
> > > > > > > > >=20
> > > > > > > > > This is a "standalone" reiser4 tree, which doesn't
> > > > > > > > > include
> > > > > > > > > specific
> > > > > > > > > changes of Linux kernel needed for reiser4 port. Such
> > > > > > > > > changes
> > > > > > > > > can
> > > > > > > > > be
> > > > > > > > > found at the project's page on Sourceforge:
> > > > > > > > > https://sourceforge.net/projects/reiser4/
> > > > > > > > >=20
> > > > > > > > > An example of work with the standalone reiser4 tree:
> > > > > > > > >=20
> > > > > > > > > . Patch the respective kernel with the latest
> > > > > > > > > available
> > > > > > > > > stuff
> > > > > > > > > from
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Sourceforge;
> > > > > > > > > . cd to the "fs" directory;
> > > > > > > > > . delete the directory reiser4;
> > > > > > > > > . instead of the deleted stuff clone the standalone
> > > > > > > > > reiser4
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0repository from=
 Github;
> > > > > > > > > . build and install as usual.
> > > > > > > > >=20
> > > > > > > > > 2) Libaal and Reiser4progs:
> > > > > > > > >=20
> > > > > > > > > https://github.com/edward6/libaal
> > > > > > > > > https://github.com/edward6/reiser4progs
> > > > > > > > >=20
> > > > > > > > > Before building Libaal and Reiser4progs execute the
> > > > > > > > > ./prepare
> > > > > > > > > script,
> > > > > > > > > which will create files needed for build process.
> > > > > > > > >=20
> > > > > > > > > Thanks,
> > > > > > > > > Edward.
> > > > > > > >=20
> > > > > > > > Wow, finally.
> > > > > > > >=20
> > > > > > > > Maybe we could avoid that "all changes for 10 years"
> > > > > > > > commit?
> > > > > > >=20
> > > > > > > Hi Ivan,
> > > > > > > Sorry, don't have a time to granulate it.
> > > > > > >=20
> > > > > > > > I tried to keep track of all patches since 3.2...
> > > > > > >=20
> > > > > > > There will be "all changes for 6 years" commit.
> > > > > > > Is it much better?
> > > > > >=20
> > > > > > So well, I finished splitting off all known diffs from that
> > > > > > big
> > > > > > commit.
> > > > > > Tt was 12k(+)/8k(-), now it is 7k(+)/7k(-).
> > > > > >=20
> > > > > > The updated branch is here: https://github.com/intelfx/reis
> > > > > > er4
> > > > > > (unfortunately, not fast-forward).
> > > > > >=20
> > > > > > Moreover, my tree has accumulated quite a few differences
> > > > > > from
> > > > > > your
> > > > > > one. I've dropped trivial discrepancies (comments,
> > > > > > formatting
> > > > > > etc.)
> > > > > > and put the larger ones in separate branches:
> > > > > >=20
> > > > > > 1. https://github.com/intelfx/reiser4/tree/differences/enot
> > > > > > ty
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(unsupported ioctls return =
-ENOTTY, not -ENOSYS)
> > > > > >=20
> > > > > > 2. https://github.com/intelfx/reiser4/tree/differences/migr
> > > > > > atep
> > > > > > age
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(the ->migratepage() implem=
entation, which I still do
> > > > > > not
> > > > > > completely
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0understand, but it wo=
rks)
> > > > > >=20
> > > > > > 3. https://github.com/intelfx/reiser4/tree/differences/rena
> > > > > > meat
> > > > > > 2
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(renameat2(RENAME_NOREPLACE=
) implementation, which
> > > > > > you
> > > > > > haven't
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0merged somewhy)
> > > > > >=20
> > > > > > 4. https://github.com/intelfx/reiser4/tree/differences/adju
> > > > > > st-t
> > > > > > o-3.
> > > > > > 15
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(part of porting to 3.15 wh=
ich, again, you haven't
> > > > > > merged
> > > > > > somewhy)
> > > > > >=20
> > > > > > These branches are on top of that granular "master".
> > > > > > Anyway, please take a look.
> > > > >=20
> > > > > It was definitely useful work,
> > > > > I'll look at those differences..
> > > >=20
> > > > Maybe you could also consider rebasing things on top of that
> > > > extracted
> > > > granular history?
> > > >=20
> > >=20
> > > Interesting idea, but I am not able to estimate
> > > complexity of such rebasing for now.
> > >=20
> >=20
> > While we do not have any forks and can afford non-fast-forward
> > updates
> > of master, the complexity is almost nil.
> >=20
> > To rebase your format41 branch, one can do this:
> >=20
> > git rebase --preserve-merges --onto
> > 3c7b3c5802e20381496f641fe64b6c1573228c6e
> > 8a896fd48ed35c7dfa0188f9b7f4cbdfd469cacb format41
> >=20
> > where 8a896fd is merge-base of format41 and master (that big
> > commit),
> > and 3c7b3c5 is the corresponding commit of the synthesized history.
> >=20
> > Both commits have identical file content (`git diff 8a896fd
> > 3c7b3c5`
> > yields empty output).
>=20
> OK, everything went smoothly,
> Thanks for scrupulously archiving things!
>=20
> Edward.

Great. (In fact, I intended this to be `git push -f`-ed, not `git
merge`-ed with original history, but well, git blame now does the right
thing, so it's good enough as it is.)

We do not use github pull requests and still send formatted patch
series to the ML, correct?

--=20
Ivan Shapovalov / intelfx /
--=-m8pIg9MnkLPy2enLXDY9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX650lAAoJEHveF8jk4w6dkCMQAMDO8Zc7R0q7uxGYG0CGJvU6
xyg5wrfBXq38AdJ7Y9ZOAosqGLHeuLKjx5C0emrTjVDFZ0gAMp64sOYV0jLDaRgW
yyKCliCiqQqXOy/4immlfWemeWxeeiCBh9ydxVmMvNC7khISL1P+d9G02wNrZhKb
SA9by9p/dZYh81B65gJy/IObzFoJk3N+PIEOw22npZVWy0eZ26oe1tVdYFVcaVAy
xOH0gw2EXEZ0VhOYoE24wlaL1BJYP7+6U0GEKieTEb+D/3e0vumQlHU6I64t+JgD
uG+u7U3dgyoh78Y48/j+auP2P+0bWNjAnkAlYlo0HHbHRnK108QcP/lrGtEu7ijj
GrJvFKMJ8XSl4+TeXy1TnQLoYLrLh3lXqJJhsPBlKoJuwLeYztMiZaqi6AA/fnPg
IFQ9bf0UkUe5jMtTU2GkGbXeSqnfdsIsExF3uFpwnF/2zJwB+eAsp3yqWDhUpF6g
+GJ0zuREqwOGr7hZ/YM1oiUGF/2RsUwA+mMPExw/1WgafGwADRGSM72itLa6zdj2
bX87AW6GeQV9aRDF90C+I+MLJN7uszyvIewrHnBGjkGnASbqlkjcsmenH91MDCto
VpjpzYga/qdH7fiDuri302fIKbvaDpmm5havjjm04WcH8NvuW6PNSmEd7CICBCe3
W4giVPeFr+1/EGKpQlEo
=OcuT
-----END PGP SIGNATURE-----

--=-m8pIg9MnkLPy2enLXDY9--

