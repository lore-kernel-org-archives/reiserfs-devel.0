From: Nicholas DeClario <funsac@gmail.com>
Subject: Re: .reiserfs_priv directory removal
Date: Tue, 10 May 2005 13:59:08 -0400
Message-ID: <5b85fc67050510105926f6994b@mail.gmail.com>
References: <5b85fc6705051008555bce937@mail.gmail.com>
	 <4280DF48.9060800@suse.com>
Reply-To: Nicholas DeClario <funsac@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4280DF48.9060800@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-list@namesys.com

Removing it after rebooting in to 2.4 is definitely a posibility.=20
However, the "elegant" solution in the scenario here is to do it
before hand.  I was wondering if it was possible.  I guess the most
logical route to go would be to have a run-once script that deletes
these directories when 2.4 boots.

Thanks for you help Jeff.

Regards,
Nick

On 5/10/05, Jeff Mahoney <jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> The only way to remove this directory under a 2.6 kernel is to rebuild
> the kernel without extended attributes enabled. The .reiserfs_priv
> directory is special and hidden. The problem you're running into is
> similar to mounting an ext3 filesystem as ext2 using a kernel from
> before ext3 was written. It doesn't know how to use it, and so it just
> doesn't hide the directory.
>=20
> The 2.6 kernels, when it's possible that the directory will be used (ie:
> xattrs enabled, read-write), creates the directory if it doesn't exist.
> So, as soon as you mount the filesystem on another 2.6 system, the
> directory will be recreated unless you've disabled xattrs at compile time=
.
>=20
> What's the problem with simply removing the directory once you've
> mounted the filesystem under your 2.4 kernel?
>=20
> - -Jeff
>=20
> - --
> Jeff Mahoney
> SuSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.0 (GNU/Linux)
>=20
> iD8DBQFCgN9ILPWxlyuTD7IRAuT+AJ4vi8Q8Z+bx80A4AXoBpo5wa7zzjQCbBYb2
> jVZbGVsMgcZmcwvZ/WVWcVY=3D
> =3DDfF3
> -----END PGP SIGNATURE-----
>
