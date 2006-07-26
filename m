From: David Masover <ninja@slaphack.com>
Subject: Re: Viewing files as directories
Date: Tue, 25 Jul 2006 19:08:35 -0500
Message-ID: <44C6B283.9010703@slaphack.com>
References: <20060725133522.68964.qmail@web51314.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="------------enig3A1CC9023A74A720B037B8D0"
Return-path: <reiserfs-list-return-29202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060725133522.68964.qmail@web51314.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: tdwebste2@yahoo.com
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

--------------enig3A1CC9023A74A720B037B8D0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Timothy Webster wrote:
> WARNING, a users point of view ;)
> Everything is a file, including a directory.
>=20
> Being able to view files as directories is not just a
> nice to have thing. It is actually required if we are
> going to manage changesets of odf files.

The lkml people will tell you that this isn't required at all, and it's
ludicrous to say so.  And they're somewhat right -- you could just patch
SVN, and it might be easier than writing a Reiser4 plugin.

> The truth is most people aren't code developers, but
> document developers. odf files are a container. And it
is XML inside.

Come on, do you really expect people to read XML diffs?  Even if you
split the XML out into files/dirs based on elements, using SVN directly
would be way too arcane to people who are used to what word processors
already do -- it's something called "Track Changes".

Fire up OpenOffice and check out the Edit->Changes menu.  Word has a
similar feature.  Not as powerful, maybe, but most people are not
collaborative document developers, either.

> But just about just about every program or script
> would be better off seening the odf as a compressed
> directory.

Maybe, maybe not.

> Yes it would be really wonderful, if we could just see
> directories as file and files as directories. Which of
> course means a file and a directory are one in the
> same.

Ever use OS X?  It does this, to some extent, in Finder, which supports
the lkml point that doing this in the filesystem, or anywhere in the
kernel, is unnecessary and a bad idea.

> As things stand now the way forward seams to be per
> application program mime types. Simple right, but it
> is not because, applications tools like svn, brz,

There are two OS X file types that I know of, and probably quite a few
more, which are actually stored on disk as folders, which is why most
Mac software is distributed as disk images or zipfiles.  One is the
Application type (.app, though Finder hides the extension) and the other
is the MPKG type (whatever it stands for, extension is .mpkg).

Basically, they appear as ordinary files to Finder, which means that
most of the time, you cannot see that there are files inside them.  You
double click on a .app, and it runs a script in a predefined relative
location inside the folder.  Double click on a .mpkg, and it launches
their installer program.  Drag them around and they behave like files in
every way, except that you cannot email them, upload them to a web page,
or interact with anywhere other than your local Mac system which expects
single files.  But when you run into that, just zip them.

But if you want, you can right-click on them (or control+click) and -- I
forget which option it is, but you can browse inside the package.



By the way, Hans, Apple has beaten you by quite a bit for at least some
of the functionality we've discussed.  You can do operations on Search
Folders easily, which work by using Spotlight (an indexed fulltext local
system search engine).  You can have files-as-directories, to a point.
There are generic ways of getting at metadata, and they are done as
plugins -- Spotlight plugins, anyway.

I'd much rather use the Reiser4 described in the whitepaper, of course,
and I am getting sick of the lack of decent package management for my
Mac, so I'll be adding a Linux boot.  I'm curious to see if Reiser4 is
stable on PowerPC -- this is a year-old G4, I missed the Intel cores by
just a few short months...


--------------enig3A1CC9023A74A720B037B8D0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iQIVAwUBRMayg3gHNmZLgCUhAQrLMA/9GkbnTt03ML4NvBJ/s+CLhcUBrfqVzKIC
loaTK2THO0UW+rzwn8MN7cbltuFAXTXP4LYeRjPJcAzp2WRHBpU0SkVL68+poA06
vUozMW+pe5OuEY/q15TuNCfbplbbk8wUJhM7Pb2u8ymVwkbRoWUwq3wl+/Bo4BN8
KW/3L2bH6T+dbtsxcG4Mg1xymCHynG62+KdEQ2Km0JLk8+Wjy2G54WX4lLXsMOSC
4zRsSEIYWa8+2gkDKIOH8cJ+ktdmZHT/MvwtBVd/wKM7HJAwrmPBh1qFfE+pN81m
ddNZin7dtQH9KR6dyNtiWe86WpMTzr2ZzL4/01laSCnZtUU9539XftDyBxdpXUjp
WPI3QyiM46gIn+ULW59drjUaUdRJoLEJuTjo7YHySmFjlkji/72RrN+lpmmHBwDs
HfkSqfqNKV1qHnVK08FKWKzzp57HDKGwaIcedYP782TZcVmweyH0vIx2YUlD/qpU
laroPzvWL0d++M2lFYPPY949Ck6Vf7wLzHcEX52Emm8eeMy/JxPjmnDj71k+90ig
uKja0LLAarURcsnDq4Eae5R3TjBrIIWMd5zr/y7NIujIxH3TbGnqg7GaFSzjVk9a
Jnymtnc2A4c5eJEeqSbWc9TwGgUAwBcZcG5EpbuK8/4bH3elr/Lt2TgC9JRfzsn4
kYjOOBexeDY=
=RzJr
-----END PGP SIGNATURE-----

--------------enig3A1CC9023A74A720B037B8D0--
