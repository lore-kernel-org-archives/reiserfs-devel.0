From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Status of quota support for reiserfs on 2.6.x kernels
Date: Tue, 23 Nov 2004 14:06:43 +0100
Message-ID: <200411231406.43497.christian.mayrhuber@gmx.net>
References: <20041123105332.02470503.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041123105332.02470503.philippe.gramoulle@mmania.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Tuesday 23 November 2004 10:53, Philippe Gramoull=E9 wrote:
>=20
>  Hello,
>=20
> Currently we use some Linux NFS servers with 2.4.25 kernel patched to=20
support quotas.
>=20
> Since we face some I/O issues, i'd like to try out a 2.6.x kernel but quo=
ta=20
support is mandatory.
>=20
> So my question: is quota support for 2.6.x ( 2.6.9 and above preferably)=
=20
available and considered stable enough
> to be used in heavy production environment ( high I/O pretty much 24/24 )=
 ?
>=20
> If yes, which kernel do i need, and where can i find the quota patches ?
>=20
> I've found some old quota patch (for 2.6.5 from march 2004) on Chris Maso=
n=20
suse FTP experimental directory and i also
> saw that Jan Kara has posted several quota patches recently.
>=20
> Thanks for a quick update on this topic.
>=20
> Truly yours,
>=20
> Philippe
>=20
> --
>=20
> Philippe Gramoull=E9 <philippe.gramoulle@mmania.com>
> System & Network Administrator
> Lycos Europe
>=20

Quotas are in kernel 2.6 and supported by ext2,ext3,reiserfs,xfs.
Reiserfs doesn't need an extra patch for quotas, data journalling
or extended attributes. Everything is right there for
kernels > 2.6.5 if I remember right.

Jan Kara from SuSE labs recently discoverd a deadlock in the linux
quota system, see:
http://marc.theaimsgroup.com/?t=3D110085816900002&r=3D1&w=3D2
I guess it would be wise to wait with the migration till these patches
make it into some official 2.6 kernel release.

=2D-=20
lg, Chris
