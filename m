From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: 2.4.21-rc3
Date: Sat, 24 May 2003 17:12:23 +0200
Message-ID: <200305241712.23316.Dieter.Nuetzel@hamburg.de>
References: <200305232256.17604.russell@coker.com.au> <20030523161356.7986c5d6.pgramoul@nerim.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030523161356.7986c5d6.pgramoul@nerim.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?iso-8859-15?q?Gramoull=E9?= <pgramoul@nerim.net>, Russell Coker <russell@coker.com.au>
Cc: reiserfs <reiserfs-list@namesys.com>, Linux Kernel List <linux-kernel@vger.kernel.org>

Am Freitag, 23. Mai 2003 16:13 schrieb Philippe Gramoull=E9:
> Hello Russell,
>
> On Fri, 23 May 2003 22:56:17 +1000
>
> Russell Coker <russell@coker.com.au> wrote:
>   | I've noticed that the modules ide-taskfile.o and ide-io.o depend on
>   | each other if you compile the 2.4.21-rc3 with IDE as modules.
>   |
>   | Is this a bug in the kernel or are we supposed to use a new module
>   | loader that can resolve such things?
>
> IIRC, according to Alan Cox, on LKML, IDE shouldn't even work as a module,
> well, if you value your data.
>
> So why don't you include IDE statically in your kernel ?

Because it worked for ages and do NOT since 2.4.19 or so.

I have all SCSI and need ATA/IDE only from time to time to recover bad ATA/=
IDE=20
disks for some friends or customers.

ATA/IDE shouldn't be demanded thing in the kernel.

Regards,
	Dieter
=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

