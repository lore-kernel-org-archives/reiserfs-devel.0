From: Chris Mason <mason@suse.com>
Subject: Re: [OT] memory issue with GNU find
Date: 24 Oct 2002 11:54:45 -0400
Message-ID: <1035474886.28715.182.camel@tiny>
References: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

On Thu, 2002-10-24 at 11:43, Philippe Gramoull=E9 wrote:
> Hi,
>=20
> Sorry to be a little off topic here but here is the issue:
>=20
> For legal reasons we need to list all files on a filer (reiserfs FS so no=
t
> _that_ offtopic :o).
>=20
> Problem is that the filer is about 400Go and number of files according to=
=20
> /proc/fs/reiserfs/*/oidmap is about 20 Million files.
>=20
> >From what we've read and seen , find is eating up all memory to the poin=
t that
> the filer start to swap and then crashes.
>=20
> Would anyone know how to do that without bring the filer to its knees in =
terms
> of memory ?

Interesting, find should not do that unless you're trying to get it to
sort the results somehow.

Exactly how are you running the find?

-chris


