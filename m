From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 15:01:42 +0200
Message-ID: <200302281501.43228.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <3E5F5C64.7080408@namesys.com> <20030228135754.G24291@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228135754.G24291@humilis>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 14:57, Ookhoi wrote:
> Hans Reiser wrote (ao):
> > > PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
> > > 889 portage   15 -10 21508  21M  4172 R <  98.9  8.4   0:16 cc1plus
> > > 890 portage    5 -10  2368 2368   752 S <   0.9  0.9   0:00 as
> > > 845 liviu     15   0  1100 1100   792 R     0.1  0.4   0:00 top
> >
> > Voicu, I think you have your nice directions confused, and you want to
> > nice your compile to +10 not -10.  Probably Unix should reverse the
> > directions, but....
>
> I believe he wants to speed up the compile, for which -10 is ok if there
> are other processes which need cpu cycles.

Corect, I use X and vmware and JBuilder and XFCE4 so I can renice each 1 I=
=20
want....

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X123czD4Ii52ssMRAt2MAKCn1qh5LLUxz59BlGXkvg/zgHPuhwCeIwv7
fMUxjNFLbyFxNa3oA5B4Gt0=3D
=3DzzZA
=2D----END PGP SIGNATURE-----

