From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 16:35:27 +0200
Message-ID: <200307111635.27904.Dieter.Nuetzel@hamburg.de>
References: <20030710052931.GA17957@namesys.com> <Pine.LNX.4.30.0307100851120.26018-100000@divine.city.tvnet.hu> <20030710092112.GA837@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14884-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030710092112.GA837@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, Szakacsits Szabolcs <szaka@sienet.hu>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Am Donnerstag, 10. Juli 2003 11:21 schrieb Oleg Drokin:
> Hello!
>
> On Thu, Jul 10, 2003 at 09:30:46AM +0200, Szakacsits Szabolcs wrote:
> > > > I've noticed very long "hangs" using reiserfs and they were always at
> > > > ftruncate(2). I made a comparision between different filesystems.
> > > > SuSE 8.2
> > >
> > > Yes, this is known "feature".
> >
> > OK, I've searched all relevant archives, namesys web pages and found
> > nothing relevant.
>
> In fact there were sevaral discussions on our mailing list about this.
>
> > > Speeds up large holes creation in ~ 1000 times
> >
> > How long does it take for you the above dd command _and_ how fast is your
> > CPU?
>
> angband:/mnt # time dd if=/dev/zero of=sparse bs=1 seek=200G count=1
> 1+0 records in
> 1+0 records out
>
> real    0m19.205s
> user    0m0.000s
> sys     0m7.130s
>
> This is on Athlon MP-1700+ (I have dual system). The system is all IDE.
> This is still kind of long, but it is better than it was ;)
> Actually I expected it to be much faster, I guess I need to take a look why
> it still eats this much time.

daul Athlon MP 1900+
U160

Argh! ---I can't kill it!
No CNTL-C or '"killall -9 dd" or under "top".
Even as root;-(

2.4.21-jam1 (aa1) plus all data-logging

SOURCE/dri-trunk> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1
0.000u 362.760s 8:26.34 71.6%   0+0k 0+0io 124pf+0w

It was runinng with a paralell C++ (-j20) compilation.

Is the mentioned patch needed?

Regards,
	Dieter

