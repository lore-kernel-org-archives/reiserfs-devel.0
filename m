From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: [some sanity for a change] possible design issues for hybrids
Date: Thu, 26 Aug 2004 21:42:26 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408262135160.2304@ppc970.osdl.org>
References: <20040826223625.GB21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261538030.2304@ppc970.osdl.org>
 <20040826225308.GC21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261619230.2304@ppc970.osdl.org>
 <20040826234048.GD21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261652240.2304@ppc970.osdl.org>
 <20040827010147.GE21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408261934570.2304@ppc970.osdl.org>
 <20040827034550.GG21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408262051030.2304@ppc970.osdl.org>
 <20040827043058.GH21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20873-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040827043058.GH21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Fri, 27 Aug 2004 viro@parcelfarce.linux.theplanet.co.uk wrote:
>
> > Or do you have a cunning plan?
> 
> a) set ->d_mount to 1 and set DCACHE_HYBRID at ->lookup() time
> b) in lookup_mnt():
> 	if (unlikely(dentry has DCACHE_HYBRID)) {
> 		if (linkely(dentry->d_mount == 1))
> 			goto New;
> 	}
> 	do the normal series of hash lookups
> 	if (likely(dentry doesn't have DCACHE_HYBRID))
> 		return;
> 	if (vfsmount is marked as hybrid && dentry == vfsmount->mnt_dentry)
> 		return;

Hmm.. Here we shouldn't have a vfsmount. If we have one, that means that 
we found it in the hashes, and we should just have returned it 
immediately (whether hybrid or not doesn't matter at that point).

Also, I don't see the magic with "dentry->d_mount == 1", since we may have 
allowed the dentry to be mounted on for real at one of the places, without 
losing it's "hydridity" (it's not a word, but dammit, it should be one) 
for that.

Is that part just an optimization to avoid the hash lookups?

> New:
> 	allocate new vfsmount and mark it as hybrid
> 	attach it on top of our one and go there
> 
> Does that qualify as cunning?  With that approach we have nothing non-trivial
> to do at lookup time and lookup_mnt() will DTRT with minimal fuss.

Ok, I think it qualifies as cunning enough. It has the nice property of 
not apparently needing any vfsmount-related code at all at lookup() time. 
Which is a bonus. 

> > Hmm. If you use the same dentry for mnt_root as for mnt_mountpoint, how do 
> > you avoid the infinite loop in follow_mount? Another magic special case?
> 
> See above.  And yes, I'd love to get a separate dentry (and inode, while
> we are at it).  But I don't see how to do that.
> 
> One note: we might split lookup_mnt() in two functions - one for the
> middle of lookup, another for final (non-triggering) step.

Yes. We don't necessarily even want to trigger the special mountpoint case
at all if we don't need it - which normal usage probably wouldn't ever
trigger. So I agree 100% - that way I think you actually allocate the
vfsmount until somebody really starts doing the "new things". Was that
your plan?

		Linus
