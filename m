From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 19:43:34 -0500
Message-ID: <4137BE36.5020504@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <4136E0B6.4000705@namesys.com> <1117111836.20040902115249@tnonline.net> <200409021309.04780.oliver@neukum.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409021309.04780.oliver@neukum.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oliver Neukum <oliver@neukum.org>
Cc: Spam <spam@tnonline.net>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Oliver Neukum wrote:
| Am Donnerstag, 2. September 2004 11:52 schrieb Spam:
|
|>  Btw, version control for ordinary files would be a great feature. I
|>  think something like it is available through Windows 2000/3 server.
|>  Isn't it called "Shadow Copies". It works over network shares. :)
|>
|>  It allows you to restore previous versions of the file even if you
|>  delete or overwrite it.
|
|
| There's no need to do that in kernel, unless you want to be able
| to force it unto users.

And on apps.  Should I teach OpenOffice.org to do version control?
Seems a lot easier to just do it in the kernel, and teach everything to
do version control in one fell swoop.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTe+NXgHNmZLgCUhAQLW+RAAnoQIQLXSd2vQudOKAaLgXXCxoa+gEWIq
zcNd+bIWPuQxwcZYlqbs/pDFiDky3XqLRaZv8PZx++rs9mMnv36eAtMX7uUp3egz
MxymeDDI796wtsDDBGcZtO+WwmqJ0fPgQMN/Q237s2yccPGJoDIVle9mzZAfNIdO
RDdLq142D+0t1iqfiVqaA+NgkArrGhcr0Hs/3TdviJX30gPL/Jm9eOvc3H3NgIQu
XToDQB1UnLoyiIwc16IY4ZxYoxf1YnFtrivZb+YgC61mIQLeqJMjixCAtBVzAfKN
2GmlsnfWcMCgXSEX8imkoNSLcmkv886+esGXZVzBbY1/Qg/f5MCXZilbb8e6+4I9
U4ReEUg5fGJW8JyKAXqKGyvbC/lim55Vgcjp/J8mrhUa3Q3cwPKoi2GKNRcbdpT/
pPB2SADA1eNrmFyGB7kLcqt0F9i4fIyTrItpHq9+m72OdFEze2OnWn+eIY8dRut7
SaGTq6ZEYtkH8oWT9xSXp1d2TUxeSVTdx8EffIIdwXAVOO0Z9xd71MJPLMp3VOMH
Qld4gjYjKFzwj3QlcWcsiVhk6Zq2fmqoOCQNfxhBzH1Le3v0F0ugammkQUXtRAub
dKEWxGfkDGOwviJXKeckDNn98x88vh7C/7gxpAOIcVSRDhEV+MDWIfMMvotE/lxe
393hENsXOgQ=
=g+3J
-----END PGP SIGNATURE-----
