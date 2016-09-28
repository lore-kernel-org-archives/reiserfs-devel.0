From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Wed, 28 Sep 2016 18:03:00 +0300
Message-ID: <1475074980.10051.3.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
         <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
         <1474944195.1773.15.camel@intelfx.name>
         <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
         <1475001384.1609.2.camel@intelfx.name> <57EAE900.8060301@gmail.com>
         <1475013062.1621.5.camel@intelfx.name>
         <b2b6b412-6a80-37d3-0055-3fe84a195afd@gmail.com>
         <1475058981.10051.1.camel@intelfx.name>
         <5aba3b45-ccd5-35bb-96a9-335c78022f92@gmail.com>
         <3d1f6d29-b3a8-1e14-d622-a3e158ec79d1@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-b7lnpAFym1a+RJHyqsx4"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=5WMysS3dBp+EySadbOlG/L8pYdfEJaGbEfopoSftQDg=;
        b=REUN4xm0o07QizcnldI3zDiJbI4Fkq8lgO8IyvlmiXYrfWMd2HTMJt98QF2/QBmBHt
         cPadjLkjFFw0bOWgEW5ZLa4NT0WK/DFI9OOqwH+U+0pYyXbc/RkKxDVo3jVBLJHImbx8
         Dp3ov1GjJtITJa7WjO2XQqkERG03aahNFSiho=
