From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 27 Sep 2016 04:43:11 +0300
Message-ID: <1474940591.1773.4.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
         <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-E6/veKsuorYsxU2ZY3yz"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=LOQSnKJ23+4FotZO7lDk3V61MB3tS2PgIKZ1vOUkGlo=;
        b=UFLzjz8rRRnMCvM2swyig7BZPStZ92A0ePgQBENYQbqD/NtDqzkpyy5WNxCV5ytymA
         LB7SmzRapGpZ2xDt5g9Jqq/hIH5/Klm1dNI5dMpkTvMFnbJI8YZDQ7/pMpdIzpEuVtmv
         uyjnCbvnhqT8qIOMOZr+D0cDPMZsABXCx1Jsc=
In-Reply-To: <57E9A32D.3000108@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-E6/veKsuorYsxU2ZY3yz
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

I've noticed that your tree has an if(0) in should_punch_hole(),
while you've previously posted code for race detection in the hole
punch mechanism, and this code is not in your tree... is this correct?

--=20
Ivan Shapovalov / intelfx /
--=-E6/veKsuorYsxU2ZY3yz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX6c6vAAoJEHveF8jk4w6dO7oP/A3bY8fk8IZ6FJZGuDAhz6el
muCJkTcSbPckZKR8RpHsQG0qGZBAyePBgZ0fNEkqQqKqZF8Lu++xeQjKMIxZm31X
0XZ/9acsuN88TsRM7iamUg5rueoUISA3/k/Xklk8uLzaZg2rniuV99ZxHiaDoiLT
rtq6leBHMU9u8Z59Mr0YCBX+oMgvVDEuDMDpeK5fIxl6yqbNhhKVM+SilQvqPkjy
tmu4U42mC3R8FwntBUveCrcbF9G/ed+WAXCWPOSIA2Qy7d1VERpJc6nXvkeMkoby
QWfANSm47YpELVp17D0LpxLR0eXgzl66Dwsq7ffwjugBg9G3+UqsvAIjqjKeFxPS
cojWUIlisSOeB91xMIe09HJIlxeaTBaICnSIvwWrgdYf4xLmdU6GUa/s48QhPbc4
T8Bc/VlD2YMAyS5YeQJ5yRoRZs8+kJao6BF6FJnnhQgwatWskX7+WdSTsbdWbwjG
9UG4xFifn6ukzXoh7bfoMcO7BTaQNYlQ8snyPbiqFjuztYYctuJlOQk1dCN1QaeY
CYB4SqZLDWQPkTfFzaUAuR/KsLqvv3RXzwcFsgOqP4CUZKTTkg4WtFPgPPH2/LiA
vn0FyO4Qcfi0rO3g+0tefxsNSuDUjG5so8+66VK7HrxDletEKljbMlnmLwVd0oCV
8oWmPqpwnU5vdxpaY/d7
=MLQD
-----END PGP SIGNATURE-----

--=-E6/veKsuorYsxU2ZY3yz--

