From: David Masover <ninja@slaphack.com>
Subject: Re: Where Reiser4 may break?
Date: Thu, 27 May 2004 16:30:10 -0500
Message-ID: <40B65DE2.4060607@slaphack.com>
References: <20040526204457.GJ4990@nysv.org> <1085648404.1915.219.camel@tribesman.namesys.com> <20040527092541.GN4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18880-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040527092541.GN4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Markus T=F6rnqvist wrote:
[ ... ]
| Well, we'll see what the future brings in this.
| I couldn't care less about architecture-compatibility, but then again,
| I may start caring if the situation demands it :)

Do we gain any speed by not adding that compatibility?  If so, it should
be optional (mkfs/mount option, not compile time).  Maybe we should be
able to specify at mkfs time what architecture to optimize for (x86,
ppc, everything, etc.), but let it default to optimize for this one.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQLZd4ngHNmZLgCUhAQI+/w//eXFRJdpj9S3nGCv7dFB7MTNdkocib8Ys
JXph2dL0N7nO04WiVLkxFaAIYWmQVQ/pN9JTMX36PQVm8f/An5ltXJyb2516TZSy
rGxD+WR13uB26b6/c2CERT6yE93FHQAWFEgkJqtCsBYD2ICAIoa03qGdyWyefxQ5
Y3H7o340KIcOCzcNzDJvk66/VdZYG83KBaiMrg9fohPPV0d/gFbLSNguGJAHzh/B
TYAi5bucYPBCMRta5CpmccD721icDryrbHxibWxLdA7+ncJquCLb4zdBaeNLD3Qh
qoFxKxqvSZOwnXqCXKc2EgDT16a+bFOwj39xPynMeBXbuJrvVL0a70og7kGjMyf1
tRA4s7LflAMq0JldM/fRxbQb/RtCe2nxh5/p0V5wI2ZFWyilowYooZ3uWm4lqRWe
RPbCFxPeGuZqq782yhnln7iaPqrBK0PaaPqsBgousnacwQnfqaZl/D1QGqt03bUi
zR+hTvKbc1zv85f2LoprEA8HtdMXwzQH8AdK1E+0qW/bHI6EAGBtBXWE29QJDObe
mh0AZDstqcm9OiK75hEGPRPnjGs72S7TKwuX8eIk1kTxmiTQqvXsQmpGwWZOHRoD
z0qVFt0a3a9JQnMsC1UE6qpbxjK5oEzmj/l+MCiqQuobKm/oS6r1g0V0cVACCkg3
vE+bRcrGcDE=3D
=3DEIQc
-----END PGP SIGNATURE-----
