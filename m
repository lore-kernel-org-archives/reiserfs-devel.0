From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH/URL] reiserfs: reformat code with Lindent
Date: Wed, 13 Jul 2005 01:46:10 +0400
Message-ID: <200507130146.10633.adobriyan@gmail.com>
References: <20050712194220.GA28973@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050712194220.GA28973@locomotive.unixthugs.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tuesday 12 July 2005 23:42, Jeff Mahoney wrote:
>  The ReiserFS code is a mix of a number of different coding styles, sometimes
>  different even from line-to-line. Since the code has been relatively stable
>  for quite some time and there are few outstanding patches to be applied, it
>  is time to reformat the code to conform to the Linux style standard outlined
>  in Documentation/CodingStyle.

>  This patch contains the result of running scripts/Lindent

With -psl picked up.

	-int is_reusable (struct super_block * s, b_blocknr_t block, int bit_value)
	+int
	+is_reusable(struct super_block *s, b_blocknr_t block, int bit_value)

>  against 
>  fs/reiserfs/*.c

patching file fs/reiserfs/item_ops.c
Hunk #1 FAILED at 793.
1 out of 1 hunk FAILED -- saving rejects to file fs/reiserfs/item_ops.c.rej

>  and include/linux/reiserfs_*.h. 

Only fs/reiserfs/*.c part.

$ diffstat -p1 01-reiserfs-lindent.diff
 fs/reiserfs/bitmap.c          | 1932 ++++++-----
 fs/reiserfs/dir.c             |  485 +-
 fs/reiserfs/do_balan.c        | 3229 +++++++++++--------
 fs/reiserfs/file.c            | 2615 ++++++++-------
 fs/reiserfs/fix_node.c        | 4136 ++++++++++++------------
 fs/reiserfs/hashes.c          |  198 -
 fs/reiserfs/ibalance.c        | 1851 +++++------
 fs/reiserfs/inode.c           | 5005 +++++++++++++++---------------
 fs/reiserfs/ioctl.c           |  203 -
 fs/reiserfs/item_ops.c        |   18
 fs/reiserfs/journal.c         | 6994 ++++++++++++++++++++++--------------------
 fs/reiserfs/lbalance.c        | 2232 ++++++-------
 fs/reiserfs/namei.c           | 2637 ++++++++-------
 fs/reiserfs/objectid.c        |  308 -
 fs/reiserfs/prints.c          | 1065 +++---
 fs/reiserfs/procfs.c          |  751 ++--
 fs/reiserfs/resize.c          |  208 -
 fs/reiserfs/stree.c           | 3488 ++++++++++----------
 fs/reiserfs/super.c           | 3751 +++++++++++-----------
 fs/reiserfs/tail_conversion.c |  467 +-
 fs/reiserfs/xattr.c           | 2148 ++++++------
 fs/reiserfs/xattr_acl.c       |  632 +--
 fs/reiserfs/xattr_security.c  |   53
 fs/reiserfs/xattr_trusted.c   |   69
 fs/reiserfs/xattr_user.c      |   88
 25 files changed, 23412 insertions(+), 21151 deletions(-)
