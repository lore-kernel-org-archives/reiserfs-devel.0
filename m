From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 15:45:37 +0200
Message-ID: <200302281545.37337.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281533.02318.liviu.voicu@huji.ac.il> <20030228143354.M24291@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228143354.M24291@humilis>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 15:33, Ookhoi wrote:
> Voicu Liviu wrote (ao):
> > > > This is my .config file of the kernel 2.4.20..,maybe you can find
> > > > some wrong in here..........
> > > >
> > > > # CONFIG_MPENTIUMIII is not set
> > > > # CONFIG_MPENTIUMIII31 is not set
> > > > # CONFIG_MPENTIUM4 is not set
> > > > CONFIG_MPENTIUM431=3Dy
> > >
> > > What cpu is this? This is not in a 2.4.20 kernel. Are you sure this is
> > > the right .config?
> > > You should use CONFIG_MPENTIUM4 I think.
> >
> > i have applyed 13_gcc31-compile-optimizations patch
> > (this gives me specific march for the cpu i want)
> >
> > +ifdef CONFIG_MPENTIUM431
> > +CFLAGS +=3D -march=3Dpentium4 -mmmx -msse -msse2 -falign-functions=3D4
> > - -fprefetch-loop-arrays -maccumulate-outgoing-args
> > +endif
> >
> > see?
>
> Jup, ok.
>
> > > > CONFIG_BLK_DEV_IDEDISK=3Dy
> > > > CONFIG_IDEDISK_MULTI_MODE=3Dy
> > >
> > > Why this one?
> >
> > well, not sure about these...these are my patches........
> >
> > # ls
> > 001_o1_pe_ll_021215_ck_2.4.20.patch.bz2
> > 005_supermount_021215_ck_2.4.20.patch.bz2
> > 010_tune_021217_ck_2.4.20.patch.bz2
> > 002_aavm_021215_ck_2.4.20.patch.bz2    =20
> > 007_acpi_021215_ck_2.4.20.patch.bz2 011_vt_021217_ck_2.4.20.patch.bz2
> > 003_rl2_021215_ck.2.4.20.patch.bz2     =20
> > 008_vh_021217_ck_2.4.20.patch.bz2
>
> Ok, now please try again with the latest 2.4.21-preX

kernel.org sais:
[quote]
Prepatches may be poorly tested, and may in fact not work at all. Use on yo=
ur=20
own risk;
[/quote]

Do you think this kernel will boot? The computer is 45 minutes far away fro=
m=20
my location is it will not be nice :-)
=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X2gBczD4Ii52ssMRApdJAJ9In9i5CL7kqu02zHzOqW3w05WJVQCeP2dK
/KRW/OCtUmA0AHq8xSAnvM0=3D
=3DA0iL
=2D----END PGP SIGNATURE-----

