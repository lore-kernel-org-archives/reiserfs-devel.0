From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Wed, 01 Sep 2004 23:27:58 -0500
Message-ID: <4136A14E.9010303@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org> <413694E6.7010606@slaphack.com> <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linus Torvalds wrote:
|
| On Wed, 1 Sep 2004, David Masover wrote:
|
|>And that is the right solution.  Not the only one, but the right one.
|>Caching isn't the only thing sorely in need of transaction support right
|>now.  Actually, I find it hard to think of anything on Linux which
|>shouldn't have transactions -- why should /etc/fstab or
|>/home/david/homework be more fragile than /var/lib/mysql?
|
|
| It's easy to talk big.
|
| It's damn hard to _implement_ a complex system, and make it stable and
| bug-free, and support legacy applications.
|
| There is a reason why we do only what _must_ be done in kernel space.
|
| 		Linus

I think transactions should be done in kernel space.  It's the only way
to "enforce" them sanely.

Besides, I'm not the one who first suggested this transaction idea.
That was Hans, and it was in the whitepaper.  I don't know if it's done
yet -- I think it got put off for v4.1.

But if it is going to be done anyway, doesn't it solve the consistency
issue?

I can understand wanting caching to work now, but which is the priority
- -- caching or transactions?  I vote transactions.  The consistancy of
fstab is far more important to me than the consistancy of foo.tgz/bar.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTahTXgHNmZLgCUhAQIumQ//SqEViCUbBcFJ3xsiQfEEUSe2gU+6dyJZ
7i3OeexnLRKrnxIsij5SmYTmGdYXhpaQWMrrjie8uFX0ocA0HTMsA1BzB4ZhtKnO
sYc/jAZusGpAjnyy0t0Q/hwjoMRIsCRVwqnD17Qw8rcuwYT5yaABMboXPiOPjQqu
JTkCeb+ATq5hF9VYL9TbcqaOycV7BMh+N7VXGPS/PIgeyYXyNwfIBWHrN8sjVQDA
3h9a9IEjEyReMdqlNbv73/wggGNqsmprDLIMFhMSPP4LXS5/xt1AhXW1R+mNDXjA
ckNq1lLjD1iUIQ7gIPHjR1Vi5op5GaXqVtdJLXtTyvNuc3nM/yFzM0T7+hgO4rSj
F0VkFFV8FbKRSVv1MsPv1O8EpFNpAs1uX+1g/vZ4ZHwPuOaMeXKT6rVTsr9WesfU
NdPMi0bXF6fAHbpjw3k6v+Jg95Mg+w8bgYOEDptz6zRuex8xC+LPrXE9ZDrYX+nm
+xG2wtMZyMr2y8wMp71RLz6Sj+Vq0cp4HNqccsMLfZ1OEWu2IzneBAmCSGQjLrxL
9coj0G3WpFwspTClh1DGBfuBJPS5O33iEsJ2w80bMhy/wKK5kZG/NyMAGQKazxAr
+7Se6t2RGHIxX5/EEoPI/e0AKLxFuvPi9ilq4bJNNDBMUO2wOkB8V0GLGzFA/0F2
9ALDAaO/dg8=
=pvxM
-----END PGP SIGNATURE-----
