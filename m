From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 27 Sep 2016 01:05:48 +0300
Message-ID: <1474927548.10826.6.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-2yqflecjOwsKX/Jlf1bw"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=P9XOs+yGuznhhi/ZI9Q6DWeEcNZZCYgtILjKT7GypJY=;
        b=EcfpcjNMWmayTyJdKDRArreqtEg/iM3ASnVZcKTscoa4mCUUriCbzthwhBlifvMBAq
         8DAb8+BtfOsDUtpXKw52xw7jzsGSlJI/c3iA22FXE+KzNOhb/2fzKaNzXyTivYLv6TkL
         EqN06EVv++VS3qXhpkf5H4fVeGJQFMl/TAaOQ=
In-Reply-To: <57E6DF37.1050702@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-2yqflecjOwsKX/Jlf1bw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
> Hello everyone,
>=20
> I have set up the updated Namesys repositories at my Github page.
> Those repositories are supposed to contain the latest updates in
> the (stable) master branch and in other (experimental) branches that
> I'll announce.
>=20
> 1) https://github.com/edward6/reiser4
>=20
> This is a "standalone" reiser4 tree, which doesn't include specific
> changes of Linux kernel needed for reiser4 port. Such changes can be
> found at the project's page on Sourceforge:
> https://sourceforge.net/projects/reiser4/
>=20
> An example of work with the standalone reiser4 tree:
>=20
> . Patch the respective kernel with the latest available stuff from
> =C2=A0=C2=A0=C2=A0Sourceforge;
> . cd to the "fs" directory;
> . delete the directory reiser4;
> . instead of the deleted stuff clone the standalone reiser4
> =C2=A0=C2=A0=C2=A0repository from Github;
> . build and install as usual.
>=20
> 2) Libaal and Reiser4progs:
>=20
> https://github.com/edward6/libaal
> https://github.com/edward6/reiser4progs
>=20
> Before building Libaal and Reiser4progs execute the ./prepare script,
> which will create files needed for build process.
>=20
> Thanks,
> Edward.

Wow, finally.

Maybe we could avoid that "all changes for 10 years" commit?
I tried to keep track of all patches since 3.2...

--=20
Ivan Shapovalov / intelfx /
--=-2yqflecjOwsKX/Jlf1bw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX6Zu8AAoJEHveF8jk4w6dkdEP/j/JTiyFYcm+dBqIrFISMyiK
XFsFFkOSSCg0WYZSbhUc+4l0Es88kA+eZj8xA1j6taxIfKSe8CcEJYLo3M+6C30S
N1xTt+IVZUN7aKPPOB6UrMqQ6vAtFpVzHFHzImxCW4/oEIBJSx3Md9Mm1bX7GgH2
SPvBjrrsB0/7DsbqJvpKai5Gt8IoGz46/U8WuBTWxt9nOaWUxNwaZKXoNtILCVi4
5BYst+0eN9e3JTDZFxnQRhHeOQu56dFt2Ij9PISX9IYICOPzGa6lCU014UDnFQjp
cdVaN6GqQ533MdNdk/d05XhUgFz6lYemCWeeVoId65/knQdeSUoxCKja72mJQAt7
1FwuJgoq/YpoWqmX6PiTELGbwno+/1oImN4rOsI3jeIbhJjZsUzvbNKElQspZYQ0
o6Xe58fqBIuYj9COrZYH0dUTIaJesqIpIE4rZjm+dYqRfPCJiCUuxtFfKxSHFWGO
CNTYgbLCBSOSl/zuRDig/n/8/3tPl24V6KeGlgRiyrOdoRAXBgzriDklnh9hROF9
54CtDD3YecoIipgYIjMAA4kErjlZ3egdmKPfDHcu2rBVBzB7g1Wmqi0WOXckgt6/
M62uF/wl4szzSTHr2EE/EpxHWtu2atuAvTSZygo4wgicMmExp6DyQZCM1S/dce1F
wNnnlt8c+du27yTRCbhC
=+VJT
-----END PGP SIGNATURE-----

--=-2yqflecjOwsKX/Jlf1bw--

