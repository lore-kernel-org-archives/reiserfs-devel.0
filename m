From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 on 2.6.13-rc6-realtime-preempt
Date: Fri, 12 Aug 2005 13:55:19 -0500
Message-ID: <42FCF097.9090205@slaphack.com>
References: <20050811224503.7dbd67dd@SiRiUS.home> <42FC665D.4030802@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FC665D.4030802@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: gimpel <gimpel@sonnenkinder.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Hello

> reiser4 depends on several core kernel patches. I think you did not
> apply them.

What kind of symptoms would not applying them cause?  I grab patches
from -mm, but only the ones with "reiser4" in the name.  They seem to
work with minimal tweaking on my part, and no one said anything when I
mentioned this before.  They do seem solid...

> You might want to try to apply this patch
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-for-2.6.12-realtime-preempt-2.6.12-final-V0.7.51-29.patch.gz

Should I get patches from there, instead of -mm, in the future?  Which
is more likely to be current for a given *stable* kernel,
reiser4-for-2.6 or -mm?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQvzwlngHNmZLgCUhAQI3/w//bELhjwULVxxfqIdZje3Tp49ws4AZNMSD
Sgl6TNRv+2VhyCbj1yM7p64wf3dGG9mxBe1F28CrEHWghCJnBsWBgFtheSOkLQS6
nxpSHHwGv/VeU3fKvKwmkMNRYb2o+Olgob2bsdBeKWyQ/9UKXYEy/TvW4rm1hhx4
LOCJz7G0EKWNz3LdPcFBniA0beV2sTC06Z2T/JQI10RELSC6FtYwCIFC0WMcSMjG
lDxCY5bLMqTNt5Rm7vUPjofoq7Ir0JA/vDQAqYW2DRgx1tuh49pOXjDbpxf8XhHP
p1D/BnzUYkCCO2O5Boo+A0tSoIQ09CaAvbp4NtWgWFY/aogOSmF8WXe/fRg17dKe
1lt+zUdF3n9dt8OKVJ3XGyekw4N2Cr1wGBTXQ7lm9DzGalvSUl2r9oTk9/E/A2LS
gY+IusSHWezcrHVPtJxQg1uEQWJN9xlJiVNYBJmx4HpS+4H/U6tdXpJ+bQnhljoh
ZklD6bnXdoU9wUSfxLBYl6yv8/tZV5Bv8qzMZus74lkjfcjGyk6AGVtjamzxHrhg
j7w1Lc8B8W35qtnTv1xoPrUV1ulw2TWPkMso2QZyThNzkxcT+UKQj1mWZFiuO8hH
Coj92FDf3NRrB/j2sXae9HxHCKFqLRqzXvUnB4O2HJL9r89YJwJvuvASbScdK0Xj
OiE3+pf0clg=
=PcmR
-----END PGP SIGNATURE-----
