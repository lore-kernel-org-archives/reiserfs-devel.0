From: Oliver Neukum <oliver@neukum.org>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 7 Sep 2004 15:44:22 +0200
Message-ID: <200409071544.22439.oliver@neukum.org>
References: <200409070206.i8726vrG006493@localhost.localdomain> <m3d60yjnt7.fsf@zoo.weinigel.se> <20040907123011.GA18828@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21567-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040907123011.GA18828@MAIL.13thfloor.at>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Herbert Poetzl <herbert@13thfloor.at>
Cc: Christer Weinigel <christer@weinigel.se>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Am Dienstag, 7. September 2004 14:30 schrieb Herbert Poetzl:
> > 1. Do we want support for named streams?
> >=20
> > =A0 =A0I belive the answer is yes, since both NTFS and HFS (that's the
> > =A0 =A0MacOS filesystem, isn't it?) supports streams we want Linux to
> > =A0 =A0support this if possible.
>=20
> well, yes HFS has this, is it advantageous, no
> it's kind of heritage ...

HFS doesn't support _named_ streams. There are just two forks
per file.

	Regards
		Oliver
