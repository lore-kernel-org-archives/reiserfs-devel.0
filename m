From: Fabien Combernous <fcombernous@eprocess.fr>
Subject: Re: [OT] memory issue with GNU find
Date: Thu, 24 Oct 2002 17:54:47 +0200
Message-ID: <3DB817C7.90008@eprocess.fr>
References: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

Do you have test tree ?

Philippe Gramoull=E9 wrote:
> Hi,
>=20
> Sorry to be a little off topic here but here is the issue:
>=20
> For legal reasons we need to list all files on a filer (reiserfs FS so not
> _that_ offtopic :o).
>=20
> Problem is that the filer is about 400Go and number of files according to=
=20
> /proc/fs/reiserfs/*/oidmap is about 20 Million files.
>=20
> From what we've read and seen , find is eating up all memory to the point=
 that
> the filer start to swap and then crashes.
>=20
> Would anyone know how to do that without bring the filer to its knees in =
terms
> of memory ?
>=20
> thanks,
>=20
> Philippe
>=20

--=20

Fabien COMBERNOUS - IT Engineer
eProcess - Parc Club du Mill=E9naire Batiment n=B0 6
1025 rue Henri Becquerel - 34000 Montpellier FRANCE
http://www.eprocess.fr - +33 (0)4 67 13 84 50

