From: David Masover <ninja@slaphack.com>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 31 Aug 2004 20:14:33 -0500
Message-ID: <41352279.7020307@slaphack.com>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Horst von Brand wrote:
| Pavel Machek <pavel@ucw.cz> said:
|
|>David Masover <ninja@slaphack.com> said:
|
|
| [...]
[...]
| You do need extra tools anyway, placing them in the kernel is cheating
(and
| absolutely pointless, IMHO).

Repeat after me:  plugins in kernel does NOT equal tools in kernel.

It's not hard to, for instance, imagine a generic plugin for archive
manipulation which talks to a userspace daemon/library.  The kernel
doesn't know anything other than (maybe) a list of extensions that are
archives.  All else is handled in userspace -- the idea that "this is a
zipfile" and "zipfiles can be extracted with the 'zip' command" are all
in userspace.

It's not about the kernel, it's about the interface.  And see my other mail:
	cat foo.zip/README
	less foo.zip/contents/bar.c
is a lot easier than
	lynx http://google.com/search?q=zip
	emerge zip
	man zip
	unzip foo.zip
	cat bar.c
which already assumes quite a lot of expertise.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTUieXgHNmZLgCUhAQLj8Q//VEuRWg9RB/PVg/M1t36SraKIRdbrgGq6
0DYLZwwVWkfz+UKGhUkACNGQzhHG3ySn/lRjqXCsJhzMOzfgmte2CwgGxunHYqdp
W69OSZ1vv0ZLpdpzEkVdMfRhhg8RBL54Ewj6fQu7G1ZzJ0J0HUFCEZIsVoL4zJfk
+GFl4M+vvc+152HipEDsvrrPasc0dSxmryyzPbyABrfPRi3l2E3Okfewn/4MCC1E
H/L04nmvJQ2OSZYu1eSMSpnLrgQdZJbYefRuSinpqfKhjpwQXjj2rnfcPm+xc3hh
FDMlAUPA/DAlthTuhxd9+8iDPEARY57/FAMFTalYVhBEv0NWieMMn9V6R8BbnhZW
8y9EWu0Nvoowg9qElkVjWEt5M1Rbeuq4TDviyVyPYg/KcTKDGpjLuyQQbWv6hMVM
WAx6THtRK8Ji/XLCj4Kh6qDOEYP1nuwqLYSWv13BtNAJ3bVeKryOJ4Er4AmuJomA
uydBPQVsrtzTNmk7Eul2ZjrxXdESpUnUIAbu7H1Gbn51uP4rQTdlXkdPTv6s/wvG
OSOMWKs28GBFsG3+IJLnoN2wxrffpgTBEAaPwbh9TRFKLIH+pkCFSx2cIkTj93nr
RjETFObjYdJGhGygrq0xOmN5e7iprdxhxd3/+fvjQxnZGxXT3fZLUwhVX9/zhaXG
cxau2Onr3jc=
=MrR9
-----END PGP SIGNATURE-----
