From: Marc-Christian Petersen <m.c.p@gmx.net>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Mon, 24 Feb 2003 19:01:31 +0100
Message-ID: <200302241901.31903.m.c.p@gmx.net>
References: <1045870331.16048.325.camel@tiny.suse.com> <200302231938.55920.m.c.p@gmx.net> <1046028815.16048.417.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12893-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1046028815.16048.417.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>
Cc: Chris Mason <mason@suse.com>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Chris Mason <mason@namesys.com>

On Sunday 23 February 2003 20:33, Chris Mason wrote:

Hi Chris,

> > _hopefully_ an SMP deadlock while massive disk I/O. :)
> No, the new kinoded-9.diff just changes how kinoded gets woken up, to d=
o
> a better job of limiting the number of unused inodes (but still
> allocated) on the box.
> So, which set of patches were you using when you saw the deadlock?  If
> you can reproduce, could you please capture and decode the output of
> sysrq-t?
Unfortunately my SMP box died some time ago (end Dec. 2002) so I cannot=20
reproduce this yet. It works great with UP machines but I had bad deadloc=
ks=20
with SMP and kinoded-8 which was also in the SuSE 2.4.19 kernel tree.

Let me find some informations I wrote down that time. If I found them I w=
rite=20
them down here.

ciao, Marc
