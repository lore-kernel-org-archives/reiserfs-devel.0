From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 15:07:18 +0200
Message-ID: <20040826130718.GB820@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093525234.9004.55.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 03:00:34PM +0200, Christophe Saout wrote:
> Am Donnerstag, den 26.08.2004, 14:49 +0200 schrieb Christoph Hellwig:
> 
> > Now that part is interesting from the how to sell it to non-Linux users
> > POV, but not for the linux kernel.
> 
> Why? The question was what these plugins are exactly. This is the
> answer.

I explained it below..

> > > *And* there are plugins which are users of the "reiser4 client API" and
> > > implement the actual VFS methods.
> > 
> > Here comes the problem.  All the access checking/race avoidance/loop
> > creation avoiced, in short the posix+extension semantics are implemented
> > in the Linux VFS layer.  If you want to allow a second access method
> > (e.g. Hans' pet syscall) you'd have to duplicate all VFS functioanlity
> > inside reiser4.
> 
> Are you actually listening? If you implement a filesystem there's a
> place where you have to implement the Linux VFS methods. I'm talking
> about inode_operations and these things. This has nothing to do with
> doing anything outside the Linux VFS. And I'm not talking about these
> metas either. These really don't belong inside the filesystem.

as I wrote in this mail this absolutely _does_ belong in the filesystem,
it's a major part of it and isn't easily separatable.

> > So if you want to provide an additional API you'll have to go through
> > the VFS to get it right - ergo a plugin architecture for upper plugins
> > is worthless.
> 
> See, you didn't listen. ;-)
> 
> The reiser4 core doesn't know about inodes, directories or files. It's
> the glue code between the VFS and the storage layer that does. It's
> implemented as a plugin. This has nothing to do with semantic
> enhancements yet. These should be removed for now and made a 2.7 topic.

Oh yes, it is.  As soon as you use different access methods on an
overlapping set of objects you see exactly the problems I described.

If they don't overlap there's no point for the plugins to start with,
you'll better turn the core into a library that can be used by different
projects then.

