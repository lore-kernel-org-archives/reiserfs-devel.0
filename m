From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: 2.4.21-rc3
Date: 25 May 2003 20:27:54 +0100
Message-ID: <1053890873.15242.0.camel@dhcp22.swansea.linux.org.uk>
References: <200305232256.17604.russell@coker.com.au>
	 <20030523161356.7986c5d6.pgramoul@nerim.net>
	 <200305241712.23316.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305241712.23316.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <pgramoul@nerim.net>, Russell Coker <russell@coker.com.au>, reiserfs <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sad, 2003-05-24 at 16:12, Dieter N=C3=BCtzel wrote:
> > IIRC, according to Alan Cox, on LKML, IDE shouldn't even work as a modu=
le,
> > well, if you value your data.

Thats only true for loading drivers into a live system where the drive
is already active in legacy mode, and its not something 2.4.19 allowed
so I disabled it again

> > So why don't you include IDE statically in your kernel ?
>=20
> Because it worked for ages and do NOT since 2.4.19 or so.
>=20
> I have all SCSI and need ATA/IDE only from time to time to recover bad AT=
A/IDE=20
> disks for some friends or customers.
>=20
> ATA/IDE shouldn't be demanded thing in the kernel.

Sure. someone just has to fix the makefiles

