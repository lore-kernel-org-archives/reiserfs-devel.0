From: Milan =?ISO-8859-1?Q?Holz=E4pfel?= <lists@mjh.name>
Subject: Re: umount bug?
Date: Thu, 24 Mar 2005 17:30:21 +0100
Message-ID: <20050324173021.731a10db.lists@mjh.name>
References: <4241B21B.9070404@cpc.wmin.ac.uk>
	<424270E5.5050800@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 24 Mar 2005 10:48:53 +0300
"E.Gryaznova" <grev@namesys.com> wrote:

> [...]
>=20
> > I am using the latest kernel 2.6.11 with the patch available from=20
> > ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-1.gz
>=20
> reiser4-for-2.6.11-1.gz is bugged. It is known. Wait please the next=20
> reiser4 release for 2.6.11.

I got Oopses on umounts (both on x86 and x86-64) when I used 2.6.10-2
applied to 2.6.11, having fixed the failed hunks + readahead changes
like they were in mm.  Reiser4 from 2.6.11-mm4 on vanilla 2.6.11 (again
with some manual fixes) worked fine however, as does 2.6.11-1.  (These
two used on x86-64 only.)  Therefore I'm wondering:  Are there also
other known bugs [which might cause data corruption?] in 2.6.11-1, or is
it only that the umount bug isn't happening to me anymore?
(All my kernels were either gentoo-hardened-sources, or patched with
GRSecurity, if that is of interest.)

> Thanks,
> Lena

Regards,=20
Milan
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCQusd2wyvT2WDeWYRAvlzAJ9gU3m2ova44bvJ11QYYeJgE6ZyQgCgg5Dk
Air2vlsKfYfZ1ZxntwfVi28=3D
=3DxIHS
-----END PGP SIGNATURE-----

