From: Jason Stubbs <jstubbs@gentoo.org>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Mon, 19 Apr 2004 21:23:03 +0900
Message-ID: <200404192123.14960.jstubbs@gentoo.org>
References: <Pine.LNX.4.21.0404161554420.16938-100000@mlf.linux.rulez.org> <1082374724.7491.7.camel@firefly>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1082374724.7491.7.camel@firefly>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 19 April 2004 20:38, Yury Umanets wrote:
> PS. Unfortunately I was not able to find gentoo source package of
> progsreiserfs (is it exists? I'm not familiar with Gentoo) to check if
> it is modified or not. So, if one can say me where I can take it, please
> do. Thanks in advance.

There are currently two versions available. I say versions - what I mean is=
=20
scripts that compile and install. You can see these scripts at:=20
http://www.gentoo.org/cgi-bin/viewcvs.cgi/sys-fs/progsreiserfs/

The sparc-only patch that is applied to progsreiserfs-0.3.0.3 is available =
in=20
the files subdir.

Regards,
Jason Stubbs
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iQCVAwUBQIPEsloikN4/5jfsAQILwAP+LqvRdf/SRTOJwS8GiEe+hE2jRJraZdU/
9VyXpTVUgviDm2okKsWI/5oZn7eYSgnZfMiC0HhHRbVsGRE9BhhvJ45LVDgIzeS0
pIv4LBtcsldxMw5z+sAwCjXvn+CrrZ9Ci6gmvYft0OAQ97a2UvnOe9mQ5e/N2wmp
mrtqE2UiopY=3D
=3D0+em
=2D----END PGP SIGNATURE-----
