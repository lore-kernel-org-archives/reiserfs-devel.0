From: Hans Reiser <reiser@namesys.com>
Subject: Re: Unicode policy
Date: Fri, 02 May 2003 14:45:05 +0400
Message-ID: <3EB24C31.6030401@namesys.com>
References: <200305011538.h41FcFn01653@linux1.futureware.at> <20030501154819.GA15670@namesys.com> <3EB1C209.1050808@namesys.com> <200305020118.h421Ip205033@linux1.futureware.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305020118.h421Ip205033@linux1.futureware.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: p.guehring@futureware.at
Cc: reiserfs-list@namesys.com

Philipp G=FChring wrote:

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Am Freitag, 2. Mai 2003 02:55 schrieben Sie:
> =20
>
>>It is a VFS issue.  We just conform.  VFS can't handle / and null being
>>in a filename, so Unicode can't work in Linux.  If you get VFS to handle
>>Unicode, I'll make ReiserFS work.  Linus is the one to convince, not us.
>>   =20
>>
>
>Hi Hans,
>
>UTF-8 (is also Unicode) has no nulls in it, and does not=20
>generate '/' or other problematic charakters, and is actually working on=20
>Reiserfs.
>
> =20
>
Well, in that case, everything is done, VFS is fine as is, just start=20
using UTF-8.  I am not sure who decides how to render UTF-8, but that=20
would presumably be outside the kernel.

>The problem with a migration to Unicode is that we either have to switch a=
ll=20
>applications at once, or have the information in the filesystem, in which =

>encoding the filenames are ...
>
>But you are right, it's a VFS issue ...
>
>Many greetings,
>- --=20
>~ Philipp G=FChring              p.guehring@futureware.at
>~ http://www.livingxml.net/       ICQ UIN: 6588261
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.0.6 (GNU/Linux)
>Comment: For info see http://www.gnupg.org
>
>iD8DBQE+scdqlqQ+F+0wB3oRAn8gAKCBNzPvsRsaxJT96fCEGvO6MXeFKgCdEXY1
>xmMW0hHJZTkHM7GhQj0FcdI=3D
>=3DU423
>-----END PGP SIGNATURE-----
>
>
> =20
>


--=20
Hans


