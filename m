From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:11:38 +0200
Message-ID: <200302281411.38967.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <20030228105145.C1234@namesys.com> <3E5F50F3.2040907@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12973-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E5F50F3.2040907@namesys.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 14:07, Hans Reiser wrote:
> Oleg Drokin wrote:
> >Hello!
> >
> >On Fri, Feb 28, 2003 at 12:11:14AM +0200, Voicu Liviu wrote:
> >>Any clue what is going on?
> >>Maybe ReiserFS uses the cpu harder?
> >
> >reiserfs is using more CPU than ext2/ext3. It's maintaining its metadata
> > in balanced tree. Each tree update often requires shifting of some of t=
he
> > data between or inside of tree nodes. That's where CPU time is going.
> >
> >>I have to fix the CPU usage icon_sad.gif I makes me crazy...simple emer=
ge
> >>loads the CPU to 90 ~ 95%
> >
> >Make sure you do not have "CONFIG_REISERFS_CHECK" enabled in you kernel
> > config, as this enables lots of extra checks in reiserfs code that
> > consume even more CPU.
> >
> >Bye,
> >    Oleg
>
> using notail option will reduce CPU usage, improve read performance, and

Already using this :-)
Any way, the system works great but if I change the "nice" value of some=20
process then the CPU almost becomes slave of this process.........

> waste some disk space (still better than ext*).

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X1H6czD4Ii52ssMRAkENAJ9Se2K6cCg34qujC5q4BBCS7Z+31gCbBIzy
GIcTxyYFKWtc44my8Cxf1f4=3D
=3DoxkP
=2D----END PGP SIGNATURE-----

