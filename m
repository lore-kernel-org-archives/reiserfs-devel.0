From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 15:11:56 +0200
Message-ID: <200302281511.56997.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281500.37328.liviu.voicu@huji.ac.il> <20030228140627.I24291@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228140627.I24291@humilis>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 15:06, Ookhoi wrote:
> Voicu Liviu wrote (ao):
> > > In your case, there is no reason to renice the compile to -10, as
> > > there are no other processes which take cpu, and therefore there is
> > > nothing to gain.
> >
> > This is CORRECT, but think, could I use XFree while some preccese has
> > nice value -10? I don't think so
>
> You should be able to. But is your X also -10 ?

now X is not running....only console

> You said you had problem with that too, but that is really weird as X
> would not want 100% cpu.
>
> In an other mail you write that your compiles are very fast. If a new
> kernel doesn't solve your problem, and compiles are very fast anyway, I
> would say: don't do that then (the renice to -10), or renice to -5 or
> some value which does not bother you.

I don't want to renice compilation threads, only X to get more responsives=
=20
from it...but this locks me out :-)

> I'm quite sure this is not reiserfs related in any way. Just convert
> your p300 to reiserfs and see what happens.

maybe........

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X2AcczD4Ii52ssMRAgv7AKCkEbQnPTj2X7a3IMtrjYFgNqTmlQCghvM6
8RbbRK+Z4QZAS1ZWv8BRSmw=3D
=3D2KLA
=2D----END PGP SIGNATURE-----

