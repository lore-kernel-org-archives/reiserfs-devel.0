From: Hans Reiser <reiser@namesys.com>
Subject: Re: Still wrong reported file size after --rebuild-tree
Date: Sat, 02 Nov 2002 00:07:33 +0300
Message-ID: <3DC2ED15.9080403@namesys.com>
References: <20021030193045.69179289.philippe.gramoulle@mmania.com> <200211011630.13195.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021030193045.69179289.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: =?UTF-8?B?UGhpbGlwcGUgR3JhbW91bGzDqQ==?= <philippe.gramoulle@mmania.com>, reiserfs <reiserfs-list@namesys.com>

Vitaly Fertman wrote:

>Hi,=20
>
>On Wednesday 30 October 2002 21:30, Philippe Gramoull=C3=A9 wrote:
> =20
>
>>Hi,
>>
>>I just wanted to let you know that after rebuilding the tree for a 500Go
>>volume, i still have wrong file size reported :
>>
>>/dev/sdb1            572418604 174714996 397703608  31% /storage
>>
>># ls -l
>>total 4928006
>>-r-x-wx-wx 1 daemon   324231      32768 Jan  1  1970 25s.jpg
>>-r-x--x--- 1 19415372 19415373 83388383504122186 Aug 13 1970 25s_lb.jpg
>>-r--rw-rw- 1 19415354 19415355 83388306194710840 Aug 13 1970 25slight.jpg=
=20
>>-r---wxrwx 1 19415331 19415332 83388207410463009 Aug 13 1970 25slight_ln.=
jpg=20
>>
>>   =20
>>
>
>ReiserFS can handle 64 bit file sizes, so from the reiserfsck point of vie=
w =20
>these are correct sizes.=20
>
> =20
>
You mean to say that you haven't written code to check that file sizes=20
are correct, yes?

--=20
Hans


