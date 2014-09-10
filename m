From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4 (ccreg40): very slow mount, poor unlink performance, questions about compression modes
Date: Wed, 10 Sep 2014 23:00:52 +0400
Message-ID: <1466481.l6KPymqJEh@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5142621.rhNmMcrtan"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=+F1/rYDgzIuZKcamq/DqZiH6Q1HaCu91WiF723e2dwU=;
        b=tbNaTWUyC2Q35PV+sOFSVIxjEfSkU3KNOjZo59f4xYLhf2mVFGR1X0ENJbRMuIEa4E
         e4wXapGyQ9a0HFIY6HDA9w4U1dgmFbU7aoj5TTJgadUHC8oL0nauBcgJhX9qR/gSxbOF
         UIH/3/2RAF1luGMMu0yDGmuuEaPrRP2uKO7B44esgHVggc3vhSjlfOiX66X6eSIhVaXQ
         i+rIA3idczmvJnwiJCbF+UsVDdFfEPG3+Wnpt208sI+R+2KOOxPMyheyqutJqRKX6pjR
         Vvlk4PmaQ8cYvblwDwvcg8QBcu4yWkIlWrHbF1lHEn1NQ/2Q9ALyMr+3XOiEXM2nsXjU
         LKVQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--nextPart5142621.rhNmMcrtan
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi!

The preamble: recently I had to force-change my configuration (the old =
laptop
was stolen). What I have now is a combination of a tiny 16 GiB SSD and =
a huge
1 TiB HDD.

...So I've placed my /home on HDD. Partition size is 800 GiB, formattin=
g
options are "create=3Dccreg40,compress=3Dgzip1,compressMode=3Dlatt" and=
 I have a few
questions.

1. What is the recommended compression mode?
More specifically, what is the default "conv" mode? What is its purpose=
, why is
it the default?
I'm asking, because I wasn't able to understand its purpose from code, =
and the
code itself looks hackish in some places (hardcoded fallback to extent-=
only
files, hardcoded policy, hardcoded fallback to "latt" in many cases, et=
c).

2. The mount time of a 800-GiB partition is >20 seconds. And with
dont_load_bitmap it's around 1-2 seconds. Why so much? Why other filesy=
stems
have drastically less mount times? If they have an equivalent of
dont_load_bitmap enabled by default, why don't we do it?

3. Given a directory tree with ~20k files of total size around 20 GiB,
its removal takes forever. From strace I see that a single unlink takes=

~1 second. Again, why so much? Is it related to my choice of "latt" com=
pression
mode over the default "conv"?

3a. I can reproduce the "directory not empty" bug :) Interestingly, it =
is
always the same directory under the aforementioned huge hierarchy. (I'v=
e
done the unpack-remove cycle a few times.)

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart5142621.rhNmMcrtan
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQQn+gACgkQxUKljSIMAnCmOwEAzASNsnWlh/3UtgjLVvxlliMs
9o8WJNFmxhK/kufHa2sBALcW9hI9LbybHr0mZmFx6MdO27j8aTQgKjs7QGYMNlx3
=Ni2g
-----END PGP SIGNATURE-----

--nextPart5142621.rhNmMcrtan--

