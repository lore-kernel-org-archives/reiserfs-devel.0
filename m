From: Oliver Neukum <oliver@neukum.org>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 2 Sep 2004 13:09:04 +0200
Message-ID: <200409021309.04780.oliver@neukum.org>
References: <20040826150202.GE5733@mail.shareable.org> <4136E0B6.4000705@namesys.com> <1117111836.20040902115249@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21272-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117111836.20040902115249@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Spam <spam@tnonline.net>
Cc: Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Am Donnerstag, 2. September 2004 11:52 schrieb Spam:
> =A0 Btw, version control for ordinary files would be a great feature. I
> =A0 think something like it is available through Windows 2000/3 server.
> =A0 Isn't it called "Shadow Copies". It works over network shares. :)
>=20
> =A0 It allows you to restore previous versions of the file even if you
> =A0 delete or overwrite it.

There's no need to do that in kernel, unless you want to be able
to force it unto users.

	Regards
		Oliver
