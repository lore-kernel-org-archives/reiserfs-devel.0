From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:35:30 +0200
Message-ID: <200302281435.31257.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281403.43093.liviu.voicu@huji.ac.il> <20030228132422.B24291@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12979-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228132422.B24291@humilis>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 14:24, Ookhoi wrote:
> Voicu Liviu wrote (ao):
> > So, you will not suggest me convert my Pentium2 300 Mhz from ext3 to
> > ReiserFS will you?
> > I really wanna try it but I am afraid that the FS will kill my CPU.
>
> I use reiserfs on a p-mmx 200MHz, and it runs fine. Also when I renice
> processes (like kernel compile).
>
> > > > I have to fix the CPU usage icon_sad.gif I makes me crazy...simple
> > > > emerge loads the CPU to 90 ~ 95%
>
> Your problem sounds strange. Kan you show a top snapshot before and
> after the renice?
>
> Btw, dunno about your os, but for example debian start X with nice level
> -10, which makes it a bit more responsive when there are little cpu
> cycles left.

Now do you understand? I'm even afraid to renice my XFree to -10 cuz I'll=20
remain blocked out of the box :-)

>
> > Did not checked this in kernel...will you suggest me try vanilla
> > kernel (2.4.20 from kernel.org) without all those patches I have
> > applyed? Maybe this will help or not?
>
> Try with or without patches, and show the list your .config settings if
> the problem still exists.

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X1eTczD4Ii52ssMRAl3SAJ9z55tFVxthXlC+9CI2BmI5qnj1GQCggSIQ
3k8h4rUvQcwgToYfcDnU5rI=3D
=3DdIat
=2D----END PGP SIGNATURE-----

