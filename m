From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: REISER4 corruptions errors
Date: Mon, 26 Jan 2004 18:26:08 +0300
Message-ID: <20040126152607.GB21337@backtop.namesys.com>
References: <16405.7504.491020.659611@laputa.namesys.com> <20040126142528.22476.qmail@web21509.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040126142528.22476.qmail@web21509.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Correnti <paolunix@yahoo.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, REISER LIST <reiserfs-list@namesys.com>

On Mon, Jan 26, 2004 at 06:25:28AM -0800, Paolo Correnti wrote:
> 
> --- Nikita Danilov <Nikita@Namesys.COM> wrote:
> 
> > Well, for all I know, this very well may be a bug in
> > the fsck, rather than corruption of the on-disk data
> > structures. Are
> > you experiencing any
> > problems when _using_ this partition (error messages
> > in the kernel log,
> > crashes, deadlocks, etc.)?
> > 
> 
> I have problems using the "20040119-fixed" partition
> with 2.6.1 (after writing many MB of data, almost
> always I obtain a file corrupted so that Oracle
> doesn't start). With 2.6.0 and 20031223 snapshot I
> have no problems using the "20031223" partition.
> 
> But in both tests I saw that fsck.reiser4 gave me
> from 5 to 35 and more corruptions errors, all of type
> 
> Error: Node (210326), item (7): StatData of the file
> [10001:1616662635f5445:10002] has the wrong bytes
> (3625472), Should be
> (3629056). Plugin (stat40).
> 
> So I was thinking (perhaps strangely ...) that this
> kind of corruption was more dangerous with 2.6.1 +
> 20040119-fixed (I'm speaking about Oracle logfile

I guess it is not a dangerous corruption.  Probaply Oracle does too strong
checks for its log files.  The file content and size should be OK, except
i_blocks and i_bytes fields.  

I think the source of that curruption is in the reiser4 deletion optimization
performed by the cut_tree() routine (inode_sub_bytes() is not called in some
cases).

this patch should help (! not tested):

===== tree.c 1.562 vs edited =====
--- 1.562/tree.c        Wed Jan 14 11:46:20 2004
+++ edited/tree.c       Mon Jan 26 18:24:39 2004
@@ -1468,7 +1468,7 @@
                if ((result != 0) && (result != -E_NO_NEIGHBOR))
                        break;
                /* Check can we delete the node as a whole. */
-               if (iterations && znode_get_level(node) == LEAF_LEVEL &&
+               if (0 && iterations && znode_get_level(node) == LEAF_LEVEL &&
                    UNDER_RW(dk, current_tree, read,
                             keyle(from_key, znode_get_ld_key(node)))) {
                        result = delete_node(next_node_lock.node,


> corrupted after 5 million rows written) than with
> 2.6.0 + 20030123 (which never gave me an Oracle file
> corrupted, also after 10 million rows written).
> 
> I made the same test on 2 different disks so I'm
> almost sure this is not an hardware problem.
> 
> Best regards
> 
> Paolo
> 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free web site building tool. Try it!
> http://webhosting.yahoo.com/ps/sb/

-- 
Alex.
