From: Valdis.Kletnieks@vt.edu
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary additional namespace to ReiserFS
Date: Wed, 28 Apr 2004 12:55:28 -0400
Message-ID: <200404281655.i3SGtSsl019745@turing-police.cc.vt.edu>
References: <1082750045.12989.199.camel@watt.suse.com> <408E9F42.2080804@namesys.com> <20040427190439.A20646@infradead.org>
            <200404281022.36081.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1979892168P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 28 Apr 2004 10:22:36 +0200."
             <200404281022.36081.christian.mayrhuber@gmx.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1979892168P
Content-Type: text/plain; charset=us-ascii

On Wed, 28 Apr 2004 10:22:36 +0200, Christian Mayrhuber <christian.mayrhuber@gmx.net>  said:

> As Hans mentioned, bad semantics cripple useability, but what's even worse
> is if there is no standard way of doing things - at least from a user point of 
> view.
> Reiser4 does not support the xattr/acl interface and is therefore worse
> than Reiserfs3 + xattr patch. Offering an additional, cleaner approach
> is great, but acl/xattr is in the official kernel and a long time will pass by 
> till this interface can be deprecated and removed.
> Imagine some filemanagers using xattr/acl interface because it is in the 2.6 
> kernel release. Such stuff would work on every linux filesystem, but Reiser4.

Note that this is already an issue *NOW* - you can't use SELinux labelling on a Reiser3
file system, unless you pick up the xattrs patch, and even then you need to do some
cleanup of code that "knows" that Reiser3 can't do xattrs....

--==_Exmh_-1979892168P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAj+IAcC3lWbTT17ARAurUAJwJtIsA1WlgJ03XgcsR2ivkYXTKUgCgx0fP
yg2LwjZZ0wC+bvJ7zyNGM4o=
=ae2b
-----END PGP SIGNATURE-----

--==_Exmh_-1979892168P--
