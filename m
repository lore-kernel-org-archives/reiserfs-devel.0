From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Oh no! Not again!
Date: Tue, 28 Jan 2003 14:00:09 +0300
Message-ID: <200301281400.09364.vitaly@namesys.com>
References: <20030117221535.GA945@Kadath> <20030124222823.GA15643@hell.mine.nu> <20030128024158.GA19336@hell.mine.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030128024158.GA19336@hell.mine.nu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list@namesys.com

On Tuesday 28 January 2003 05:41, Francois-Rene Rideau wrote:
> Dear all,
>
> to determine whether my DMA problem was due to the disk or the motherboar=
d,
> I moved the disk to another machine, where I could successfully
> hdparm -Tt /dev/hdc without crashing linux while in udma2.
> However, when I put the disk back into its rightful place,
> linux died horribly with lots of error messages from reiserfs.
> I booted on /boot where I had kept a minimal runtime, and used reiserfsck.
> Reiserfsck reported an inconsistency that required using --rebuild-tree.
> And after approximately two hours, reiserfsck --rebuild-tree entered
> an endless loop, printing
> do_pass_2: The block (27179935) is in the tree already. Should not happen.

looks like progs were compiled with other libs. Could you rebuild progs whe=
re=20
you booted again or link them statically:=20
	make LDFLAGS=3D'-static'
and try agan.

> Is there anything I can do about that, to put it in working order,
> or should I reformat and restore what I can from backup?
>
> I've got a distinct feeling this disk will soon go back to MAXTOR,
> just like its twin brother.
>
> [ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics |
> http://fare.tunes.org ] [  TUNES project for a Free Reflective Computing
> System  | http://tunes.org  ] http://Bastiat.org/ - debunking economic
> sophisms since 1845.

--=20

Thanks,
Vitaly Fertman
