From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: [some sanity for a change] possible design issues for hybrids
Date: Fri, 27 Aug 2004 05:30:59 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040827043058.GH21964@parcelfarce.linux.theplanet.co.uk>
References: <20040826223625.GB21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261538030.2304@ppc970.osdl.org> <20040826225308.GC21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261619230.2304@ppc970.osdl.org> <20040826234048.GD21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261652240.2304@ppc970.osdl.org> <20040827010147.GE21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261934570.2304@ppc970.osdl.org> <20040827034550.GG21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408262051030.2304@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20872-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408262051030.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 08:57:40PM -0700, Linus Torvalds wrote:
> Can't do that. At least not if you do my plan. 
> 
> Even with a zero refcount, the dentry is still valid, and won't see a new 
> "->lookup()". And since in my scheme the vfsmount is populated only at 
> lookup (and copied later), you can't drop _all_ the vfsmount's. You'd have 
> to at least leave one of them, in order to know how to re-create the 
> others.
> 
> Or do you have a cunning plan?

a) set ->d_mount to 1 and set DCACHE_HYBRID at ->lookup() time
b) in lookup_mnt():
	if (unlikely(dentry has DCACHE_HYBRID)) {
		if (linkely(dentry->d_mount == 1))
			goto New;
	}
	do the normal series of hash lookups
	if (likely(dentry doesn't have DCACHE_HYBRID))
		return;
	if (vfsmount is marked as hybrid && dentry == vfsmount->mnt_dentry)
		return;
New:
	allocate new vfsmount and mark it as hybrid
	attach it on top of our one and go there

Does that qualify as cunning?  With that approach we have nothing non-trivial
to do at lookup time and lookup_mnt() will DTRT with minimal fuss.
 
> Hmm. If you use the same dentry for mnt_root as for mnt_mountpoint, how do 
> you avoid the infinite loop in follow_mount? Another magic special case?

See above.  And yes, I'd love to get a separate dentry (and inode, while
we are at it).  But I don't see how to do that.

One note: we might split lookup_mnt() in two functions - one for the
middle of lookup, another for final (non-triggering) step.
