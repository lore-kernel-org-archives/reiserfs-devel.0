From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 23:02:13 +0100
Message-ID: <200212232302.13468.Dieter.Nuetzel@hamburg.de>
References: <3E06F360.7000708@namesys.com> <139251509046.20021223123719@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <139251509046.20021223123719@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS <reiserfs-list@namesys.com>

Am Montag, 23. Dezember 2002 12:37 schrieb Anders Widman:
> > We were discussing how to optimize reiser4 best, and came to realize
> > that us developers did not have a good enough intuition for what users
> > do that stresses their filesystem enough that they care about its
> > performance.
> >
> > If you just do edits of files it probably does not matter too much what
> > fs you use.
>
> depends  on  how  large  edits  =3D)..  Like  video-editing requires big
> r/w performance.

Like Andrew Morten suggest all the time (deadline IO tests):

Running (heavy) constant (streaming) IO in the background during "normal" I=
O=20
(20-40 parallel gcc/g++ compilers (make -j20) in my case).

WMs e.g. KDE 3.1 isn't a case any longer...;-)

Give your "workers" a break.
			Merry Christmas!

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
