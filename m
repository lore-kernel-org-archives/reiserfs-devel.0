From: Martin Waitz <tali@admingilde.org>
Subject: Re: file as a directory
Date: Mon, 22 Nov 2004 15:37:20 +0100
Message-ID: <20041122143720.GL19738@admingilde.org>
References: <2c59f00304112205546349e88e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EdRE1UL8d3mMOE6m"
Return-path: <reiserfs-list-return-22493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <2c59f00304112205546349e88e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Amit Gud <amitgud1@gmail.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--EdRE1UL8d3mMOE6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hoi :)

On Mon, Nov 22, 2004 at 07:24:36PM +0530, Amit Gud wrote:
>  A straight forward question. Wouldn't adding a "file as a directory"
> mechanism more logical in VFS itself, rather than having each fs (like
> reiser4) to implement it seperately?

wouldn't it be better if such things would be implemented in a library?
use gnome-vfs, or try to get a vfs layer into libc.
That way you can even support different and old kernels and all
filesystems.

The kernel already provides all methods that are neccessary to do that.
So there is no need to implement it in the kernel.

--=20
Martin Waitz

--EdRE1UL8d3mMOE6m
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFBofmfj/Eaxd/oD7IRAi3aAJ0Vs5ghbKohVajl6rPy1vuv1EbjsQCfZHhC
O5NQdXNXEf1Dxz9g7Zbo05c=
=FdzT
-----END PGP SIGNATURE-----

--EdRE1UL8d3mMOE6m--
