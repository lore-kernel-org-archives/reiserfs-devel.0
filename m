From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Horrible ftruncate performance
Date: Sat, 12 Jul 2003 03:37:48 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
References: <200307112151.05829.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14905-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307112151.05829.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, Marc-Christian Petersen <m.c.p@gmx.net>, reiserfs-list@namesys.com, Philippe =?iso-8859-1?q?Gramoull=E9?= <philippe.gramoulle@mmania.com>


On Fri, 11 Jul 2003, Dieter [iso-8859-1] N=FCtzel wrote:

> As reminder the old numbers (single U160, IBM 10k rpm):

For the below test, disk doesn't really matter. It's almost [should be (*)]
pure CPU job. Otherwise I'd have suggested a 'sync' at the end(**).

> 2.4.21-jam1 (aa1) plus all data-logging
>
> SOURCE/dri-trunk> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G c=
ount=3D1
> 0.000u 362.760s 8:26.34 71.6%   0+0k 0+0io 124pf+0w
>
> It was runinng with a paralell C++ (-j20) compilation.
> Now the new ones (I've test with and without above C++ compilation ;-)
>
> INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse2 bs=3D1 seek=3D200G co=
unt=3D1
> 0.000u 0.010s 0:00.00 0.0%      0+0k 0+0io 153pf+0w

This is too good to be true. You shouldn't have sparse2 before running the
test. You wrote you tried this twice ("with and without above C++
compilation"). This should be the result of the second run.

> More than 506 times...
> =3D> 506.34 seconds (8:26.34) / 0.01 seconds =3D 50.634 times ;-)))

I guess you mean 50,634 or 50634 times faster? But I'm afraid you didn't
test what you should have. Interestingly, the above speedup, 50 times, is
just what I got with Oleg's patch. So now it's only about 2000 times slower
than XFS, JFS and ext3.

Footnotes:
(*) So disk shouldn't matter because the other filesystems use only 4kB to
    store this 200GB sparse file. ReiserFS wastes 201MB! One could
    mistakenly think this IO could be one of the reasons for the slowless,
    but not. No 'sync' and anyway it's just 2 sec to do it on my disk
    later on.

(**) There are a lot of bogus fs benchmarks out there. One of the many
    issues missed is sync after write tests. I also noticed ReiserFS is
    quick to say "I did it" but sometimes it "hangs" for a painful time.
    Ragged, sluggish. Without the sync, I've seen and experienced ResierFS
    frequently coming out as the winner [not sustained writes]. With sync,
    the results are different.

Ok, last complain for today :) I couldn't find an API (I admit, because of
the above reasons, I didn't search hard) to query the map of disk blocks or
[offsets, length] couples used by a file, like XFS's XFS_IOC_GETBMAPX does.
This makes also ReiserFS inadequate to work with sparse files efficiently.

	Szaka

