From: David Masover <ninja@slaphack.com>
Subject: Re: shrink reiserfs
Date: Mon, 24 Jan 2005 00:46:34 -0600
Message-ID: <41F499CA.4060006@slaphack.com>
References: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net>    <20050123171105.GG10921@backtop.namesys.com>    <18298.62.135.89.53.1106502596.squirrel@mail.infinitylimited.net>    <20050123190735.GH10921@backtop.namesys.com>    <18682.62.135.89.53.1106507496.squirrel@mail.infinitylimited.net>    <20050123194918.GI10921@backtop.namesys.com>    <20050123212315.GK10921@backtop.namesys.com> <18958.62.135.89.53.1106517199.squirrel@mail.infinitylimited.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <18958.62.135.89.53.1106517199.squirrel@mail.infinitylimited.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jake@infinitylimited.net
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Jake Hawkes wrote:
[...]
| My next question, can I grow a reiserfs filesystem backwards in the
| partition?

Don't think so, but I wouldn't know.

[...]
| If not, then I'm kinda stuck with a spotty partition table and I'g going
| to have pull the drive and start hauling around disk images and stuff,
| which I'd like to avoid.

How full is the fs?  If less than half-full, you could try this (for
example):

| free space | reiserfs partition |

shrink fs and partition to less than half:

| free space | reiser | free spac |

make new partition to the "right" of old partition:

| free space | reiser | new parti |

dd from reiserfs to new partition:

| free space | reiser | reiserfs  |

delete old reiserfs partition:

| free space          | reiserfs  |

make new partition

| new partition       | reiserfs  |

dd old reiserfs to new partition

| reiserfs partition  | reiserfs  |

delete old partition, expand new partition and fs

| reiserfs partition              |




This could clearly be much easier to follow, but it illustrates two points:

- - If your disk is not full, you can almost always get from your current
partition scheme to any new one without completely backing up /
reformatting (no pulling the drive, no installing a new backup drive, etc.)

- - Sometimes, the workaround for a missing feature literally takes more
time than writing the feature or buying new hardware.

Disclaimer:  this may not be such a time, and my comments may just stem
from my wish that reiser4 had a repacker and online
resizer/shrinker/grow-forward/backward feature.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQfSZyHgHNmZLgCUhAQJRSA/+P2f5U/BNhaXjm3Q15gBYiuhOur2jbWw0
+LOYpFN2+zLYWFNmTIt7ypHshXF+Qejt55cwvPF/aLG4pWsTcwVYtVYWti8El7/y
lhLiu6b/AeEnBBMyOHqZ4VyBdalR7JzftGU0n0gBcTKTFC3eaWYlMIcSEprnIpEw
KIrpsteUn5vaF5Z9yLBG40GDi6l+c/LH3nzdOw+rlTtjwhhBdVvV9SSbQYwY+jaS
QbW/7hlImrOuhDrgGUTo+ne7TYnJvn3ZtDztXpeTskpNGs7UHE+7yLQxwgBIg3ma
R14ToHnnTbXftQwyq/H7Dcv3qQP7tuO+IqAbd9QCBVtA+pOv5yYqpodmjtU6FJd3
uINrO1aMRfsX772lcbyiJHo70H2ksZAOODCYD/Id7I6s3qWYxr8kpHgiL8az8Mpn
3sVbmKfZSPuM34vYlrLh1P2So3A3L8ZROYaciUvEyKeE0Gpbpq7bxrTSeRTfSrzI
W2ZP2GpI9pxzXigeghK/B/UcLvkgNU7n61o3yGkinJJjoUdjb7Ymfo4g1r5wN7Px
FKSrsvCz4J0x6NsV1bBE3pLdnb9Cf8gqnhxNVc/R2ftVtDKlmJTokMx8/UxAe//T
uaX/5M1R0cNIWzVUDQ+oNiTeeZhKf9EMyQkyqdUW84ES+fw5Hoqge4jz/kZYAP7E
6T2GGLHyiUc=
=TudP
-----END PGP SIGNATURE-----
