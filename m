From: Tonnerre <tonnerre@thundrix.ch>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 31 Aug 2004 10:15:28 +0200
Message-ID: <20040831081528.GA14371@thundrix.ch>
References: <20040829191044.GA10090@thundrix.ch> <3247172997-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <reiserfs-list-return-21146-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3247172997-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com, vonbrand@inf.utfsm.cl

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Salut,

On Sun, Aug 29, 2004 at 08:39:25PM -0400, Alexander G. M. Smith wrote:
> I mostly  agree, like I was  saying earlier, file  types are needed!
> The kernel  doesn't have  to know  about all of  them, just  some of
> them.  It should be possible to  attach a file type to everything so
> you  know what  kind of  thing it  is, not  just block  or character
> device or file, but something like a MIME type.

Then store the value computed  by libmagic into an extended attribute,
if you  like. I still  don't see why  the kernel should even  care. It
shouldn't read things from files anyway, as a kernel shall be bootable
on a busybox  system (and *Step) as  well, so we don't rely  on the fs
layout in any way.

> Optionally the  kernel could  also maintain the  global list  of all
> file types  and their  properties (such as  which ones  are indexed,
> which are computed),  though that could also be  done in userland if
> you  aren't doing  indexing or  computed attributes  or  other fancy
> operations.

Quel horreur!

Do it in userland, really.

If I  get the time,  I'll write you  a small daemon based  on libmagic
which  stores  the  file  attributes  in xattrs,  or  if  they're  not
supported, in some MacOS/Xish per-directory files. Even a file manager
("finder") can do that, there's not even the need for a daemon.

				Tonnerre

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.2 (GNU/Linux)

iD8DBQFBNDOg/4bL7ovhw40RAgGhAKDBMz1je85kPUBL+xUiQc1M5GtBdACePQDt
sBmrUtWy1Sa2nFBaOd/2eY4=
=lcuu
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
