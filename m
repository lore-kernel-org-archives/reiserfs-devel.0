From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 20:36:05 -0500
Message-ID: <4137CA85.50203@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <4136E0B6.4000705@namesys.com> <1117111836.20040902115249@tnonline.net> <200409021309.04780.oliver@neukum.org> <4137BE36.5020504@slaphack.com> <617051682.20040903024749@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <617051682.20040903024749@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Spam <spam@tnonline.net>
Cc: Oliver Neukum <oliver@neukum.org>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Spam wrote:
[...]
|   Do you mean in the kernel or as a filesystem/VFS plugin that would
|   extend the functionality to include version control?

The filesystem plugin.  But this needs some kernel support, which scares
people.  Read the archives if you don't believe me.

Besides, we'd want per-block copy-on-write support anyway to make it
sane.  That has to go in the filesystem.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTfKhXgHNmZLgCUhAQIR5w//Z6hg58uVvIJuwNCb764lFj22iHwLvg0T
JvjQeOSCz7p2/uv+dHN2MRNDeezmvGfH49Y7RE78Q9e1xrfZFGZKyybHVisfea1t
f9Bk8M6ZtykKnUdPhq5MsDH9Oo98dXMNEWhDw5WUYMzvglitMUcd4np3gGEtr539
yKHuxZhqjc/lQ9rd6PFKJYab1m9RAabQnGMHRIvx0T98iW3EI9pyOd0u1oUVCiRi
RxllyP0KCg7wxFv93b4zYHsv5BO8E7MWVI4aKuBUCqrc8ObJnDLDbO/8FfMvDt/1
Do9nlikFh4IaRvwZtmQA0nVv80uxtjnSOCs7F2r+qqNyprcHIdj2m+3x5zE8Tbfz
YCkI5BopHub94yBvhlcFGiKBtigLDsH3zHc66dVDl4SreJPKo+yirjjZ+RrU3HN1
iK+aFp5GxapcYDkMNOS0ab9TPejqLVyJ+Ci5mSNckcMARC9v+2mT7JTCBupyXZar
LSLFYef+W7ipKq5ZMurDB17I5y7VXfwOTd+oSwQdMwlsQlJs/AFOOGdJywtLGLy1
6jhejQlziPLWB9hz9wFAjWyHPrS0XsCNbtGbBESIVmqvLsZmpcAULpMn7TGc8aJg
0r79ODKlGK8lYJRIquRhZzd51oqiBfFJcX969XGPMPUBX4x3GZjaOlj79OQ7Ih3s
Qd8PSfUVzGU=
=Cw9B
-----END PGP SIGNATURE-----
