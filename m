From: Chris Mason <mason@suse.com>
Subject: Re: ReiserFS Maximum file size (in practice)
Date: Wed, 19 May 2004 08:57:34 -0400
Message-ID: <1084971454.27142.12.camel@watt.suse.com>
References: <40AA74CA.5040306@suse.com>
	 <1084927507.27142.2.camel@watt.suse.com>  <40AB4F5B.7050109@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40AB4F5B.7050109@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey Mahoney <jeffm@suse.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Wed, 2004-05-19 at 08:13, Jeffrey Mahoney wrote:
> Chris Mason wrote:
> > On Tue, 2004-05-18 at 16:40, Jeff Mahoney wrote:
> > 
> >>Hey all -
> >>
> >>The ReiserFS FAQ that we quote and point people to when they ask 
> >>questions about limits in ReiserFS states that the maxmimum file size 
> >>for a reiserfs v3 filesystem is 2^60-1. However, the actual limits, in 
> >>practice, are far less.
> >>
> >>I tried to create a 3 TB sparse file, and ended up getting told it was 
> >>too large. 2 TB was too large also, just under 2 TB was ok.
> >>
> >>This is a result of super->s_maxbytes = (512LL << 32) - s->s_blocksize;, 
> >>in fs/reiserfs/super.c, which is set so that i_blocks isn't overflowed.
> >>
> >>Other filesystems that have the ability to cross the 2 TB limit on file 
> >>sizes simply ignore the limit and allow i_blocks to wrap. There's really 
> >>no reason we can't do the same.
> >>
> >>The patch is attached.
> > 
> > 
> > Are quotas happy with this?
> 
> They should be, but aren't. The data structures support it. The on-disk 
> quota format doesn't keep track of blocks, it keeps track of bytes. The 
> DQUOT* macros do the translation based on the blocksize in the super. 
> The value to track bytes is a u64, so it should track the increased 
> maximum just fine. As expected, the places were it may get sticky are 
> when i_blocks/i_bytes are referenced. There are several places in the 
> quota code where this is done, but most are just keeping them in line 
> with its view of the world. The values will be appropriately wrong as 
> they are elsewhere after they wrap.
> 
> There is one important place where they're accessed though, and that's 
> in dquot_transfer. inode_get_bytes() is used to obtain the number of 
> bytes to transfer from one quota to another, and if wrapped, will 
> contain a wrong value and the wrong transfer will occur. The 
> infrastructure allows the dq_op->transfer() call to be overridden, but 
> I'm not too wild about copying that function wholesale just to change 
> one line to be something reiserfs specific.
> 
We can probably talk Jan Kara into fixing dquot_transfer, and probably
talk Andrew Morton into allowing a resolution on the inode->i_bytes
mess.  ext2/3 suffer from the same problem (read ext[23]_max_size).

> It seems to me that while we're not allowed to change the st_blocks 
> exported to userspace, we're allowed to change struct inode to reflect 
> the increased block count available in 2.6. We should at least be 
> tracking it correctly internally. Was it simply overlooked when the max 
> file size was increased for the entire system? Currently, i_blocks is an 
> unsigned long which makes it work fine on 64-bit systems. 
> i_blocks/i_bytes are protected by inode->i_lock, so making 32-bit 
> systems use a 64-bit value for i_blocks doesn't introduce any atomicity 
> issues. Other filesystems are wrapping i_blocks as well, but for various 
> reasons, we're just the first to see the quota problem. (JFS doesn't yet 
> support quotas, XFS uses its own implementation)
> 
> The question is if being correct on a case that gets truncated when 
> exported to userspace anyway is worth adding 4 bytes to every inode, 
> when there is a workable option to get around the shortcomings.
> 
I think I'd rather just fix the quota problem right now, it's a smaller
change.

-chris


