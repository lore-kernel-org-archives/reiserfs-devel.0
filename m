From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Can resize_reiserfs do non-destructive resizing??
Date: Tue, 19 Nov 2002 17:12:43 +0100
Message-ID: <200211191712.44146.Dieter.Nuetzel@hamburg.de>
References: <200211180851.54274.bestb@sympatico.ca> <200211191045.35173.bestb@sympatico.ca> <20021119185600.A29078@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021119185600.A29078@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bruce <bestb@sympatico.ca>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Am Dienstag, 19. November 2002 16:56 schrieb Oleg Drokin:
> Hello!
>
> On Tue, Nov 19, 2002 at 10:48:21AM -0500, Bruce wrote:
> > I ran "badblocks /dev/hda2" and it produced a list of 39 numbers.
> > Nov 19 09:52:07 desktop kernel: hda: dma_intr: status=3D0x51 { DriveRea=
dy
> > SeekComplete Error }
>
> Well, that means that your hard drive is failing and reiserfs cannot read
> some of the data because of bad sectors.

Yah, replace that disk (or disks).
Some harddisk manufactures like IBM for example tell you to try there DFT t=
ool=20
first to get a valid RMA number or "low level" reformat the disk, but we=20
replace all such costumer disks. They are out of reserved sector =3D> bad.

Regards,
	Dieter
=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
