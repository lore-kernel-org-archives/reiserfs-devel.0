From: Dieter =?utf-8?q?N=C3=BCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Can resize_reiserfs do non-destructive resizing??
Date: Tue, 19 Nov 2002 17:51:28 +0100
Message-ID: <200211191751.28199.Dieter.Nuetzel@hamburg.de>
References: <200211180851.54274.bestb@sympatico.ca> <200211191712.44146.Dieter.Nuetzel@hamburg.de> <20021119163358.GD28533@mrball.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12035-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021119163358.GD28533@mrball.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Todd Lyons <todd@mrball.net>, reiserfs-list@namesys.com

Am Dienstag, 19. November 2002 17:33 schrieb Todd Lyons:
> Dieter N=C3=BCtzel wanted us to know:
> >Some harddisk manufactures like IBM for example tell you to try there DFT
> > tool first to get a valid RMA number or "low level" reformat the disk,
> > but we
>
> Very familiar with those.  We got a stack of boxen with the IBM
> DTLA-307030 drives in them.  Lose about 2 per month.

Last here from Fujitsu the ATA "gel/liquid layer" ones.

> >replace all such costumer disks. They are out of reserved sector =3D> ba=
d.
>
> Netware used to call this "hotfix".  Is there a common name for when the
> harddrives do this themselves?

sector remapping?

Or do you mean the whole reformat? The last could only be initiated through=
=20
the admin and need good backup (dd_rescue) first.

=2DDieter

=2D-=20
Dieter N=C3=BCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
