From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 16:32:58 +0200
Message-ID: <200307111632.58349.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.30.0307100523110.24356-100000@divine.city.tvnet.hu> <20030710052931.GA17957@namesys.com> <1057933624.13313.60.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1057933624.13313.60.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>
Cc: Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com

Am Freitag, 11. Juli 2003 16:27 schrieb Chris Mason:
> On Thu, 2003-07-10 at 01:29, Oleg Drokin wrote:
> > Hello!
> >
> > On Thu, Jul 10, 2003 at 05:23:39AM +0200, Szakacsits Szabolcs wrote:
> > > I've noticed very long "hangs" using reiserfs and they were always at
> > > ftruncate(2). I made a comparision between different filesystems. SuSE
> > > 8.2
> >
> > Yes, this is known "feature".
> >
> > > (same bad performance on older SuSE versions as well), same
> > > partitition, default mkfs.*. Let's create a 200GB sparse file:
> > > 	dd if=/dev/zero of=sparse bs=1 seek=200G count=1
> > > Results:
> > > 	ext3	    0.00 sec
> > > 	XFS         0.00 sec
> > > 	JFS         0.00 sec
> > > 	reiserfs  874.27 sec (all spent in the kernel)
> >
> > See the patch below.
> > It is merged into 2.4.22-pre3
> > Speeds up large holes creation in ~ 1000 times (on 4k blocksize)
> >
> > > Is there a faster way to create big sparse files on reiserfs?
> >
> > Use the patch. (should apply to 2.4.18,2.4.19,2.4.20,2.4.21)
> > (I am unsure if you can apply it to the kernel from SuSE 8.2, though).
>
> I'll try to get this in for 8.3, it makes a huge difference.

9.0 ...If I'm right...;-)

And reiserfsprogs-3.6.8 (9 with the great speedup)?

Greetings,
	Dieter

