From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: [some sanity for a change] possible design issues for hybrids
Date: Thu, 26 Aug 2004 19:46:41 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261934570.2304@ppc970.osdl.org>
References: <20040826203228.GZ21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261344150.2304@ppc970.osdl.org>
 <20040826212853.GA21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261436480.2304@ppc970.osdl.org>
 <20040826223625.GB21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261538030.2304@ppc970.osdl.org>
 <20040826225308.GC21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261619230.2304@ppc970.osdl.org>
 <20040826234048.GD21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261652240.2304@ppc970.osdl.org>
 <20040827010147.GE21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040827010147.GE21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Fri, 27 Aug 2004 viro@parcelfarce.linux.theplanet.co.uk wrote:
> 
> Hmm...  IOW, you are suggesting to use normal trigger for lookup_mnt() and
> then have extra check in lookup_mnt() failure exit.

Yes. That should be an _extremely_ rare failure case anyway, unless people 
start using namespaces more.

> Freeing these guys will not be fun.

I agree. I frankly have no idea how to do it. I think we need to keep them
around for as long as the dentry lifetime, I suspect. That would likely
imply that the vfsmount can't increase the dentry refcount - and we'd have
some special code in dentry_iput() or something to get rid of them.

> Situation with unlink(): we need to (a) check that all vfsmounts over
> given point are "hybrid" ones (locking is not a problem at that point)
> and (b) after successful operation (unlink() and rename() alike, AFAICS)
> we want to go and kill everything under the victim dentry.  *That*
> can get very ugly, since fs could be mounted in a lot of places and/or
> in a lot of namespaces.

It _might_ be acceptable to just do the normal shrink_dentry thing, and 
then return EBUSY if somebody is still there. 

> Locking rules for attaching might need adjustment (the logics with ->i_sem
> is that we want !d_mountpoint() stay true around call of ->unlink(),
> ->rmdir() and ->rename()

That should be ok. Since we'd only do the d_mount stuff on a "->lookup()", 
and since the lookup will take ->i_sem anyway, we should be fine, no?

> One thing that looks like a bad interface: we get forcible "use same
> dentry for file and directory" with that design.

Hmm.. Wouldn't the "directory" dentry always be the fake-mountpoint root 
one? So we'd always have two dentries, although they are tied together 
pretty tightly..

		Linus
