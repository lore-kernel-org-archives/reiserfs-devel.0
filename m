From: Christoph Hellwig <hch@lst.de>
Subject: Re: [some sanity for a change] possible design issues for hybrids
Date: Fri, 27 Aug 2004 11:00:15 +0200
Message-ID: <20040827090015.GB22093@lst.de>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com> <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua> <Pine.LNX.4.58.0408261132150.2304@ppc970.osdl.org> <20040826191323.GY21964@parcelfarce.linux.theplanet.co.uk> <20040826203228.GZ21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261344150.2304@ppc970.osdl.org> <20040826212853.GA21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408261436480.2304@ppc970.osdl.org> <1093596998.5994.34.camel@imp.csi.cam.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093596998.5994.34.camel@imp.csi.cam.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Altaparmakov <aia21@cam.ac.uk>
Cc: Linus Torvalds <torvalds@osdl.org>, viro@parcelfarce.linux.theplanet.co.uk, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, christer@weinigel.se, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Fri, Aug 27, 2004 at 09:56:39AM +0100, Anton Altaparmakov wrote:
> If it is created on the fly, it should be "easy" to destroy on the fly
> using time-based expiry, i.e. a kernel daemon going over all of those
> beasts every X seconds (X = 5 perhaps?) and doing something like:
> 
> for (each vfsmount) {
> 	lock_vfsmount(vfsmount);
> 	if (MOUNT_IS_BUSY(vfsmount)) {
> 		unlock_vfsmount(vfsmount);
> 		continue;
> 	}
> 	if (current_time() < (vfsmount->last_used_time +
> 			vfsmount->expire_after)) {
> 		unlock_vfsmount(vfsmount);
> 		continue;
> 	}
> 	destroy_locked_vfsmount(vfsmount);
> }
> 
> Wouldn't that work?

That would work for a low number of them.  But with Hans' "visions" we'd
have a damn lot of them at which point this isn't really scalable.

