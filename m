From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: Another article abour Reiser4 on linux.com
Date: Sun, 6 Aug 2006 15:15:28 +0200
Message-ID: <200608061515.28467.bernd-schubert@gmx.de>
References: <87bqqzbaug.fsf@baldur.nicundtas.de> <200608061304.42692.bernd-schubert@gmx.de> <eb4o19$5ik$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29508-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <eb4o19$5ik$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-list@namesys.com, Lexington Luthor <Lexington.Luthor@gmail.com>

On Sunday 06 August 2006 14:41, Lexington Luthor wrote:
> Bernd Schubert wrote:
> > An alternative might be a reiser4 fuse port. Has some advantages:
> >
> > - Doesn't need to be included into the kernel.
> >
> > - can be GPL
> >
> > - Referring to the fuse site it also works on BSD
> > (http://fuse4bsd.creo.hu/).
> >
> > - Kills one of the major arguments on LKML - if reiser4 is included but
> > Namesys abandons  it in the future and reiser4 has to be removed from t=
he
> > kernel that time again, it still could be mounted.
>
> Please please no. The kernel people will use that as an argument for
> keeping it out of the kernel. I want reiser4 to be popular enough to
> make my apps depend on it and not have the users complain about having
> to use an obscure fs.
>
> Besides, the only thing about reiser4 that interests me more than XFS or
> reiserfs is the speed. In FUSE, you lose all that (as well as millions
> of context switches, there is a huge amount of copying going on). If
> reiser4 gets slower, I might as well use XFS or even old reiserfs.

Well, by having a FUSE port just more users would use reiser4, which might=
=20
increase the force to the linux distributors to include reiser4 into their=
=20
kernel versions.=20

Regarding the speed, I understand that its slower with FUSE, I was also dee=
ply=20
impressed when I read this =20
(http://sourceforge.net/mailarchive/forum.php?thread_id=3D23836054&forum_id=
=3D2697)

	But being twice as fast as ext3 is enough currently. It's even faster than=
=20
	xfs what I use. Sometimes I'm quite suprised why something is so fast when
	I realize that it was actually ntfs-3g :-)


Cheers,
	Bernd

=2D-=20
Bernd Schubert
PCI / Theoretische Chemie
Universit=C3=A4t Heidelberg
INF 229
69120 Heidelberg

