From: Philipp =?iso-8859-1?q?G=FChring?= <p.guehring@futureware.at>
Subject: Re: Unicode policy
Date: Fri, 2 May 2003 03:18:33 +0200
Message-ID: <200305020118.h421Ip205033@linux1.futureware.at>
References: <200305011538.h41FcFn01653@linux1.futureware.at> <20030501154819.GA15670@namesys.com> <3EB1C209.1050808@namesys.com>
Reply-To: p.guehring@futureware.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EB1C209.1050808@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am Freitag, 2. Mai 2003 02:55 schrieben Sie:
> It is a VFS issue.  We just conform.  VFS can't handle / and null being
> in a filename, so Unicode can't work in Linux.  If you get VFS to handle
> Unicode, I'll make ReiserFS work.  Linus is the one to convince, not us.

Hi Hans,

UTF-8 (is also Unicode) has no nulls in it, and does not=20
generate '/' or other problematic charakters, and is actually working on=20
Reiserfs.

The problem with a migration to Unicode is that we either have to switch al=
l=20
applications at once, or have the information in the filesystem, in which=20
encoding the filenames are ...

But you are right, it's a VFS issue ...

Many greetings,
- --=20
~ Philipp G=FChring              p.guehring@futureware.at
~ http://www.livingxml.net/       ICQ UIN: 6588261
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+scdqlqQ+F+0wB3oRAn8gAKCBNzPvsRsaxJT96fCEGvO6MXeFKgCdEXY1
xmMW0hHJZTkHM7GhQj0FcdI=3D
=3DU423
-----END PGP SIGNATURE-----
