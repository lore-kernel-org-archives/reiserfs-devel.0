From: Spam <spam@tnonline.net>
Subject: Re: The argument for fs assistance in handling archives
Date: Fri, 3 Sep 2004 02:47:49 +0200
Message-ID: <617051682.20040903024749@tnonline.net>
References: <20040826150202.GE5733@mail.shareable.org>
 <4136E0B6.4000705@namesys.com> <1117111836.20040902115249@tnonline.net>
 <200409021309.04780.oliver@neukum.org> <4137BE36.5020504@slaphack.com>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4137BE36.5020504@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Oliver Neukum <oliver@neukum.org>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


  

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Oliver Neukum wrote:
> | Am Donnerstag, 2. September 2004 11:52 schrieb Spam:
> |
|>>  Btw, version control for ordinary files would be a great feature. I
|>>  think something like it is available through Windows 2000/3 server.
|>>  Isn't it called "Shadow Copies". It works over network shares. :)
|>>
|>>  It allows you to restore previous versions of the file even if you
|>>  delete or overwrite it.
> |
> |
> | There's no need to do that in kernel, unless you want to be able
> | to force it unto users.

> And on apps.  Should I teach OpenOffice.org to do version control?
> Seems a lot easier to just do it in the kernel, and teach everything to
> do version control in one fell swoop.

  Do you mean in the kernel or as a filesystem/VFS plugin that would
  extend the functionality to include version control?

  ~S


