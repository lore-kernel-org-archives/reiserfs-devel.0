From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 15:17:29 +0400
Message-ID: <1651199.WS1bpHXlZS@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <2026408.Yl74NqGZKK@intelfx-laptop> <53EF11C8.20209@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2329851.2EVyPf3rdn"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=L8TGndbXvgeYSYFH+u81MIaW5pGUkdn+tBn/k+FIK2E=;
        b=Sr+fSNiabxfapLvhzXS+2cQcAdYN9BsZXo/YCIbAteKqDjFtrJHt/oy+BjzJTaLAA+
         mIDfC54PQqR8bo/dXyP+4WfoQ/7cd8UE6utSCMrEAEE/onBriA/02dOhZYm1cDFJawv1
         To9P+Hxl28IchoLPO5LEFbE8i6q5io+gz//l+HruiIoWGJeAtxWTHhmLIhoNalUdOrnB
         huGYFu7iIEcmqyBqtrouEelLCHlxNw6gFh5b2jtqssaddNSECSdOj4OpIQP4RgJTmbdp
         fqXtE5W7oo2e4+vDh31p18DMcydT9ulqid2yzof4xlw0MGpJ1L2M64Qks1OWnWblxcz0
         bQqw==
In-Reply-To: <53EF11C8.20209@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2329851.2EVyPf3rdn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 16 August 2014 at 10:09:44, Edward Shishkin wrote:=09
>=20
> On 08/16/2014 02:44 AM, Ivan Shapovalov wrote:
> > On Monday 11 August 2014 at 13:39:12, Ivan Shapovalov wrote:=09
> >> [...]
> >>>> I've meant "grabbing all space and then allocating all space" --=
 so there won't
> >>>> be multiple grabs or multiple atoms.
> >>>>
> >>>> Then all processes grabbing space with BA_CAN_COMMIT will wait f=
or the discard
> >>>> atom to commit.
> >>>
> >>> It seems such waiting will screw up the system. No?
> >> I was afraid of such situations, but how would that happen? The di=
scard atom's
> >> commit will always be able to proceed as it doesn't grab space at =
all.
> >>
> >>>>    (Actually, there is a small race window between grabbing spac=
e
> >>>> and creating an atom...)
> >>>
> >>> Which one?
> >> BA_CAN_COMMIT machinery does wait only for atoms, not for contexts=
. If
> >> process X happens to grab space between us grabbing space and crea=
ting an atom,
> >> it will get -ENOSPC even with BA_CAN_COMMIT.
>=20
>=20
> I still don't see any "races" here. How atom creation is related to g=
rabbing
> space? Are we talking about races in the existing code? f so, please =
show
> the racing paths..

Well, this is not a race per se - it does not involve locking. But it i=
s
a race-like behavior.

taskA                                 taskB
=2D----------------------------------------------------------------------=
=2D--
grab very much space
                                        grab some space with BA_CAN_COM=
MIT
create an atom using the grabbed space

In this case, the taskB's grab will fail though it could wait for taskA=
's
not yet created atom.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2329851.2EVyPf3rdn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPvPc0ACgkQxUKljSIMAnAUsQD9EGvmMm3LjxNMy04mp7BRJcQa
Pr2kNMgfNumgrc62efkA/iVGIc8hCMN8KBeQGjg9sQ/YIFCOJ+DRS9DhogrOYcOz
=Pd0k
-----END PGP SIGNATURE-----

--nextPart2329851.2EVyPf3rdn--

