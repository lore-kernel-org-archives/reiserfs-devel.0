From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: vs-4080 & more corruptions
Date: Tue, 2 Jul 2002 15:05:53 -0400
Message-ID: <200207021505.53472.kuba@mareimbrium.org>
References: <Pine.LNX.4.44.0206261511001.1011-100000@sheep.fluffy.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10901-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0206261511001.1011-100000@sheep.fluffy.housecafe.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian <evilninja@gmx.net>
Cc: reiserfs-list@namesys.com

On =B6roda 26 czerwiec 2002 09:18 am, Christian wrote:
> hi,
>
> > you will know that you need to replace some of your hardware.
> > (may be something as simple as replacing IDE cable).
>
> well, you were right. and i was wrong to blame reiserfs for this problem.
> i'm very sorry about my calumny.
>
> i set the disk into another system and the --rebuild-tree finished and the
> --check did not find any errors anymore and now i can mount and read/write
> o my partition and all my data is in there --> i'm very happy.
> i changed the cable in this machine and i hope it was the cable and not
> the ide-chipset of this quite old machine the disk is now in again.
>

That's one of the reasons to use newer machines with UDMA drives &=20
controllers, because these CRC-check the data going over the wires, which=20
helps a lot in some cases.

Cheers, Kuba
