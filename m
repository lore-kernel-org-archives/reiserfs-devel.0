From: David Masover <ninja@slaphack.com>
Subject: Re: ".meta." as a Name Prefix
Date: Sun, 25 Apr 2004 00:44:27 -0500
Message-ID: <408B503B.30700@slaphack.com>
References: <2407572152-BeMail@cr593174-a> <4085C7B2.4010104@slaphack.com> <4085E2E1.8080302@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4085E2E1.8080302@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

|> cat urn:namesys.com:reiser4:meta/shortName
|> echo "..meta" > urn:namesys.com:reiser4:meta/shortName

Revisiting this idea:  this is a good idea for what happens _inside_ the
metas dir, for plugins.  But metas itself is a general enough,
well-enough designed and probably lasting concept that I think we can
use something like '...' or '..metas', or whatever is reasonably unique
_now_, and assume that once reiser4 hits mainstream usage, people will
be careful to develop around that name.

Inside the metas dir, though, we have plugins.  And if plugins could be
dynamic, even mostly in userspace, then we have the problem of plugins
becoming so popular that we have namespace collisions there.  I like
this solution, though -- it's kind of like the XML namespace concept,
something which should be in every language.

Using some mechanism, not sure what yet, you create a set of mappings:

meta/r4 -> meta/namesys.com/reiser4
meta/ -> meta/namesys.com/reiser4

They aren't really symlinks because the second option is for making all
children of meta/namesys.com/reiser4 available under meta/, so if you had:

meta/namesys.com/reiser4/bmap
meta/namesys.com/reiser4/plugin
meta/slaphack.com/happyface/:)

Now you have:

meta/bmap
meta/namesys.com/reiser4/bmap
meta/namesys.com/reiser4/plugin
meta/plugin
meta/slaphack.com/happyface/:)

More specific things would override less specific things, and in general
these mappings aren't allowed to touch anything that isn't itself a mapping.

I think you would use symlink() for setting these things up (cd meta; ln
~ -s namesys.com/reiser4 r4 || ln -s namesys.com/reiser4 .), and even if
they were completely dynamic, the files themselves would read like symlinks.

I heard someone say something like "reiser4 is almost shipped", so it
may be too late to send in ideas (especially ones which I've probably
said before), but I thought I'd drop this in anyway.  (sorry for the
noise if I _have_ said it before.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQItQOngHNmZLgCUhAQL9yhAAiaCH3ZxSS5T/VxgqW+Tk4jR3kjzA87Cq
dMfMFlGeS2R1X3p1nuqdb0Q8SWSvMV2cV/YgFXGq4BR+nMjTy/krm7AlXJ1Wj8ji
xORQMWWZAWsFTeIoQNgu1lDpTCfPISzsmEgLeYsq14UQn+cb8uZMIfy9/tmmY71N
W6XIsaW2hHp2LwgSsrIjZHthKZQ6WnQh0nsI/8JlU5hjJ4sbEh4SWMokDri//kGq
wiXk/489sx1u4k/ymU/CHZGSJA4c+/uBzW2QZ2qRnpa6uNwWtu/lqQhn28tkoHRw
k9TS9j0Ca0w/4k9UZFD8N1Lkxp52/XFTg+U+ZABzkIQx9VHC+nVgaVLIZSr31C4/
iTk+sHdY55kJtHOF8X7cSzx0D/V+Qo2owhOFS9B5/10NEv34UPmO4aQq9T/MeQVo
vqWF5L8h0N+zLqlTnkkf4zVBzALfTbsfk18fLeu42j8WZfkVBkHC5T2SBYjmuPHO
b3bNX1yl+xx0lFG4Wt6bz6sYhzmr2tOj1ayVEYdpZRsXZUsSwom5POeD5Yimuhd7
/VCiNhcNm17bfqOTK+e+36dE8c91YIyv32e3BBivrB2GYg1AgGfPuzMOky78GX/m
Ymh4ztKBAwoBytvsF4Aye+8h3bETBMjMoNhJT7EcvH/N4MFqtfZJLh6PafIXMIgA
IeMzRfndw1w=
=EGMz
-----END PGP SIGNATURE-----
