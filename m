From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [OT] memory issue with GNU find
Date: Thu, 24 Oct 2002 19:49:09 +0400
Message-ID: <15800.5749.243204.500221@laputa.namesys.com>
References: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

Philippe Gramoull=E9 writes:
 > Hi,
 >=20
 > Sorry to be a little off topic here but here is the issue:
 >=20
 > For legal reasons we need to list all files on a filer (reiserfs FS so n=
ot
 > _that_ offtopic :o).
 >=20
 > Problem is that the filer is about 400Go and number of files according t=
o=20
 > /proc/fs/reiserfs/*/oidmap is about 20 Million files.
 >=20
 > >From what we've read and seen , find is eating up all memory to the poi=
nt that
 > the filer start to swap and then crashes.
 >=20
 > Would anyone know how to do that without bring the filer to its knees in=
 terms
 > of memory ?

ls -R ?

 >=20
 > thanks,
 >=20
 > Philippe

Nikita.
