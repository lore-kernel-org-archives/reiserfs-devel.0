From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 20:25:01 -0500
Message-ID: <4137C7ED.3000509@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <4137B5F5.8000402@slaphack.com> <Pine.LNX.4.58.0409021717220.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0409021717220.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: viro@parcelfarce.linux.theplanet.co.uk, Frank van Maarseveen <frankvm@xs4all.nl>, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linus Torvalds wrote:
|
| On Thu, 2 Sep 2004, David Masover wrote:
|
|>reiser4 kernel will contain knowledge of fs type contained in a file.
|
|
| That's a disaster, btw.
|
| There is no one "fs type" of a file. Files have at _least_ one type
| (bytestream), but most have more. Which is why automatically doing the
| right thing (in the sense you seem to want) in kernel space is simply not
| possible.

Oops, my bad.  The interface is kernel, the file type database is user.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTfH7XgHNmZLgCUhAQL0aw//SG/RDCy30xcVh36FVVAOG7GjP6UkHBeo
14/O3hSELxwm9r8z0YnGnbpoJj9atbOCu6VJhiumtjeyikdH5OaOrcMo7DQYp47V
holyEKvjd+YUkCBJSjFBmG279Ac7wuk2orFlG76gCkFjNk11W/FQsjEM3gi8yKa0
ZODFmh0XJa2p0mKRnApwynO1ma7HgyqNRKrjmxMUK2VHpOsbqjVe1+Gc2lk0E9gv
xc2PIdCgi3yDEpDpxSY8LEBXad7GTwa2VEID5G7C6Z0wOH38YyMEpoHQz03se9zO
aCnVg8LPdFkZveWXPiiyJrwDERCyKt/yrRxrVznWyNVaWmhoxXmw7TmQexvGiDD2
E6+XT8uWfdeMZRPhv284qcBegIDw5c1wHgz+GRso61T6x04hfJyY/onbF5lHz661
lfys4JRT0zmYbrG1b3GVgmfKDv7t3V6DkY+Pi1E5raeZr2F0idiZo+7uKh2NZAML
PLhb8LLr/lbHOSRG3Rq0YY/l+Q6wZXy770qF/51jp/c3UXXJyVusK+bCLrVZ3VPa
0Uf3KkuFLcoD4jDTNjt79QVJXIvEHmNOxp/g80nJUFM0WDj7u4a7pFpLCHZzFeBl
5uoS9c7dYjuV+/EkQ2S8YwryeyCHQNt381icb8HtbdlQOCVuK0v9OspA3IZmphcB
oD1RBCkVTYQ=
=l8Vz
-----END PGP SIGNATURE-----