In-Reply-To: <3d1f6d29-b3a8-1e14-d622-a3e158ec79d1@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-b7lnpAFym1a+RJHyqsx4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-28 at 16:44 +0200, Edward Shishkin wrote:
>=20
> On 09/28/2016 03:56 PM, Edward Shishkin wrote:
> >=20
> >=20
> > On 09/28/2016 12:36 PM, Ivan Shapovalov wrote:
> > > On 2016-09-28 at 12:17 +0200, Edward Shishkin wrote:
> > > > On 09/27/2016 11:51 PM, Ivan Shapovalov wrote:
> > > > > On 2016-09-27 at 23:47 +0200, Edward Shishkin wrote:
> > > > > > On 09/27/2016 08:36 PM, Ivan Shapovalov wrote:
> > > > > > > On 2016-09-27 at 16:13 +0200, Edward Shishkin wrote:
> > > > > > > > On 09/27/2016 04:43 AM, Ivan Shapovalov wrote:
> > > > > > > > > On 2016-09-27 at 00:37 +0200, Edward Shishkin wrote:
> > > > > > > > > > On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
> > > > > > > > > > > On 2016-09-24 at 22:16 +0200, Edward Shishkin
> > > > > > > > > > > wrote:
> > > > > > > > > > > > Hello everyone,
> > > > > > > > > > > >=20
> > > > > > > > > > > > I have set up the updated Namesys repositories
> > > > > > > > > > > > at my
> > > > > > > > > > > > Github
> > > > > > > > > > > > page.
> > > > > > > > > > > > Those repositories are supposed to contain the
> > > > > > > > > > > > latest
> > > > > > > > > > > > updates
> > > > > > > > > > > > in
> > > > > > > > > > > > the (stable) master branch and in other
> > > > > > > > > > > > (experimental)
> > > > > > > > > > > > branches
> > > > > > > > > > > > that
> > > > > > > > > > > > I'll announce.
> > > > > > > > > > > >=20
> > > > > > > > > > > > 1) https://github.com/edward6/reiser4
> > > > > > > > > > > >=20
> > > > > > > > > > > > This is a "standalone" reiser4 tree, which
> > > > > > > > > > > > doesn't
> > > > > > > > > > > > include
> > > > > > > > > > > > specific
> > > > > > > > > > > > changes of Linux kernel needed for reiser4
> > > > > > > > > > > > port. Such
> > > > > > > > > > > > changes
> > > > > > > > > > > > can
> > > > > > > > > > > > be
> > > > > > > > > > > > found at the project's page on Sourceforge:
> > > > > > > > > > > > https://sourceforge.net/projects/reiser4/
> > > > > > > > > > > >=20
> > > > > > > > > > > > An example of work with the standalone reiser4
> > > > > > > > > > > > tree:
> > > > > > > > > > > >=20
> > > > > > > > > > > > . Patch the respective kernel with the latest
> > > > > > > > > > > > available
> > > > > > > > > > > > stuff
> > > > > > > > > > > > from
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Sou=
rceforge;
> > > > > > > > > > > > . cd to the "fs" directory;
> > > > > > > > > > > > . delete the directory reiser4;
> > > > > > > > > > > > . instead of the deleted stuff clone the
> > > > > > > > > > > > standalone
> > > > > > > > > > > > reiser4
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rep=
ository from Github;
> > > > > > > > > > > > . build and install as usual.
> > > > > > > > > > > >=20
> > > > > > > > > > > > 2) Libaal and Reiser4progs:
> > > > > > > > > > > >=20
> > > > > > > > > > > > https://github.com/edward6/libaal
> > > > > > > > > > > > https://github.com/edward6/reiser4progs
> > > > > > > > > > > >=20
> > > > > > > > > > > > Before building Libaal and Reiser4progs execute
> > > > > > > > > > > > the
> > > > > > > > > > > > ./prepare
> > > > > > > > > > > > script,
> > > > > > > > > > > > which will create files needed for build
> > > > > > > > > > > > process.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Thanks,
> > > > > > > > > > > > Edward.
> > > > > > > > > > >=20
> > > > > > > > > > > Wow, finally.
> > > > > > > > > > >=20
> > > > > > > > > > > Maybe we could avoid that "all changes for 10
> > > > > > > > > > > years"
> > > > > > > > > > > commit?
> > > > > > > > > >=20
> > > > > > > > > > Hi Ivan,
> > > > > > > > > > Sorry, don't have a time to granulate it.
> > > > > > > > > >=20
> > > > > > > > > > > I tried to keep track of all patches since 3.2...
> > > > > > > > > >=20
> > > > > > > > > > There will be "all changes for 6 years" commit.
> > > > > > > > > > Is it much better?
> > > > > > > > >=20
> > > > > > > > > So well, I finished splitting off all known diffs
> > > > > > > > > from that
> > > > > > > > > big
> > > > > > > > > commit.
> > > > > > > > > Tt was 12k(+)/8k(-), now it is 7k(+)/7k(-).
> > > > > > > > >=20
> > > > > > > > > The updated branch is here: https://github.com/intelf
> > > > > > > > > x/reis
> > > > > > > > > er4
> > > > > > > > > (unfortunately, not fast-forward).
> > > > > > > > >=20
> > > > > > > > > Moreover, my tree has accumulated quite a few
> > > > > > > > > differences
> > > > > > > > > from
> > > > > > > > > your
> > > > > > > > > one. I've dropped trivial discrepancies (comments,
> > > > > > > > > formatting
> > > > > > > > > etc.)
> > > > > > > > > and put the larger ones in separate branches:
> > > > > > > > >=20
> > > > > > > > > 1. https://github.com/intelfx/reiser4/tree/difference
> > > > > > > > > s/enot
> > > > > > > > > ty
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(unsupported io=
ctls return -ENOTTY, not
> > > > > > > > > -ENOSYS)
> > > > > > > > >=20
> > > > > > > > > 2. https://github.com/intelfx/reiser4/tree/difference
> > > > > > > > > s/migr
> > > > > > > > > atep
> > > > > > > > > age
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(the ->migratep=
age() implementation, which I
> > > > > > > > > still do
> > > > > > > > > not
> > > > > > > > > completely
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0understan=
d, but it works)
> > > > > > > > >=20
> > > > > > > > > 3. https://github.com/intelfx/reiser4/tree/difference
> > > > > > > > > s/rena
> > > > > > > > > meat
> > > > > > > > > 2
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(renameat2(RENA=
ME_NOREPLACE) implementation,
> > > > > > > > > which
> > > > > > > > > you
> > > > > > > > > haven't
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0merged so=
mewhy)
> > > > > > > > >=20
> > > > > > > > > 4. https://github.com/intelfx/reiser4/tree/difference
> > > > > > > > > s/adju
> > > > > > > > > st-t
> > > > > > > > > o-3.
> > > > > > > > > 15
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(part of portin=
g to 3.15 which, again, you
> > > > > > > > > haven't
> > > > > > > > > merged
> > > > > > > > > somewhy)
> > > > > > > > >=20
> > > > > > > > > These branches are on top of that granular "master".
> > > > > > > > > Anyway, please take a look.
> > > > > > > >=20
> > > > > > > > It was definitely useful work,
> > > > > > > > I'll look at those differences..
> > > > > > >=20
> > > > > > > Maybe you could also consider rebasing things on top of
> > > > > > > that
> > > > > > > extracted
> > > > > > > granular history?
> > > > > > >=20
> > > > > >=20
> > > > > > Interesting idea, but I am not able to estimate
> > > > > > complexity of such rebasing for now.
> > > > > >=20
> > > > >=20
> > > > > While we do not have any forks and can afford non-fast-
> > > > > forward
> > > > > updates
> > > > > of master, the complexity is almost nil.
> > > > >=20
> > > > > To rebase your format41 branch, one can do this:
> > > > >=20
> > > > > git rebase --preserve-merges --onto
> > > > > 3c7b3c5802e20381496f641fe64b6c1573228c6e
> > > > > 8a896fd48ed35c7dfa0188f9b7f4cbdfd469cacb format41
> > > > >=20
> > > > > where 8a896fd is merge-base of format41 and master (that big
> > > > > commit),
> > > > > and 3c7b3c5 is the corresponding commit of the synthesized
> > > > > history.
> > > > >=20
> > > > > Both commits have identical file content (`git diff 8a896fd
> > > > > 3c7b3c5`
> > > > > yields empty output).
> > > >=20
> > > > OK, everything went smoothly,
> > > > Thanks for scrupulously archiving things!
> > > >=20
> > > > Edward.
> > >=20
> > > Great. (In fact, I intended this to be `git push -f`-ed, not `git
> > > merge`-ed with original history, but well, git blame now does the
> > > right
> > > thing, so it's good enough as it is.)
> > >=20
> > > We do not use github pull requests and still send formatted patch
> > > series to the ML, correct?
> > >=20
> >=20
> > Yup, everything to the list, as usual..
>=20
> BTW, your fstrim-scanner is the first candidate to scrub ;)
> Actually, I think about a common multi-functional scanner, with 3
> modes:
> 1) discard only (handle only free blocks);
> 2) scrub only (handle only busy blocks);
> 3) combined (scan the whole partition; for free blocks call discard,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for busy ones call scrub).
> Any ideas?
>=20
> Thanks,
> Edward.
> PS: We have an own ioctl number: 0xCD inherited from ReiserFS(v3).

