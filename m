From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 16:12:31 +0200
Message-ID: <200302281612.32208.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281511.56997.liviu.voicu@huji.ac.il> <20030228170737.B11516@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228170737.B11516@namesys.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 16:07, Oleg Drokin wrote:
> Hello!
>
> On Fri, Feb 28, 2003 at 03:11:56PM +0200, Voicu Liviu wrote:
> > > You said you had problem with that too, but that is really weird as X
> > > would not want 100% cpu.
> > > In an other mail you write that your compiles are very fast. If a new
> > > kernel doesn't solve your problem, and compiles are very fast anyway,=
 I
> > > would say: don't do that then (the renice to -10), or renice to -5 or
> > > some value which does not bother you.
> >
> > I don't want to renice compilation threads, only X to get more
> > responsives from it...but this locks me out :-)
>
> Hm, but if you do not renice X, it works ok?

works but makes my box so slow.........

> I just noticed:
> > Mem:   255948k av,  250540k used,    5408k free,       0k shrd,   28344k
> > buff 59512k active,             119096k inactive
> > Swap:  514072k av,     144k used,  513928k free                  122280k
>
> So if you add X and kde (and other heavy stuff to that), you basically ha=
ve

i just compile kde ( for now I used fluxbox and when I did renice -10 to X,=
 it=20
becomed very slow )

> no RAM, so probably all the slowdown is from constant swapping.
> Just run top when you see the interactive slowdown and look at the
> swapin/swapout ratio and swap isage in top & /proc/stat
>
> Bye,
>     Oleg

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X25PczD4Ii52ssMRAtnRAKCZ1LmfBi3U2uzpxj8ypzYDhSYD2QCfZZ2M
RoRNCNMuJF35Iphd5kghjyE=3D
=3DJNwI
=2D----END PGP SIGNATURE-----

