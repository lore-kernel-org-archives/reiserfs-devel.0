From: Marcelo Pacheco <marcelo@macp.eti.br>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Sat, 8 Nov 2003 15:05:34 -0200
Message-ID: <200311081505.34738.marcelo@macp.eti.br>
References: <m3ptg42t8l.fsf@toyland.sauerland.de> <200311072107.50957.> <1068356753.3718.1.camel@voyager>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1068356753.3718.1.camel@voyager>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alejandro Sanchez Acosta <alejandro@hispafuentes.com>, Quinn Harris <reiserfs@quinnh.org>
Cc: reiserfs-list@namesys.com

On Sunday 09 November 2003 03:45, Alejandro Sanchez Acosta wrote:
> El s?, 08-11-2003 a las 05:08, Quinn Harris escribi=F3:
> > Did you enable IDE TCQ in your 2.6 kernel?  To quote
> > http://www.namesys.com/ download.html
> > "Don't enable TCQ (Tagged Command Queuing) in 2.5 (and modified 2.4)
> > kernels. TCQ is known broken currently and it will corrupt your
> > filesystems for sure."
>
> What does it do Tagged Command Queuing?
>
> Thanks in advance.
TCQ is a feature that allows a host to send multiple commands to IDE device=
s=20
and have them queued and executed in the most efficient manner to the devic=
e,=20
being interrupted as they become ready. This is a standard SCSI feature tha=
t=20
is available on higher featured drives. Lots of drives don't have this=20
feature, but once it's stable on Linux, it should be ok to enable it by=20
default and let Linux disable it for devices that don't support it. However=
=20
today it's not ready for production.

Marcelo Pacheco

