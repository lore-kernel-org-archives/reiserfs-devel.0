From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfsprogs-3.6.4-pre2
Date: Wed, 18 Sep 2002 04:20:13 +0200
Message-ID: <200209180420.13495.Dieter.Nuetzel@hamburg.de>
References: <200209171723.09026.vitaly@namesys.com> <3D87DD22.9050706@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11503-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D87DD22.9050706@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Wednesday 18 September 2002 03:55, Manuel Krause wrote:
> On 09/17/2002 03:23 PM, Vitaly Fertman wrote:
> > Hi all,
> >
> > A new reiserfsprogs pre release is available at
> > ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.4-pre2.tar.gz
> >
> > Changes went into 3.6.4-pre2:
> >
> > fix-fixable sets correct item formats in item headers if needed.
> > rebuild got some extra checks for invalid tails on pass0.
> > fsck check does not complain on wrong file sizes if safelink exists.
> > check dma mode/spead of harddrive and warn the user if it descreased
> >   -- it could happen due to some hardware problem.
> >
> > Bugs:
> >
> > during conversion tails to indirect items on pass2 and back conversion
> >   on semantic pass.
> > not proper cleaning flags in item headers.
> > during relocation of shared objects.
> > new block allocating on pass2 (very rare case).
>
> Hi Vitaly!
>
> Does this mean these "Bugs" are
>   [a] only in 3.6.4-pre2, so: newly "created"
>   [b] in 3.6.4-pre2 and the previous -pres
>   [c] or even in the 3.6.3 release,too
> ???

Manuel geh ins Bett oder lese "richtig"...;-)

It should read (I think):

* New stuff --- Changes...

* with -pre2 fixed bugs...

Good night!
	Dieter
--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

