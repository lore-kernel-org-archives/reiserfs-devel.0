From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.11 compile failure. 3.6.12-pre3 compiles ok
Date: Tue, 27 Jan 2004 22:47:47 +0300
Message-ID: <200401272247.47501.vitaly@namesys.com>
References: <20040127151346.674f4843@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16635-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040127151346.674f4843@philou.gramoulle.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?utf-8?q?Gramoull=C3=A9?= <philippe.gramoulle@mmania.com>, reiserfs <reiserfs-list@namesys.com>

On Tuesday 27 January 2004 17:13, Philippe Gramoull=C3=A9 wrote:
>  Hi,
>
> While installing a box to start playing with reiser4 i got a compile error
> while trying to build reiserfsprogs 3.6.11. This the first time this
> happens as i had already compiled it successfully on other Debian Unstable
> boxes.
>
> I guess i may be because of a newly installed development package that
> breaks some macro.
>
> Reiserfsprogs 3.6.12-pre3 compiles fine.

> misc.c: In function `count_blocks':
> misc.c:431: error: parse error before '[' token
> make[1]: *** [misc.o] Error 1
> make[1]: Leaving directory `/usr/src/reiserfsprogs-3.6.11/lib'
> make: *** [all-recursive] Error 1
> boogie:/usr/src/reiserfsprogs-3.6.11#

I guess that you do not have BLKGETSIZE64 defined now and our
own definition had a bug, fixed in 3.6.12-pre1.

=2D-=20
Thanks,
Vitaly Fertman


