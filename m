From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: [some sanity for a change] possible design issues for hybrids
Date: Thu, 26 Aug 2004 20:57:40 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408262051030.2304@ppc970.osdl.org>
References: <20040826212853.GA21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261436480.2304@ppc970.osdl.org>
 <20040826223625.GB21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261538030.2304@ppc970.osdl.org>
 <20040826225308.GC21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261619230.2304@ppc970.osdl.org>
 <20040826234048.GD21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261652240.2304@ppc970.osdl.org>
 <20040827010147.GE21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261934570.2304@ppc970.osdl.org>
 <20040827034550.GG21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040827034550.GG21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Fri, 27 Aug 2004 viro@parcelfarce.linux.theplanet.co.uk wrote:
> > 
> > I agree. I frankly have no idea how to do it. I think we need to keep them
> > around for as long as the dentry lifetime, I suspect. That would likely
> > imply that the vfsmount can't increase the dentry refcount - and we'd have
> > some special code in dentry_iput() or something to get rid of them.
> 
> My plan is to drop them as soon as their refcount goes to zero.  In other
> words, make the final mntput() do removal from tree for such vfsmounts.

Can't do that. At least not if you do my plan. 

Even with a zero refcount, the dentry is still valid, and won't see a new 
"->lookup()". And since in my scheme the vfsmount is populated only at 
lookup (and copied later), you can't drop _all_ the vfsmount's. You'd have 
to at least leave one of them, in order to know how to re-create the 
others.

Or do you have a cunning plan?

> > > can get very ugly, since fs could be mounted in a lot of places and/or
> > > in a lot of namespaces.
> > 
> > It _might_ be acceptable to just do the normal shrink_dentry thing, and 
> > then return EBUSY if somebody is still there. 
> 
> We need it for graceful invalidation in case of NFS and friends, though.
> I think it might be doable; if it isn't, we'll see what else can be done,
> but it's worth investigating.

Hey, succeeding and leaving it pending is obviously the user-friendly
thing to do, so I won't argue against it. It's more of a "if it's too hard
to do right, EBUSY is probably an acceptable fallback".

> > Hmm.. Wouldn't the "directory" dentry always be the fake-mountpoint root 
> > one? So we'd always have two dentries, although they are tied together 
> > pretty tightly..
> 
> No.  We don't want to allocate dentries outside of fs code - if nothing
> else, they may need to have proper ->d_op set, etc.  So the only way I
> see here is to have lookup_mnt() set the dentry it got to ->mnt_root of
> new vfsmount.  Anything else opens such a can of worms that I don't want
> to think of audit involved.

Hmm. If you use the same dentry for mnt_root as for mnt_mountpoint, how do 
you avoid the infinite loop in follow_mount? Another magic special case?

			Linus
