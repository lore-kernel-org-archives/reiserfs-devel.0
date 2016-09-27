From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 27 Sep 2016 21:36:24 +0300
Message-ID: <1475001384.1609.2.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
         <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
         <1474944195.1773.15.camel@intelfx.name>
         <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-x34S4Xym7ZxXO2ilc72K"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=oivJHWUIXwagUib5ghj98V8FL13YYz04jC+Wv1OgZPU=;
        b=MRWLpsyK+y9k3ThRPrQ8dMb84zdbFBS+7yV8E66VK8pDJXBBoOujm6gpiAHDjjcNBv
         UYYLDv7W4Wajq+XHdn56k+2Glj/UvwEVO+MJniHGdVARnvmqQTHtIMHzbQacCpJ/SZmp
         yejVvm3VYEmyVNTT/ehxwJ2G9AnkcP3n4q33A=
In-Reply-To: <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-x34S4Xym7ZxXO2ilc72K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-27 at 16:13 +0200, Edward Shishkin wrote:
> On 09/27/2016 04:43 AM, Ivan Shapovalov wrote:
> >=20
> > On 2016-09-27 at 00:37 +0200, Edward Shishkin wrote:
> > >=20
> > > On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
> > > >=20
> > > > On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
> > > > >=20
> > > > > Hello everyone,
> > > > >=20
> > > > > I have set up the updated Namesys repositories at my Github
> > > > > page.
> > > > > Those repositories are supposed to contain the latest updates
> > > > > in
> > > > > the (stable) master branch and in other (experimental)
> > > > > branches
> > > > > that
> > > > > I'll announce.
> > > > >=20
> > > > > 1) https://github.com/edward6/reiser4
> > > > >=20
> > > > > This is a "standalone" reiser4 tree, which doesn't include
> > > > > specific
> > > > > changes of Linux kernel needed for reiser4 port. Such changes
> > > > > can
> > > > > be
> > > > > found at the project's page on Sourceforge:
> > > > > https://sourceforge.net/projects/reiser4/
> > > > >=20
> > > > > An example of work with the standalone reiser4 tree:
> > > > >=20
> > > > > . Patch the respective kernel with the latest available stuff
> > > > > from
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Sourceforge;
> > > > > . cd to the "fs" directory;
> > > > > . delete the directory reiser4;
> > > > > . instead of the deleted stuff clone the standalone reiser4
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0repository from Github;
> > > > > . build and install as usual.
> > > > >=20
> > > > > 2) Libaal and Reiser4progs:
> > > > >=20
> > > > > https://github.com/edward6/libaal
> > > > > https://github.com/edward6/reiser4progs
> > > > >=20
> > > > > Before building Libaal and Reiser4progs execute the ./prepare
> > > > > script,
> > > > > which will create files needed for build process.
> > > > >=20
> > > > > Thanks,
> > > > > Edward.
> > > > Wow, finally.
> > > >=20
> > > > Maybe we could avoid that "all changes for 10 years" commit?
> > > Hi Ivan,
> > > Sorry, don't have a time to granulate it.
> > >=20
> > > >=20
> > > > I tried to keep track of all patches since 3.2...
> > > There will be "all changes for 6 years" commit.
> > > Is it much better?
> > So well, I finished splitting off all known diffs from that big
> > commit.
> > Tt was 12k(+)/8k(-), now it is 7k(+)/7k(-).
> >=20
> > The updated branch is here: https://github.com/intelfx/reiser4
> > (unfortunately, not fast-forward).
> >=20
> > Moreover, my tree has accumulated quite a few differences from your
> > one. I've dropped trivial discrepancies (comments, formatting etc.)
> > and put the larger ones in separate branches:
> >=20
> > 1. https://github.com/intelfx/reiser4/tree/differences/enotty
> > =C2=A0=C2=A0=C2=A0=C2=A0(unsupported ioctls return -ENOTTY, not -ENOSYS=
)
> >=20
> > 2. https://github.com/intelfx/reiser4/tree/differences/migratepage
> > =C2=A0=C2=A0=C2=A0=C2=A0(the ->migratepage() implementation, which I st=
ill do not
> > completely
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0understand, but it works)
> >=20
> > 3. https://github.com/intelfx/reiser4/tree/differences/renameat2
> > =C2=A0=C2=A0=C2=A0=C2=A0(renameat2(RENAME_NOREPLACE) implementation, wh=
ich you haven't
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0merged somewhy)
> >=20
> > 4. https://github.com/intelfx/reiser4/tree/differences/adjust-to-3.
> > 15
> > =C2=A0=C2=A0=C2=A0=C2=A0(part of porting to 3.15 which, again, you have=
n't merged
> > somewhy)
> >=20
> > These branches are on top of that granular "master".
> > Anyway, please take a look.
>=20
> It was definitely useful work,
> I'll look at those differences..

Maybe you could also consider rebasing things on top of that extracted
granular history?

--=20
Ivan Shapovalov / intelfx /
--=-x34S4Xym7ZxXO2ilc72K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX6rwoAAoJEHveF8jk4w6dtCUP/3S7Tmmo54o7dOGSaCdN5ZEB
OaFKSLTXmIKiXVn3pXH5qHIP5qE8Z+HE2LfxE/xKX8w41mPy7w28BEb0uAhGXLkE
JfrLbR7WQGhGai3zJR47H2GpENHZCB1j109pnf72H0gybLB7hSNHcuS5a0WkA/Co
dlK26s1Jpn9w+i9fOhZOhV3LnbdwOzTKRVuwedBe0KwcSdvJ8w4fj1v5R/6ojBjR
pVKbrXKNNHzc/ZjGafGqECiZIL/fO2M2IMudpmbogr07R1EYdJXTHUFP3WiQlMBi
fHtyww5MsklkJ5/bAS4Ff6+mWmbrmWPATLUlXRyI4T/eIF2aMTMp8a+LXdVOwrX6
iO8L6A5XgSB0EjoQe3ulC0oOlR7jA1k2kpocZiNbJE/bc9hlJA2qkL3o8J1ivPdA
ZbesP2R+cutoUMUidLb0fXZIVlTgOt/pQe6NlSG7AD2bgfjibV7E3+wgB1NgUPxZ
SPhkehk1GCy55XVqGLdCqI8NrxEeMD0nr1vljufzce4Tdu4j688uFv1/kBrn2xsY
VhTAPnw1VDE/oKkz5Udtf5+S87AVSEz4cERDRvfw3oFkh43Y+c1ZJln+8ivrg5HT
KsezKrvCl7k9ro9FB3qaGtds9Djrl0thIU/Uf7wx3vK14SO1S24ENB6VAY8KEA7N
l8uMr6oPo+BR5qj/rfPZ
=SIST
-----END PGP SIGNATURE-----

--=-x34S4Xym7ZxXO2ilc72K--

