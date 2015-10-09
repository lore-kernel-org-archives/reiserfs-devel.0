From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Fri, 09 Oct 2015 19:29:14 +0300
Message-ID: <1444408154.4546.6.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
	 <5617D55D.2040908@gmail.com> <1444407218.4546.3.camel@gmail.com>
	 <D0AB4773-B98F-4D8B-8070-7FB88D7E1CED@linuxhacker.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-oInb+hHDyz7JM5vrd14F"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=cntZZYPUR1j2ai7onrjZnbwDkMY4nJ69MRYM9dAT0+c=;
        b=lpT8T4dLKOmFjOEl1ZyimMtT0FXrttwP+aP1jRMd6kAz1X5OcEq+xNTju+bArK29KD
         77Zunmv8141bGFhVHFxtD8qHMfdHPeihHcbQWY5B8jr5xvMIrb1mXxpYf1pQu2ceEEMt
         e6Ozs4g/9i9j7y9Gkms9nk+MTWqGhB/EQAr2v8xNMhAY/WZEeriEqwJrVI0CzwAJlu/7
         Xem21QSNQrz5cVLKrhMMd4Yb2TMtO3uJvRABs486cUmIbnJ1ngLqEHfmYZNiEPZf6uZq
         szw5Z3nMRgDnc9IZq/iS4ZjTTWoQPQWZqVHEoRYxGKh6pb9Vu9eFrfmmvtoGoEmix/gJ
         KPMg==
In-Reply-To: <D0AB4773-B98F-4D8B-8070-7FB88D7E1CED@linuxhacker.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@linuxhacker.ru>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org


--=-oInb+hHDyz7JM5vrd14F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-09 at 12:27 -0400, Oleg Drokin wrote:
> On Oct 9, 2015, at 12:13 PM, Ivan Shapovalov wrote:
>=20
> > On 2015-10-09 at 16:55 +0200, Edward Shishkin wrote:
> >=20
> > >=20
> > > On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:
> >=20
> > > > On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
> >=20
> > > > > Hi Ivan,
> > > > >=20
> > > > > On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
> >=20
> > > > > > Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists
> > > > > > .sou
> > > > > > rcef
> > > > > > orge.net/msg02745.html
> > > > > Do you have a stack trace for reiser4?
> > > > > How to reproduce it?
> > > > I'll rebuild the kernel without the fix and provide you with
> > > > the
> > > > oops'
> > > > stacktrace asap.
> > > >=20
> > > > I guess that it's tied to the config. In my case, it is
> > > > reproducible on
> > > > each boot, just as the DE starts up and something issues the
> > > > first
> > > > fsync().
> > >=20
> > >=20
> > > Yes, let's try to find the culprit who doesn't set i_wb...
> >=20
> > So, here is the oops:
>=20
> I suspect this will not help you much.
> What you probably need to do is to add an assertion of some sort when
> the page
> is inserted into this list (on which you later do waiting for
> writeback) and
> it's not dirty.
> Either that or you might be able to see in the coe right away where
> such
> addition is made without markign the page dirty.

Indeed. I'm thinking the same as I read the code.
Did I say that I don't know neither reiser4 nor VFS well?.. :)

Thanks for the advice, anyway.

--=20
Ivan Shapovalov / intelfx /


--=-oInb+hHDyz7JM5vrd14F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYX61oACgkQxUKljSIMAnDg0AEAvK2ijj2FXv5r4oY6jvPDAHEL
63edUAxA30L4SWdvoJMBAJt4+GPsJw1lJLvA0nE8KdOjs4frHARF7HBJAa4szyU8
=N/EP
-----END PGP SIGNATURE-----

--=-oInb+hHDyz7JM5vrd14F--

