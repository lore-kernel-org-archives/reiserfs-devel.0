From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 15:19:57 +0200
Message-ID: <200302281519.58013.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281511.56997.liviu.voicu@huji.ac.il> <20030228141316.J24291@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228141316.J24291@humilis>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 15:13, Ookhoi wrote:
> Voicu Liviu wrote (ao):
> > > kernel doesn't solve your problem, and compiles are very fast
> > > anyway, I would say: don't do that then (the renice to -10), or
> > > renice to -5 or some value which does not bother you.
> >
> > I don't want to renice compilation threads, only X to get more
> > responsives from it...but this locks me out :-)
>
> So you say, if your box is idle, and you renice your X to -10, you can't
> use X? And your input on the prompt is still very slow?
>
> That would be very weird.

This is what makes me think if I will stick with reiser or not because I ne=
ed=20
x up with vmware and other shit so if i'll try to renice X I won't be able =
to=20
work :-)

>
> I asked you to take the latest 2.4 without patches, but please try the
> latest 2.4 with the latest -pre patch. I'm curious to what that one will
> bring.

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X2H9czD4Ii52ssMRArgyAJ9lAXRe11nYnWLOtFG/zAES1irqYgCeMKRg
5MizncSaxkhb1OZw/6AaDF0=3D
=3DOViY
=2D----END PGP SIGNATURE-----

