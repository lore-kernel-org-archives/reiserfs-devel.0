From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 20:11:13 -0500
Message-ID: <4137C4B1.40308@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org> <413694E6.7010606@slaphack.com> <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org> <4136A14E.9010303@slaphack.com> <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org> <4136C876.5010806@namesys.com> <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Hans Reiser <reiser@namesys.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linus Torvalds wrote:
[...]
| It's much saner (from _any_ app standpoint) to roll their own database in
| user space - that way it just works.

Then why do we have apps which use Windows' Internet Options where it
can, and otherwise ask the user for proxy settings?

|
| In other words, nobody is really ever going to take advantage of this.
| This is _not_ how technical advanncement happens. The way you get people
| to take advantage of something is to have a nice gradual ramp-up, not a
| sudden new feature that they can't realistically use.
|
| So before you do transactions in the filesystem, you have to be able
to do
| them in user space - and then make the filesystem version be _compatible_
| with that user space library. That way you can get people to use the
| library ("hey, it works anywhere") and then you can get them to use your
| filesystem ("hey, if you use our super-duper filesystem, you can do what
| you are already doing five times faster").

Why not:
	do transactions in the filesystem
	write a library to talk to that filesystem
	have the library do emulation on other systems

in that order.

| See? You're starting at the wrong end. Give me a portable interface to
use
| _first_. Then do transactions in the filesystem.

If you're going to have to do both the portable interface and the fs
support, does it really matter which order you do them in?

Again, this is curiosity, not sarcasm.  Here my reasons for wanting the
fs support first:

You don't always know exactly how the filesystem transactions will work.
~ You don't know until it's done whether you'll deviate from your design,
cut certain features, replace them with others...

And if you write the portable library first, and it ends up supporting
features a, b, and c, while the kernel supports features b, c, and d,
which obsoletes a, you have to add some features and remove some
features from the portable library to make it sane.

It'd be like writing OpenGL entirely in software, before hardware
accelerators work, and at the last minute have to change the library to
use triangles instead of splines.  What's more, every single app now has
to be rewritten or use the library's emulation -- that's assuming many
apps would consider using a 3D library that doesn't have hardware accel
support yet.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTfEsHgHNmZLgCUhAQK1ORAAiSQ6UHSYc/PPMMOv2VjTkSuK2MgPylKP
d2jEitIuvWx01xAa++CLcUS6ncaiLuFYDA7TTHjhKYKAj+zuNN9OTI9EMGc6D+Ua
lFcbcRFapqbT9HPrUnGPM8VQIR8UrBt54hRAGm0/jOCc8DKLa3d6xnRfqmKQhnkv
w3ut4FiNo0GCd19hF82NxEA1YtwbOIgOIUxVlbADGI9QT/d+I3ZMA8QUNCrgrudn
e9g7o0yTa2c16t/rrqkiYCqSHIhCgY8ZH8VQzG4uYSjU+qYS+QbpJakD82EyuF/k
4T4jyJOqqSv6tLwE1j2y0gteXDYOdmfda/TpDeBSaRvGf+SmNxfSDFL448B2QJgA
e3V0HZHVVums1Vl6kX4pBaWM01V3n9BGeLaF2S9XSP7WCSWgW7t4ONRSLE3Bf2mm
1e5cMJ63mrtImb8Jyd8GhyCQ8/tkGnEYOIAHL3laGOjuc2ARBeyqmWrGKJsQ8iwu
i9NsyukQC3NP2FY1nBSmKs9J2bWtixqk5OXpzupkqBkbpeKL1H/b9Mxpnn5+Aomi
PjI/5i4QcaHMNBggxCG3B5zGJIWmvMkmZmHrHxvbLeENGvS5fiZ0Kscq7PL0FnE0
/2etDgjg65I66SqguXMzvtZdQ0hYgdwvoR83nZymHMSLYrFJ8FOxuB7kYQBeKZnu
QpUz0UDTUZA=
=jVvF
-----END PGP SIGNATURE-----
