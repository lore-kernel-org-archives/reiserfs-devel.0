From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: reiser4 disk formats (was http://www.namesys.com/snapshots/2004.08.09-internal.testing/)
Date: Mon, 16 Aug 2004 01:50:54 +0200
Message-ID: <20040815235054.GA6721@raptus.homelinux.net>
References: <20040813171827.GA15303@raptus.homelinux.net> <200408160113.38791.frbiscani@jumpy.it> <20040815232751.GA3627@raptus.homelinux.net> <200408160138.30792.frbiscani@jumpy.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408160138.30792.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Aug 16, 2004 at 01:38:30AM +0200, Francesco Biscani wrote:
> Hi,
> 
> On Monday 16 August 2004 01:27, Domenico Andreoli wrote:
> > what is confusing me is Vitaly saying:
> >
> > "The converter (debugfs.reiser4 -C) is supposed to be run on consistent
> >  fs of course, so probably it is worth to check/fix it with the current
> >  reiser4progs before any update."
> >
> > probably with "... any update." he meant also the update of the
> > reiser4progs package to 1.0.0, doesn't him?
> >
> 
> Yes, I think he meant that. Maybe you could just put a message to be printed 
> when reiser4progs 1.x is being installed: "Make sure you checked your reiser4 
> partition(s) if upgrading to this version of reiser4progs from 0.5.x: 
> avoiding to do this may lead to data loss!". This could be made interactive 
> (i.e., "Type 'Yes' to continue"). 
> 

i already tried this way but users did not like the installation being
interrupted. currently i have no time to make the thing polite, i have
to make the upload in the next two days otherwise it risks to miss the
next stable release.

> Just a thought :)

grazie comunque ;) 

ciao
dom

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
