From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs logging patches udpated
Date: Wed, 24 Mar 2004 20:00:55 -0500
Message-ID: <1080176455.14737.140.camel@watt.suse.com>
References: <1080149399.14737.77.camel@watt.suse.com>
	 <20040324143516.3162cbfe.akpm@osdl.org>
	 <1080168379.14743.124.camel@watt.suse.com>
	 <200403250147.54246.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403250147.54246.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>

On Wed, 2004-03-24 at 19:47, Bernd Schubert wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> > It does, but the code has been in testing -suse and on the reiserfs
> > list.  This dooesn't mean data=ordered is perfect, but it's not quite
> > day one either.  I can switch the default back, but I'd rather have a
> > trial by fire ;-)
> 
> Oh please not, just have a look at german newsgroups, there are real flamewars 
> about the stability of reiserfs. Everytime someone has a disk problem and a 
> reiserfs partion is affected by it, then there are more than a dozen answers 
> that its the fault of reiserfs. PLEASE, don't prove them right.
> 
The code just won't get tested if it isn't turned on.  I think I've got
all the major issues fixed, and I'm sending to -mm to try and prove
that.  When we're all happy with the stability of the patches, they can
go to -linus.

But there are just as many threads about reiserfs not having
data=ordered support.  It's an important feature that has been out of
mainline for far too long.

-chris


