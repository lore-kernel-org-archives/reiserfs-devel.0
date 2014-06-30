From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4: discard implementation, part 2: FITRIM ioctl aka batch mode
Date: Mon, 30 Jun 2014 13:35:36 +0400
Message-ID: <1706370.uJ3CLsN3j1@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6017210.4ilXhCGnOE"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=XdBSp7uHYd2lr+jylr2L3+LUnwUZWv+Dmnhgl0MlFsU=;
        b=lndBQRPZeg8KjebyF+wdnpIcEiTvjhawUoutZ2rLCnf2eg3fUDQSbioDlOd1dKXbmY
         oahumblE/GxAClhOs24qwUt20P4xnCgkfeFFu8gE3XfuC+UJqzS2pZMESPRDka6cmJLn
         7ijxWgEE4FEfKQxjs2nEjwNykMW8GbiwzpbbgsBiwJsZwE9Yl+DTMq2NI9Xo5irteSHp
         UVGt+d1F5tvBxIzF8/XvJtIs4pylJ+VpinCBcOgr9OJzAOIGSU7HYb71lI9ylXM9urwv
         My3u+qeQNb65LFQlfqkbYmZiDSHyoae2Bo3lwiTN2HDVi2BBxmFwT0Q7+r8hIuY01vEW
         Zt9Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart6017210.4ilXhCGnOE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

I've started to think about implementing the second part of discard sup=
port,
namely "batch mode" (FITRIM ioctl). And it seems like I don't yet quite=

understand how to do it.

It had been suggested to reuse existing transaction and discard machine=
ry for
this feature: create a transaction, allocate+deallocate all possible bl=
ocks
and then force-commit it.

However, the algorithms of discard_atom() are very inoptimal for discar=
ding
large amounts of known free space -- a bitmap check is performed for ev=
ery
single discard unit. Repeatedly calling reiser4_alloc_blocks() to alloc=
ate
every possible block also seems inefficient. And this will still miss t=
hose
10% of reserved space, IIUC.

So the best way I can imagine is to introduce a new space allocator met=
hod,
"iterate free space", and discard all reported extents (blkdev_issue_di=
scard()
will take care of aligning them properly).

With such method, a question arises: how to prevent bitmap modification=
s
and disk writes to free space when such iteration is in progress?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart6017210.4ilXhCGnOE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOxL2wACgkQxUKljSIMAnABjQEAsRLN1OJDnrJ4H4iQUHmhJK47
YuubhAaB3KyhOSur/V8BALXuB5Bfu3WLYA4BCNy7V0u/uJiRZwL0t71rB3PqX10W
=dRFC
-----END PGP SIGNATURE-----

--nextPart6017210.4ilXhCGnOE--

