From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Wed, 01 Sep 2004 22:46:59 -0500
Message-ID: <413697B3.4050502@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org> <Pine.LNX.4.58.0409011800270.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0409011800270.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linus Torvalds wrote:
[...]
| This is why I want to have stronger reasons for real VFS support. I see
| the Samba argument, and I buy that one, if only because it has such a high
| consistency requirement (let's face it, people expect more guarantees of
| their file servers than of most other things). But on the other hand, the
| Samba guys apparently _are_ happy with "openat()", so they don't
| necessarily need any normal namespace stuff.

I see your Samba and I raise you an NFS.

For that matter, how about every distributed FS to come.

All it needs to do is support transactions (which most try to anyway)
and files-as-directories to support _all_ future FS features transparently.

It might ask the fs for a non-recursive serialization/dump of a file
rather than just reading it directly -- this makes things like named
pipes and device nodes sane.  This would be optional and only supported
when the client and server both have support for the same fs -- other,
more hack-ish things would be needed to support Samba.

It would also use the best caching mechanism discussed earlier.  (I'm
not yet arrogant enough to insist that mine is the best.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTaXs3gHNmZLgCUhAQIG5g/+MEHPsNK41goKI8yJPwKdigbRbrfGf3sj
xpFGR15/DAW4b4qxr1BIt5hyAQoFLq13POM/lCV12hKp1RSo9atuKim6DyUhOX1c
0xUK6efY0ew+mvYHKaJUgwrD8BV7XYaTS+5y/4wbpgdOlPHsx06lHVh90KtAUAE7
vdsFWRAgHT/g34rSRBJfHAaom/7VtDce25roLrB3CNI2v+9tERYee+xkBPoy2+Y1
5tLgoInDi05z7bUu0lCJ+Rq2LCHuKGmgInI86gul5BfHlO3j2zYnJ5VYT8QR6onM
iThiPzFrrpoXEjQRRo7E4WHQCD/2BGXzQdS78JzwTt1B8oNrIkZR9/tcv6keNzr6
fyUhtQef5TZJtwpON1gZPqraBUiTDUdWHJSXGLB5+78vMy+bS7gHqXN5DR049+7b
urQFtnZBhi3zY8cpT0hTPnW2PcGnDuGMt9qUiFBn8Hx9Tkti6y+7Jl42a40jgBAW
z4hSHPKVzu8d/qeBapVHtqIkaLTdim1JnmFY+SCiiuCPEMOELDxw+o/rcwTIls9s
3TBJ5lqL/+84W8JU6t1CpzEgF+dRhPSBNyrG5msVixT7cmB2GO87rLBfchM1cotq
lBMyuDwmwO6RanwkEvOV//3wsG8POMw5f2Gx8eljqU9uzSpYcKry+Is2ZVmHKJ/1
24eqEXIB24Y=
=GSMf
-----END PGP SIGNATURE-----
