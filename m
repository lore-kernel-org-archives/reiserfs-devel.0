From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 13:05:12 +0400
Message-ID: <200509211305.13934.vitaly@namesys.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <1127240326.10407.22.camel@localhost> <20050920211136.GA6179@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750783AbVIUJGM@vger.kernel.org>
In-Reply-To: <20050920211136.GA6179@thunk.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Briggs <jbriggs@esoft.com>, David Masover <ninja@slaphack.com>, Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>

On Wednesday 21 September 2005 01:11, Theodore Ts'o wrote:
> On Tue, Sep 20, 2005 at 12:18:46PM -0600, Jonathan Briggs wrote:
> > 
> > I use Reiser3 and Reiser4 on all my systems and fsck has always worked
> > even if it has been much slower than I would like.  The only problems
> > I've experienced have been on the same level as when an ext2/3
> > filesystem fsck dumps several directories of unlabeled files into lost
> > +found.
> 
> You've obviously never kept several dozen reiserfs filesystem images
> (for use with Xen or User-Mode Linux) on a reiserfs filesystem, and
> then had a hardware failure bad enough that the fsck had to try to
> rebuild the b-tree, I take it?

loop device XOR encryption for your images is the simple solution 
for reiserfs V3.

-- 
Thanks,
Vitaly Fertman
