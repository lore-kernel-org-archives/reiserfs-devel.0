From: Todd Lyons <todd@mrball.net>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Tue, 26 Nov 2002 20:52:40 -0800
Message-ID: <20021127045240.GA9212@mrball.net>
References: <20021125153843.GC19254@mail.cekit.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021125153843.GC19254@mail.cekit.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; x-action="pgp-signed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mira Temp=C3=ADr wanted us to know:

>| This is very strange, We've seen reports of reiserfsck --rebuild-tree
>| of 500Gb volume (filled to 170Gb) finished in 8 hours.
>Can be the speed affected with high usage of FS (about 99%)?

I don't know for sure.  I was one of the 500 GB users who finished in
8 hours.  That particular server was at 90% utilization IIRC.  If it is
sensitive to the size of the data on the disks, then it is a nonlinear
relationship.  I doubt it has anything to do with it and has more to do
with bad blocks.
- --=20
Blue skies...		Todd
| Get a bigger hammer!   |   Proponents of MIME in general e-mail |
| http://www.mrball.net  |   can go multipart/encrypt themselves. |
| http://faq.mrball.net  |                            --Rick Moen |
   Linux kernel 2.5.46-1   1 user,  load average: 0.10, 0.14, 0.20
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE95E+XIBT1264ScBURAgPIAJ98slpieL72fK7/TPURFEbJgw6w3gCgqXv9
brP7koUY9ffRrda1J0oJbAc=3D
=3DHEsb
-----END PGP SIGNATURE-----