I still have to finish the erase unit detection (which has completely
stalled) to merge all this work. Moreover:

For the fstrim, we have dropped all locking and serialization issues
and declared that fstrim is best-effort: if it misses some blocks due
to concurrent transactions allocating and freeing blocks, it doesn't
matter.

For the scrub, this won't fly...

--=20
Ivan Shapovalov / intelfx /
--=-b7lnpAFym1a+RJHyqsx4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX69ukAAoJEHveF8jk4w6dSlEP/0ugSXjt+GI7vMheqGIIlmgR
SwaU8UjcXINK99PT3qRhvU29HLDDpo5Iy5W8me/d1iJWUWxVv6tjrsK+niPtIGq4
rZpWH9z8+ZnREa2Z6GyAheezEXhZ56UQMM24fnmqW17aHosnlVr2avcKPM9vsZ79
u052GajgkiZRZFePtzec5S04+81+1fcpccxZkyRfwe7vFJxXoq5j5pypbwLr7QZf
UV+MCE72qRwY2CEEVKxEqYD9BtWiAaxhKG+7DOyUUKjoiLiZkVRcWo2h+R3EOzGZ
PRjM7CYjZ0n4uYW+XRoUddpfolpss2QLUompMO74jx2Z+VRWgjbRDnKoWu74jogI
xvwrvMfWUrhzlEFUQyWJG0yVB0J8c3CohSgQUh+w5Rp68N1MxhbyfRTHGQo3s4Ju
+3g7KDFTFt5xFitz0gfk6W7wpv/YcyxJOmXpFGZgfv/KtcWsfPE42CPMX3EQ87T1
TTK656tDJEuj58MiaGd5I4vEJdzQef1UwbOPNNWw3Xf617lev6lSsbnggN7nMz5D
fiJFlI5w6L3F6tXiJ/lCOov+o3blWVpow40NlgXvSz7Qxsl+9JkY3p8PFL5gEViZ
nlBCVUgQcQVjlASlU955uR10B4Sjh1ls3/HAYK5ZTxRzfHRk/xJ2Ps+hus9GNM5R
ZMMNyyD8RoniyJMroNQo
=5K+A
-----END PGP SIGNATURE-----

--=-b7lnpAFym1a+RJHyqsx4--

