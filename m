From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: handle cnode allocation failure gracefully
Date: Wed, 23 Nov 2005 20:59:18 -0800
Message-ID: <438548A6.1090602@namesys.com>
References: <20051124001606.GA3970@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051124001606.GA3970@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:

> If an external device is used for a journal, by default it will use the
> entire device. The reiserfs journal code allocates structures per journal
> block when it mounts the file system. If the journal device is too large, and
> memory cannot be allocated for the structures, it will continue and ultimately
> panic when it can't pull one off the free list.
>
> This patch handles the allocation failure gracefully and prints an error
> message at mount time.
>
> Changes: Updated error message to be more descriptive to the user.
>
>Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>
>diff -ruNpX dontdiff linux-2.6.13.orig/fs/reiserfs/journal.c linux-2.6.13.fixed/fs/reiserfs/journal.c
>--- linux-2.6.13.orig/fs/reiserfs/journal.c	2005-09-16 11:42:58.000000000 -0400
>+++ linux-2.6.13.fixed/fs/reiserfs/journal.c	2005-11-23 19:14:17.000000000 -0500
>@@ -2757,6 +2757,13 @@ int journal_init(struct super_block *p_s
> 	journal->j_cnode_used = 0;
> 	journal->j_must_wait = 0;
> 
>+	if (journal->j_cnode_free == 0) {
>+        	reiserfs_warning(p_s_sb, "journal-2004: Journal cnode memory "
>+		                 "allocation failed. Journal is too large "
>+				 "for available memory.");
>+        	goto free_and_return;
>+	}
>+
> 	init_journal_hash(p_s_sb);
> 	jl = journal->j_current_jl;
> 	jl->j_list_bitmap = get_list_bitmap(p_s_sb, jl);
>
>  
>
This is better than handling it ungracefully but..... can there be a
memory shortage for some other reason and then this prints the wrong
diagnostic? Forgive me, it is hard to know the answer looking at the
patch by itself.....

Hans
