From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: /proc/fs/reiserfs question
Date: Tue, 15 Oct 2002 12:53:19 +0400
Message-ID: <15787.55167.461533.347040@laputa.namesys.com>
References: <20021014160435.344ca55b.philippe.gramoulle@mmania.com>
	<15786.54223.785138.49029@laputa.namesys.com>
	<20021015103658.6f3997ab.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021015103658.6f3997ab.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

Philippe Gramoull=E9 writes:
 > On Mon, 14 Oct 2002 18:25:19 +0400
 > Nikita Danilov <Nikita@namesys.com> wrote:
 >=20
 >   |  I am afraid one has to dig it out of the sources. Here is descripti=
on of
 >   |   some fields displayed in "super", they pertain to the in-core
 >   |   super-block:
 >   | [-]
 >   |  I guess we should keep this information somewhere on the web-site. =
If
 >   |  you need more detailed info, let me know.
 >=20
 > Thank nikita, this is fine for me.
 >=20
 > I was also looking for a way to have an idea of how many files sit on a =
filesystem
 > without having to walk through the whole tree and list each of them.

/proc/fs/reiserfs/*/oidmap lists "object-id" map. If this map never
overflowed (overflows happened during current mount are counted in
leaked_oid field of /proc/fs/reiserfs/*/super), then, sum of lengths of
`used' intervals is the number of files on the file system. This sum is
shown at the very bottom of oidmap:

total:  160 [160/1004] used: 178598 [exact]

178598 is total number of files.

Generally, until one has really weird access patterns this map shouldn't
overflow. Problem is that, due to simplistic implementation of procfs
stuff, no file on /proc/fs/reiserfs/*/ can be larger than 4k and thus,
if oidmap happened to be highly fragmented, it wouldn't fit completely,
and will be ended with

... and more
total:  160 [820/1004] used: 178598 [estimation]

Again, this is trivial to correct, but not before Hallowmas, I am afraid.

 >=20
 > Thanks,
 >=20
 > Philippe

Nikita.
