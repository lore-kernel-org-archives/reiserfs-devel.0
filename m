From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Wed, 8 Mar 2006 16:14:26 -0700
Message-ID: <20060308231426.GI14934@schatzie.adilger.int>
References: <20060301123406.GA20367@atrey.karlin.mff.cuni.cz> <44076975.70609@suse.com> <20060303002917.GD4261@atrey.karlin.mff.cuni.cz> <4407944F.5030206@suse.com> <20060303100407.GF2855@atrey.karlin.mff.cuni.cz> <4408C080.4070600@suse.com> <20060306115926.GL1175@atrey.karlin.mff.cuni.cz> <440DFD7A.9040000@suse.com> <20060308182014.GC14184@atrey.karlin.mff.cuni.cz> <440F2C81.3@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28236-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <440F2C81.3@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Jan Kara <jack@suse.cz>, ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

On Mar 08, 2006  14:12 -0500, Jeff Mahoney wrote:
> Jan Kara wrote:
> >> The internal i/o patches don't support tails, and that's a silver bullet
> >> against this working for xattrs. Most xattrs, such as ACLs, are likley
> >> to be only a few tens of bytes long and allocating an entire block is
> >> extremely wasteful.
> >
> >   Umm, that is really nasty. Ext3 solves this by sharing a block among
> > several inodes but that's far to much work to fix this bug...
> 
> I had considered sharing files, and the code knows to drop a link to a
> shared file when it's changed. That's one of the features I had wanted
> from the beginning but never got around to implementing.

Just FYI, ext3 has recently implemented support for larger inodes exactly
to store small EAs with the inode instead of an external block.  For ACLs
there is some benefit to sharing the block, because the overhead is
amortized over many inodes.  However, virtually all other EA data is
unique per inode and the ext3 EA block sharing only works if ALL the EAs
for an inode are identical, so that isn't very useful if you have anything
other than ACLs to store.

The performance of in-inode EAs is vastly better than external blocks
because of seeks and not wasting 4kB of disk/RAM for 10-100 bytes of EA.

Not sure if this is useful (haven't been following discussion too closely),
but thought I would steer you away from the shared-block idea early.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.

