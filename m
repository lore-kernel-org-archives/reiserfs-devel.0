From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Bug in scandir d_type
Date: Tue, 7 Dec 2004 12:10:12 -0700
Message-ID: <20041207191012.GM2064@schnapps.adilger.int>
References: <28699.80.203.27.6.1102439279.squirrel@80.203.27.6> <41B5EE43.7060408@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AQYPrgrEUc/1pSX1"
Return-path: <reiserfs-list-return-22709-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41B5EE43.7060408@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: egilam@student.matnat.uio.no, reiserfs-list@namesys.com

--AQYPrgrEUc/1pSX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 07, 2004  12:54 -0500, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> egilam@student.matnat.uio.no wrote:
> | Hello.
> |
> | I am working with a program that uses scandir, using d_type to check if=
 a
> | file has certain properties. It seems like that when used on reiserfs 3=
.6
> | (I haven't tried any other version), the d_type field is always 0 (zero=
).
> | When the program is moved onto an ext2 partition, it works. The example
> | program in "man scandir" works also the same way (just replace d_name w=
ith
> | d_type when printing out).
> |
> | Kernel:  2.6.8.1 with reiserfs compiled in.
>=20
> The d_type feature appears to be optional. ext[23] only supports it
> because the feature was tacked on later, it's protected by an
> incompatible feature bit. Most other Linux filesystems only bother
> returning something other than DT_UNKNOWN for . and .., which is kind of
> silly.
>=20
> In order to get the type information from the file/directory, it either
> needs to be stored with the directory entry (disk format change
> required), or readdir needs to load _every_ inode referenced by the
> directory which would be an immense performance hit for such a small
> corner case. ReiserFS has been in the mainline kernel for years now, and
> your message is the first complaint I've seen about this feature missing.

Doesn't reiserfs store the mode in the directory entry anyways, or is that
only reiser4?  So the overhead of returning the filetype is virtually nil.

> If you truly need the type information, a more portable solution would
> be to stat() each filename returned. You can generate the d_type value
> as follows:

Which obviates the whole point of d_type, which is to get the filetype
efficiently without hundreds of extra syscalls (which is at least part
of what Hans wants with sys_reiser4()).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/


--AQYPrgrEUc/1pSX1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBtgAUpIg59Q01vtYRAobnAKDwAZsP/ryaIf+UFsZ4px8KpBVvSACg6lF/
FNOR6DHeDvjJL1EnE4FKtkE=
=OUE5
-----END PGP SIGNATURE-----

--AQYPrgrEUc/1pSX1--
