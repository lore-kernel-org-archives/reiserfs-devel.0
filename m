From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 17:36:52 +0200
Message-ID: <200307111736.52211.Dieter.Nuetzel@hamburg.de>
References: <20030710052931.GA17957@namesys.com> <200307111732.49524.Dieter.Nuetzel@hamburg.de> <200307111736.00500.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307111736.00500.m.c.p@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marc-Christian Petersen <m.c.p@gmx.net>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Am Freitag, 11. Juli 2003 17:36 schrieb Marc-Christian Petersen:
> On Friday 11 July 2003 17:32, Dieter N=FCtzel wrote:
>
> Hi Dieter,
>
> > Where comes this from?
> > I don't find it my tree:
> >
> > fs/eiserfs/inode.c
> >
> > -            if (un.unfm_nodenum)
> >                  inode->i_blocks +=3D inode->i_sb->s_blocksize / 512;
> >              //mark_tail_converted (inode);
>
> reiserfs-quota patch removes this.

Ah, thank you very much.

I can go ahead, then.

=2DDieter

