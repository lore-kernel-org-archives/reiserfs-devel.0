From: dan@ngenllc.com
Subject: Re: Need help recovering lost partitions
Date: Wed, 28 Jan 2004 17:38:47 -0500 (EST)
Message-ID: <20040128143848.27765.h003.c001.wm@mail.ngenllc.com.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: matts@ksu.edu
Cc: reiserfs-list@namesys.com

On Wed, 28 Jan 2004 16:10:48 -0600 (CST), Matt Stegman
wrote:

> 
> You know, I think that unless you remember the
original
> partition
> boundaries, it may be too late now.  I'm sure the
> reason your files
> don't have the right data is that all your data block
> numbers are
> scrambled.
> 
> See, when you created one big partition, that means
> that, for example, the
> data block #45 from /dev/hda2 is now block #23456 in
> your all-disk
> /dev/hda1.  Another data block #45 from /dev/hda3
could
> be now block
> #67890 (or whatever; I'm just throwing out numbers to
> make a point).
> Fsck wouldn't know how to translate block numbers from
> old partitions to
> new ones.
> 
> So you have some file from /dev/hda2 that has data in
> block #45.  Fsck
> picks this up, and recreates the tree, except that
> block #45 is not the
> same block that inode meant.
> 
> If you haven't overwritten the superblocks (or
whatever
> you call the first
> block in the filesystem, the one that contains the
> magic that ideally


So how can I scan the partition for the old
superblocks?  gpart and parted weren't picking them up,
but I know they were there.  And the 6GB of data it
found is much less then the size of the partition
(50GB), which makes me think that some data might still
be there (i.e. only 100 * (6/50) % of the data could
have been overwritten).

-Dan


Dan Anderson
Manager
nGen, LLC.
Phone: (914) 466-8526
Fax: (775)562-2622
Email: dan@ngenllc.com
