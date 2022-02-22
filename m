From: Dave Chinner <david@fromorbit.com>
Subject: Re: Is it time to remove reiserfs?
Date: Wed, 23 Feb 2022 09:16:14 +1100
Message-ID: <20220222221614.GC3061737@dread.disaster.area>
References: <YhIwUEpymVzmytdp@casper.infradead.org>
 <20220222100408.cyrdjsv5eun5pzij@quack3.lan>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220222100408.cyrdjsv5eun5pzij@quack3.lan>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Tue, Feb 22, 2022 at 11:04:08AM +0100, Jan Kara wrote:
> Hello!
> 
> On Sun 20-02-22 12:13:04, Matthew Wilcox wrote:
> > Keeping reiserfs in the tree has certain costs.  For example, I would
> > very much like to remove the 'flags' argument to ->write_begin.  We have
> > the infrastructure in place to handle AOP_FLAG_NOFS differently, but
> > AOP_FLAG_CONT_EXPAND is still around, used only by reiserfs.
> > 
> > Looking over the patches to reiserfs over the past couple of years, there
> > are fixes for a few syzbot reports and treewide changes.  There don't
> > seem to be any fixes for user-spotted bugs since 2019.  Does reiserfs
> > still have a large install base that is just very happy with an old
> > stable filesystem?  Or have all its users migrated to new and exciting
> > filesystems with active feature development?
> > 
> > We've removed support for senescent filesystems before (ext, xiafs), so
> > it's not unprecedented.  But while I have a clear idea of the benefits to
> > other developers of removing reiserfs, I don't have enough information to
> > weigh the costs to users.  Maybe they're happy with having 5.15 support
> > for their reiserfs filesystems and can migrate to another filesystem
> > before they upgrade their kernel after 5.15.
> > 
> > Another possibility beyond outright removal would be to trim the kernel
> > code down to read-only support for reiserfs.  Most of the quirks of
> > reiserfs have to do with write support, so this could be a useful way
> > forward.  Again, I don't have a clear picture of how people actually
> > use reiserfs, so I don't know whether it is useful or not.
> > 
> > NB: Please don't discuss the personalities involved.  This is purely a
> > "we have old code using old APIs" discussion.
> 
> So from my distro experience installed userbase of reiserfs is pretty small
> and shrinking. We still do build reiserfs in openSUSE / SLES kernels but
> for enterprise offerings it is unsupported (for like 3-4 years) and the module
> is not in the default kernel rpm anymore.
> 
> So clearly the filesystem is on the deprecation path, the question is
> whether it is far enough to remove it from the kernel completely. Maybe
> time to start deprecation by printing warnings when reiserfs gets mounted
> and then if nobody yells for year or two, we'll go ahead and remove it?

Yup, I'd say we should deprecate it and add it to the removal
schedule. The less poorly tested legacy filesystem code we have to
maintain the better.

Along those lines, I think we really need to be more aggressive
about deprecating and removing filesystems that cannot (or will not)
be made y2038k compliant in the new future. We're getting to close
to the point where long term distro and/or product development life
cycles will overlap with y2038k, so we should be thinking of
deprecating and removing such filesystems before they end up in
products that will still be in use in 15 years time.

And just so everyone in the discussion is aware: XFS already has a
deprecation and removal schedule for the non-y2038k-compliant v4
filesystem format. It's officially deprecated right now, we'll stop
building kernels with v4 support enabled by default in 2025, and
we're removing the code that supports the v4 format entirely in
2030.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
