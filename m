From: Tonnerre <tonnerre@thundrix.ch>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 21:08:14 +0200
Message-ID: <20040831190814.GA15493@thundrix.ch>
References: <41323AD8.7040103@namesys.com> <200408312055.56335.v13@priest.com> <36793180.20040831201736@tnonline.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <reiserfs-list-return-21169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <36793180.20040831201736@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Spam <spam@tnonline.net>
Cc: V13 <v13@priest.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@digeo.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, reiserfs-list@namesys.com

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Salut,

On Tue, Aug 31, 2004 at 08:17:36PM +0200, Spam wrote:
>   How  are  things  done on Windows platforms when there are files and
>   directories  with the same name? In Unix that is imposible. How does
>   it  work  for  environments  like  Cygwin  etc? What happen to tools
>   that run in them?

In  NTFS it's  illegal  IIRC.  At least  the  fs correction  utilities
complain about a block being assigned to two files.

Same with HFS+.

Sometimes  there seem to  be several  things with  the same  name. But
that's because of hidden extensions (.lnk for example).

I'm talking out of the book here, maybe the real-world implementations
of Windows  are different. I can't  tell, I only used  Windows once to
ssh into a screwed-up router.

				Tonnerre


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.2 (GNU/Linux)

iD8DBQFBNMyd/4bL7ovhw40RAiIcAJ9p8jLgJeKhIFuWqVmJ/ShSiz6L+ACgwTVN
N/3DwpJuNBNtx2Sjb9xdZ8A=
=ER/w
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
