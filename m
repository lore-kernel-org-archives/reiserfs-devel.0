From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4
Date: Mon, 22 Dec 2003 15:23:26 +0300
Message-ID: <200312221523.26888.vitaly@namesys.com>
References: <200312212203.52775.janfengler@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16374-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312212203.52775.janfengler@web.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Fengler <janfengler@web.de>, reiserfs-list@namesys.com

Hello,=20

On Monday 22 December 2003 00:03, Jan Fengler wrote:
> Hello,
>
> I have some trouble checking my reiser4 partition. I use fsck.reiser4
> version 0.4.19 and libaal version 0.4.14 on linux-2.6.0-test11. I've
> attached the logfile and the output from dmesg.
> I dont know if it is a bug in fsck.reiser4, but if there is really an err=
or
> on my partition (everything works well 'til now), i think it should be
> possible to correct it via fsck.
> I've already tried to use the newest bitkeeper-sources of
> libaal/reiserfs4progs, but the reiserfs4progs won't compile.
>
> Thanks in advance for your attention!
> =A0=A0=A0=A0=A0=A0=A0=A0Jan Fengler

It seems this bug was already fixed, we have not released=20
another reiser4progs snapshot yet, so you can wait a bit for=20
the coming release or you can get the code from our bk=20
repositories:

bk clone bk://bk.namesys.com/bk/libaal
bk clone bk://bk.namesys.com/bk/reiser4progs

=2D-=20
Thanks,
Vitaly Fertman
