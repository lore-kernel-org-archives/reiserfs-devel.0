From: Anders Widman <andewid@tnonline.net>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Mon, 25 Nov 2002 15:59:19 +0100
Message-ID: <18368598046.20021125155919@tnonline.net>
References: <20021125143634.GC9006@mail.cekit.cz>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021125143634.GC9006@mail.cekit.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hello,
> my setup:
> linux 2.4.18 SMP, HW RAID5, nearly full 240GB reiserfs of mostly small files,
> reiserprogs 3.6.4.

> After some power outages (but this is only my opinion, that this
> caused of our problems), our array run into situation when
> parts of filesystem structure were broken (it seemed so, but were still
> usable):

> Nov 23 22:24:55 zeus kernel: vs-13070: reiserfs_read_inode2: i/o failure
> occurred trying to find stat data of [9221389 9221390 0x0 SD] 
> Nov 23 22:24:55 zeus kernel: is_tree_node: node level 12664 does not
> match to the expected one 1 
> Nov 23 22:24:55 zeus kernel: vs-5150:
> search_by_key: invalid format found in block 56940122. Fsck? 

> So I've started filesystem check with these results:
> node (3117838) with wrong level (0) found in the tree (should be 1)
> whole subtree skipped
> node (56940122) with wrong level (12664) found in the tree (should be 1)
> whole subtree skipped
> free block count 41569 mismatches with a correct one 43484. 
> on-disk bitmap does not match to the correct one. 

> With advice to run --rebuild-tree.
> But after 16 hours of running it, it is still on 0% and whole process 
> would take about 1 month to complete (started at 2000 blocks/sec, 
> but now running at 26b/s).

Have  had  this  kind of problems when there were read-errors on disk.
Try  checking  with  badblocks,  or  Drive Fitness Tool from your disk
vendor (Such as Maxtor PowerMax, IBM DFT, etc).


> My question is: is there any way how to speed up filesystem restore?
> I still believe, that problem is not in hardware and data is recoverable.

> We are ready to pay for support if it can help in same way.

