From: Lars O. Grobe <grobe@gmx.net>
Subject: Re: How to build a big file server
Date: Thu, 12 Jun 2003 22:34:25 +0200
Message-ID: <E19QYkY-00030k-00@main.gmane.org>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <1055252169.2010.5.camel@wusel.schnulli.de> <3EE5E77E.70505@dotcom.pl>
Reply-To: grobe@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14523-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EE5E77E.70505@dotcom.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> >>>3ware Controller. Works perfect.
> >>
> >>but not in raid 5...
> >>
>  > What do you mean? Do have any experiences? What type of controler do
>  > use?

Hi,

just a short note, I have been using 3ware controllers (the old 6800s) on=
 a=20
540GB backup server... after too much trouble, I switched to software-rai=
d.=20
The controller only gives me 8 channels now, raid5 is done by software.=20
Better performance, no need of identical disks (almost impossible in=20
ide-world), no firmware-problems any more.

However, a serious server has always scsi (or fc) IMHO...

CU Lars.
