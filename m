From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: [some sanity for a change] possible design issues for hybrids
Date: Fri, 27 Aug 2004 04:45:50 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040827034550.GG21964@parcelfarce.linux.theplanet.co.uk>
References: <20040826212853.GA21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261436480.2304@ppc970.osdl.org> <20040826223625.GB21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261538030.2304@ppc970.osdl.org> <20040826225308.GC21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261619230.2304@ppc970.osdl.org> <20040826234048.GD21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261652240.2304@ppc970.osdl.org> <20040827010147.GE21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261934570.2304@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408261934570.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 07:46:41PM -0700, Linus Torvalds wrote:
> 
> 
> On Fri, 27 Aug 2004 viro@parcelfarce.linux.theplanet.co.uk wrote:
> > 
> > Hmm...  IOW, you are suggesting to use normal trigger for lookup_mnt() and
> > then have extra check in lookup_mnt() failure exit.
> 
> Yes. That should be an _extremely_ rare failure case anyway, unless people 
> start using namespaces more.

Namespaces actually are irrelevant - a box with several dozens of chroot
jail is not particulary exotic thing and it's equivalent to our case.

However, extra check of a flag at that point won't be too much overhead
anyway.
 
> > Freeing these guys will not be fun.
> 
> I agree. I frankly have no idea how to do it. I think we need to keep them
> around for as long as the dentry lifetime, I suspect. That would likely
> imply that the vfsmount can't increase the dentry refcount - and we'd have
> some special code in dentry_iput() or something to get rid of them.

My plan is to drop them as soon as their refcount goes to zero.  In other
words, make the final mntput() do removal from tree for such vfsmounts.
Will take some surgery, but it's definitely safer than playing with ->d_iput()
et.al.

> > can get very ugly, since fs could be mounted in a lot of places and/or
> > in a lot of namespaces.
> 
> It _might_ be acceptable to just do the normal shrink_dentry thing, and 
> then return EBUSY if somebody is still there. 

We need it for graceful invalidation in case of NFS and friends, though.
I think it might be doable; if it isn't, we'll see what else can be done,
but it's worth investigating.
 
> > Locking rules for attaching might need adjustment (the logics with ->i_sem
> > is that we want !d_mountpoint() stay true around call of ->unlink(),
> > ->rmdir() and ->rename()
> 
> That should be ok. Since we'd only do the d_mount stuff on a "->lookup()", 
> and since the lookup will take ->i_sem anyway, we should be fine, no?

Oh, I'm not worried about that kind of incrementing ->d_mount.  It's OK.
It's existing places that worry me - e.g. if we get pivot_root() moving
that hybrid-created vfsmount around and suddenly find that we had replaced
"killable" vfsmount with normal one, while holding only vfsmount lock.
That would screw the logics in unlink() if we get a race.

It's not that hard to do, just that we need to take a good look at that
kind of corner cases.

> > One thing that looks like a bad interface: we get forcible "use same
> > dentry for file and directory" with that design.
> 
> Hmm.. Wouldn't the "directory" dentry always be the fake-mountpoint root 
> one? So we'd always have two dentries, although they are tied together 
> pretty tightly..

No.  We don't want to allocate dentries outside of fs code - if nothing
else, they may need to have proper ->d_op set, etc.  So the only way I
see here is to have lookup_mnt() set the dentry it got to ->mnt_root of
new vfsmount.  Anything else opens such a can of worms that I don't want
to think of audit involved.

We *might* have a secondary dentry allocated by ->lookup() and stored somewhere
in the main one.  I'm not sure it's a good way to handle the things, though.

I'll try to put together what we got so far + notes on mount-traps and
post more coherent and detailed variant of original post.  Hopefully,
writing it down would help to sort the things out...
