From: Dieter =?iso-8859-2?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Sat, 12 Jul 2003 16:05:27 +0200
Message-ID: <200307121605.27404.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, Marc-Christian Petersen <m.c.p@gmx.net>, reiserfs-list@namesys.com, Philippe =?iso-8859-2?q?Gramoull=E9?= <philippe.gramoulle@mmania.com>

Am Samstag, 12. Juli 2003 03:37 schrieb Szakacsits Szabolcs:
> On Fri, 11 Jul 2003, Dieter [iso-8859-1] N=FCtzel wrote:
> > As reminder the old numbers (single U160, IBM 10k rpm):
>
> For the below test, disk doesn't really matter. It's almost [should be (*=
)]
> pure CPU job. Otherwise I'd have suggested a 'sync' at the end(**).
>
> > 2.4.21-jam1 (aa1) plus all data-logging
> >
> > SOURCE/dri-trunk> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G=
 count=3D1
> > 0.000u 362.760s 8:26.34 71.6%   0+0k 0+0io 124pf+0w
> >
> > It was runinng with a paralell C++ (-j20) compilation.
> > Now the new ones (I've test with and without above C++ compilation ;-)
> >
> > INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse2 bs=3D1 seek=3D200G =
count=3D1
> > 0.000u 0.010s 0:00.00 0.0%      0+0k 0+0io 153pf+0w
>
> This is too good to be true. You shouldn't have sparse2 before running the
> test. You wrote you tried this twice ("with and without above C++
> compilation"). This should be the result of the second run.
>
> > More than 506 times...
> > =3D> 506.34 seconds (8:26.34) / 0.01 seconds =3D 50.634 times ;-)))

[-]

> Footnotes:
> (*) So disk shouldn't matter because the other filesystems use only 4kB to
>     store this 200GB sparse file. ReiserFS wastes 201MB!

No. Exactly 8192 bytes (8 KibiBytes)

>     One could
>     mistakenly think this IO could be one of the reasons for the slowless,
>     but not. No 'sync' and anyway it's just 2 sec to do it on my disk
>     later on.

It is all fixed. With or without final 'sync'.

> (**) There are a lot of bogus fs benchmarks out there. One of the many
>     issues missed is sync after write tests. I also noticed ReiserFS is
>     quick to say "I did it" but sometimes it "hangs" for a painful time.

Never append for ages.

>     Ragged, sluggish. Without the sync, I've seen and experienced ResierFS
>     frequently coming out as the winner [not sustained writes]. With sync,
>     the results are different.

Test with fsync. Try Chris's "synctest".

=2DDieter

