From: David Masover <ninja@slaphack.com>
Subject: Re: file as a directory
Date: Mon, 20 Dec 2004 23:31:53 -0600
Message-ID: <41C7B549.7090705@slaphack.com>
References: <2738999945-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2738999945-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander G. M. Smith wrote:
[...]
|>>Everthing stuff that works on the assumption that what they are working
|>>on fits in RAM (or can overflow into swap space in a pinch), [...]
|
|
| Admittedly my experiment was for a RAM disk.  It can be extended to a real
| disk if the number of inodes in a graph traversal can fit into memory (or
| otherwise can somehow be locked).  If that doesn't work, then the user
| would have to delete individual files before removing a directory cycle.

Would it work in a typical setup?  My instinct is no.

Also, there's the consideration that applications want some memory, too.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQce1SHgHNmZLgCUhAQJ8Jg//VhW+qzwb12UN85JVDnxmN3Xzi4Dfyhay
Uvw2668X8iTbm2MWt10o0xOThdNcUM2tfuzCQi+qFx3pbYpDKFyoE3PdjmvYC0iA
MuHgb0GFULqCF5/DQT3mrLTrNO7P5njA6agVcHkcg6v1Uciuwjt+tDDMHNJLAe+o
wc7y02sA0i6XnmORjv4OK+KYJTnPl2bm9FtVq4RTYYG3bro823sxgzor9ldkuINE
6NPU0dx6ldp3g1yomn03wG03KciOqj5F5i1iILjOGwUhxigTAqSoJjyPbpA78Rt+
d3xA8i1Lqjbrow5lBVEdipNZYLTFniNIdW+E5+xXtzVMbOkVtnFansI66IMgr1SA
Y3OscmmT4rgdrKXxjY69Rib6bmfm3eDhaJsvPi6SRWuo9aH3yg/46TuBdj+7ZNnq
bAWanB+J3xdDXXTsjkRFOXXIDPCzAKEImDbp/PGKrpgk+Zuil7P3D8PUirCrKmv+
DiETgm8aKEU4eLsd8dhPu/NcOkXFH+zl2l2hNi8rLALSYnEFfbpo8wkXILym3Omb
CYJ9hw6TPPxABJZ927iNymvoUUf5Pm5i0w5N+GuDjYshew/feuKEKV+NjJ5X4e12
I68fPHO8VrdyGFRfX2i6ABVkCnGbjOWplpRY1JhGoPpBIMukvxbl7WJNbkT4u6pB
hUgGpPqWPy0=
=gKJo
-----END PGP SIGNATURE-----
