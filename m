From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 20:28:20 -0500
Message-ID: <4137C8B4.2030009@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <4137B5F5.8000402@slaphack.com> <1862674154.20040903024407@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1862674154.20040903024407@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Spam <spam@tnonline.net>
Cc: viro@parcelfarce.linux.theplanet.co.uk, Frank van Maarseveen <frankvm@xs4all.nl>, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Spam wrote:
[...]
| Indeed, that's not the only interface that's been discussed.
| "file/..metas/is_isofs" might be consulted.
|
|
|>  What you are talking about isn't the kernel or such, but plugins that

Plugins are kernel-space.  As Linus points out, dealing with mime-types
in the kernel is uncool.

|>  could extend the filesystem. Plugins could store information about
|>  contents, encodings, formatting, filesystems, etc, as meta-info. If
|>  you have a plugin that would allow you to traverse files as disk
|>  images then it could read those meta-data. But before those plugins
|>  exist then there is no such standard for info stored as meta-data and
|>  the kernel wouldn't know anything about this to begin with.

So implement a plugin which knows how to talk to a userland program
which knows about metadata.  The plugin controls access to file-type.

Maybe there ought to be a general-purpose userland plugin interface?  So
that the only things left in the kernel are things that have to be there
for speed and/or sanity reasons?  (Things like cryptocompress and
standard file/directory plugins.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTfIs3gHNmZLgCUhAQJCqA//cPGI/TPfgtwovk5a8HdcY9TbjJELGtIb
CHcNa2LKGUB8uVvoL9M0Pe9ei4iVK2QOL1QjUAbIE0Dx7t18KR/5qEIfCHTSw0sJ
8u/r3aaJhFjFwMcVLQOZWJYuTeodgMwkV96GgViGoHoiqDiV7BzZgjd43qwiH8rW
FUTKlPn2VmijyTTbf5VfX4hvmsU/He+5W0t08/xe3vpCa+ihNFLJQAwGioo/wzFq
aHl9jBT1esFLxONd7OxQpgVl/2uHx+rSAY6F5RyBqL/Tpm1ZKlrMdAzmdDWcAJA9
KnOLN8ltcPmjP0eCzgCO/iq8yczcwcagfmbD+WcYOmQbTXMTjxktrZqRuLrUHU+7
tl8JISKch5epHfOnQ/RTMEgotlcQ0SCoE7K5lIUuyheMYRWoVDJSvy3okET6ZxQL
NP3PVHguQbu1Bo2X8LNsrnU0KFT7XrejpXzKalPWVbQxayEEWUwLXBdNIpgBoYwX
FZXQKEpS4MmB/8kEC9xuQ077PfAclcjcHSj4B7phbSVMioFy4/HojOLOLA8gjHyr
7p+wimfDpsuioDLlccwc1b+fLB2eJM5G+zfzh//uy7LdfFxuI+074FJYxebRI2eL
N/rpjT+S0S7L0/k71Rwp/5y4YgDgdQqU0wyGaBLRjP0qD7k2S41g+yrua6qArhzP
baR9dCu1zAQ=
=Nrye
-----END PGP SIGNATURE-----
