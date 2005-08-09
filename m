From: michael chang <thenewme91@gmail.com>
Subject: Re: reiser4 performance
Date: Mon, 8 Aug 2005 20:16:44 -0400
Message-ID: <b14e81f0050808171622aeb433@mail.gmail.com>
References: <dd7cbn$kbg$1@sea.gmane.org>
	 <200508081409.03814.rmeijer@internet.gr> <42F7B8F4.80101@slaphack.com>
	 <42F7D77E.5080108@namesys.com> <42F7F28B.7010602@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F7F28B.7010602@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

On 8/8/05, David Masover <ninja@slaphack.com> wrote:
> Hans Reiser wrote:
> > David Masover wrote:
> >>Raymond A. Meijer wrote:
> >>>On Monday 8 August 2005 13:32, Hemiplegic Menehune wrote:
> >>>>Its already as stable as any other fs on my systems and recovers
> >>>>better than most when my battery runs out. Any idea when it will make
> >>>>it into the stable 2.6 kernel?
> >>>If only it had a resizer :(
> >>Resizer isn't such a big deal.  I can usually find enough backup for
> >>enough of what I want, and I usually get sizes right the first time.

I want a resizer (or at least a converter so I can convert to
ResierFS, resize, and reconvert back) because I have a dual-boot WinXP
and Linux/ReiserFS 3.6 system, which I really want to convert to
Reiser4.  I don't mind putting XP on a FAT partition so I can squeeze
it as much as necessary, but only if I can resize my Resier4 partition
as necessary (I don't mind putting at the top of my HD though, atm...)

> >>What I want is the repacker, beacuse performance does steadily degrade
> >>on my Reiser4 systems, eventually getting worse than Reiser3,
> > I am skeptical that it gets worse than V3, unless it is because we
> > haven't put in all the bitmap optimizations we did for V3.  I wish I
> > knew how to measure it.....
>=20
> Me too.  It's fairly subjective on my part, so maybe not.  After all,

Is there a way to count the number of jumps in a file, and the
distance of those jumps when reading a file?  Could the sum or product
of these be some sort of measure of performance (provided that putting
part of a file at the beginning and another part at the end of a disk
don't actually improve performance in some twisted way due to using
different heads simultaneously or something)?

> I've gone from lots-of-tiny-partitions to one-huge-root-partition at the
> same time as I switched from v3 to v4, and I know that most of this is
> probably /usr/portage.  With a repacker, Reiser4 would be the best FS
> for /usr/portage -- it's over a hundred thousand shell scripts and text

It'd be the best FS for just about anyone who likes to tinker, or
anyone with a mid-range system that has a really slow, slow hard
drive.  My newest hard drive also happens to be my slowest... *sigh*

> but without a repacker, it's best kept on a separate partition.

So are many things, it seems.  Sadly.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
