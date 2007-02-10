From: squadra <jg@internetx.de>
Subject: Re: [patch] reiser4-for-2.6.20
Date: Fri, 9 Feb 2007 23:26:04 -0800 (PST)
Message-ID: <8898527.post@talk.nabble.com>
References: <20070205030106.GA10122@efil.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20070205030106.GA10122@efil.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi 

i m getting lots of errormessages with the 2.6.20 patch, it looks to me like
they start when i copy files from  a reiser4 partition, to a ext3.

Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83

 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488

Call Trace:
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83

 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483

Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff80209b2e>] system_call+0x7e/0x83

 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff88094247>] :reiser4:save_unix_sd+0x5a/0x69
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8808772e>] :reiser4:write_unix_file+0x413/0x488
 [<ffffffff8027a787>] vfs_write+0xad/0x156
 [<ffffffff8027ad29>] sys_write+0x45/0x6e
 [<ffffffff80209b2e>] system_call+0x7e/0x83


Call Trace:
 [<ffffffff8805099f>] :ext3:ext3_write_inode+0x22/0x40
 [<ffffffff80293594>] __writeback_single_inode+0x225/0x3be
 [<ffffffff88072ff1>] :reiser4:flush_some_atom+0x45c/0x483
 [<ffffffff8807e6c4>] :reiser4:reiser4_writeout+0xe8/0x171
 [<ffffffff80293a92>] generic_sync_sb_inodes+0x1dc/0x2ca
 [<ffffffff80293f3e>] writeback_inodes+0x6e/0xb8
 [<ffffffff8025bbbe>] balance_dirty_pages_ratelimited_nr+0x132/0x221
 [<ffffffff8807bc2b>] :reiser4:reiser4_delete_inode+0x0/0xc1
 [<ffffffff8806ebff>] :reiser4:reiser4_exit_context+0x70/0x115
 [<ffffffff8028b3f2>] generic_delete_inode+0x75/0xeb
 [<ffffffff8028310e>] do_unlinkat+0xd5/0x14b
 [<ffffffff8028d299>] mntput_no_expire+0x19/0x73
 [<ffffffff80278abe>] filp_close+0x5d/0x65
 [<ffffffff80209b2e>] system_call+0x7e/0x83


greetings

Juergen

Ingo Bormuth wrote:
> 
> 
> Please find my reiser4 patch for 2.6.20 at
> 
>    http://public.efil.de/reiser4-for-2.6.20-0.patch.gz
> 
> 
> See attachment for changes versus 2.6.19.2 from [1]
> 
> I don't use cryptocompress and kindly ask you to confirm
> 'cancel_dirty_page(clust->pages[i], PAGE_CACHE_SIZE);'
> in plugin/file/cryptcompress.c, line 1303. As far as I understand
> forget_cluster_pages is only called _after_ the cluster's pages have
> successfully been flushed. That would make for case (b) in [2].
> 
> 
> [1]
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.19/reiser4-for-2.6.19-2.patch.gz
> [2]
> http://www2.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=fba2591bf4e418b6c3f9f8794c9dd8fe40ae7bd9
> 
> 
> 
> -- 
> Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
> public key 86326EC9, http://ibormuth.efil.de/contact
> 
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/entd.c
> new-linux-2.6.20-reiser4/fs/reiser4/entd.c
> --- linux-2.6.20-reiser4/fs/reiser4/entd.c	2007-02-05 01:55:43.000000000
> +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/entd.c	2007-02-05
> 01:47:42.000000000 +0100
> @@ -14,13 +14,12 @@
>  #include "page_cache.h"
>  #include "inode.h"
>  
> -#include <linux/sched.h>	/* struct task_struct */
> +#include <linux/freezer.h>
>  #include <linux/suspend.h>
>  #include <linux/kernel.h>
>  #include <linux/writeback.h>
>  #include <linux/time.h>		/* INITIAL_JIFFIES */
>  #include <linux/backing-dev.h>	/* bdi_write_congested */
> -#include <linux/wait.h>
>  #include <linux/kthread.h>
>  
>  #define DEF_PRIORITY 12
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/flush_queue.c
> new-linux-2.6.20-reiser4/fs/reiser4/flush_queue.c
> --- linux-2.6.20-reiser4/fs/reiser4/flush_queue.c	2007-02-05
> 01:55:43.000000000 +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/flush_queue.c	2007-02-05
> 01:30:45.000000000 +0100
> @@ -107,7 +107,7 @@
>  }
>  
>  /* slab for flush queues */
> -static kmem_cache_t *fq_slab;
> +static struct kmem_cache *fq_slab;
>  
>  /**
>   * reiser4_init_fqs - create flush queue cache
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/fsdata.c
> new-linux-2.6.20-reiser4/fs/reiser4/fsdata.c
> --- linux-2.6.20-reiser4/fs/reiser4/fsdata.c	2007-02-05 01:55:43.000000000
> +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/fsdata.c	2007-02-05
> 01:30:45.000000000 +0100
> @@ -5,7 +5,7 @@
>  #include "inode.h"
>  
>  /* cache or dir_cursors */
> -static kmem_cache_t *d_cursor_cache;
> +static struct kmem_cache *d_cursor_cache;
>  static struct shrinker *d_cursor_shrinker;
>  
>  /* list of unused cursors */
> @@ -594,7 +594,7 @@
>  }
>  
>  /* slab for reiser4_dentry_fsdata */
> -static kmem_cache_t *dentry_fsdata_cache;
> +static struct kmem_cache *dentry_fsdata_cache;
>  
>  /**
>   * reiser4_init_dentry_fsdata - create cache of dentry_fsdata
> @@ -661,7 +661,7 @@
>  }
>  
>  /* slab for reiser4_file_fsdata */
> -static kmem_cache_t *file_fsdata_cache;
> +static struct kmem_cache *file_fsdata_cache;
>  
>  /**
>   * reiser4_init_file_fsdata - create cache of reiser4_file_fsdata
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/jnode.c
> new-linux-2.6.20-reiser4/fs/reiser4/jnode.c
> --- linux-2.6.20-reiser4/fs/reiser4/jnode.c	2007-02-05 01:55:43.000000000
> +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/jnode.c	2007-02-05
> 01:30:46.000000000 +0100
> @@ -123,7 +123,7 @@
>  #include <linux/fs.h>		/* for struct address_space  */
>  #include <linux/writeback.h>	/* for inode_lock */
>  
> -static kmem_cache_t *_jnode_slab = NULL;
> +static struct kmem_cache *_jnode_slab = NULL;
>  
>  static void jnode_set_type(jnode * node, jnode_type type);
>  static int jdelete(jnode * node);
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/ktxnmgrd.c
> new-linux-2.6.20-reiser4/fs/reiser4/ktxnmgrd.c
> --- linux-2.6.20-reiser4/fs/reiser4/ktxnmgrd.c	2007-02-05
> 01:55:43.000000000 +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/ktxnmgrd.c	2007-02-05
> 01:48:14.000000000 +0100
> @@ -29,12 +29,11 @@
>  #include "super.h"
>  #include "reiser4.h"
>  
> -#include <linux/sched.h>	/* for struct task_struct */
> -#include <linux/wait.h>
>  #include <linux/suspend.h>
>  #include <linux/kernel.h>
>  #include <linux/writeback.h>
>  #include <linux/kthread.h>
> +#include <linux/freezer.h>
>  
>  static int scan_mgr(struct super_block *);
>  
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/plugin/file/cryptcompress.c
> new-linux-2.6.20-reiser4/fs/reiser4/plugin/file/cryptcompress.c
> --- linux-2.6.20-reiser4/fs/reiser4/plugin/file/cryptcompress.c	2007-02-05
> 01:55:43.000000000 +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/plugin/file/cryptcompress.c
> 2007-02-05 01:21:48.000000000 +0100
> @@ -1300,7 +1300,7 @@
>  		lock_page(clust->pages[i]);
>  		if (PageDirty(clust->pages[i])) {
>  			assert("edward-1277", PageUptodate(clust->pages[i]));
> -			test_clear_page_dirty(clust->pages[i]);
> +			cancel_dirty_page(clust->pages[i], PAGE_CACHE_SIZE);
>  		}
>  #if REISER4_DEBUG
>  		else
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/plugin/plugin_set.c
> new-linux-2.6.20-reiser4/fs/reiser4/plugin/plugin_set.c
> --- linux-2.6.20-reiser4/fs/reiser4/plugin/plugin_set.c	2007-02-05
> 01:55:43.000000000 +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/plugin/plugin_set.c	2007-02-05
> 01:30:45.000000000 +0100
> @@ -31,7 +31,7 @@
>  #include <linux/stddef.h>
>  
>  /* slab for plugin sets */
> -static kmem_cache_t *plugin_set_slab;
> +static struct kmem_cache *plugin_set_slab;
>  
>  static spinlock_t plugin_set_lock[8] __cacheline_aligned_in_smp = {
>  	[0 ... 7] = SPIN_LOCK_UNLOCKED
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/super.h
> new-linux-2.6.20-reiser4/fs/reiser4/super.h
> --- linux-2.6.20-reiser4/fs/reiser4/super.h	2007-02-05 01:55:43.000000000
> +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/super.h	2007-02-05
> 01:30:46.000000000 +0100
> @@ -444,7 +444,7 @@
>  void print_fs_info(const char *prefix, const struct super_block *);
>  #endif
>  
> -extern void destroy_reiser4_cache(kmem_cache_t **);
> +extern void destroy_reiser4_cache(struct kmem_cache **);
>  
>  extern struct super_operations reiser4_super_operations;
>  extern struct export_operations reiser4_export_operations;
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/super_ops.c
> new-linux-2.6.20-reiser4/fs/reiser4/super_ops.c
> --- linux-2.6.20-reiser4/fs/reiser4/super_ops.c	2007-02-05
> 01:55:43.000000000 +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/super_ops.c	2007-02-05
> 01:30:46.000000000 +0100
> @@ -14,7 +14,7 @@
>  #include <linux/debugfs.h>
>  
>  /* slab cache for inodes */
> -static kmem_cache_t *inode_cache;
> +static struct kmem_cache *inode_cache;
>  
>  static struct dentry *reiser4_debugfs_root = NULL;
>  
> @@ -27,7 +27,7 @@
>   * Initialization function to be called when new page is allocated by
> reiser4
>   * inode cache. It is set on inode cache creation.
>   */
> -static void init_once(void *obj, kmem_cache_t *cache, unsigned long
> flags)
> +static void init_once(void *obj, struct kmem_cache *cache, unsigned long
> flags)
>  {
>  	reiser4_inode_object *info;
>  
> @@ -595,7 +595,7 @@
>  	.next = NULL
>  };
>  
> -void destroy_reiser4_cache(kmem_cache_t **cachep)
> +void destroy_reiser4_cache(struct kmem_cache **cachep)
>  {
>  	BUG_ON(*cachep == NULL);
>  	kmem_cache_destroy(*cachep);
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/txnmgr.c
> new-linux-2.6.20-reiser4/fs/reiser4/txnmgr.c
> --- linux-2.6.20-reiser4/fs/reiser4/txnmgr.c	2007-02-05 01:55:43.000000000
> +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/txnmgr.c	2007-02-05
> 01:30:46.000000000 +0100
> @@ -90,7 +90,7 @@
>     For actually implementing these out-of-system-call-scopped
> transcrashes, the
>     reiser4_context has a "txn_handle *trans" pointer that may be set to
> an open
>     transcrash.  Currently there are no dynamically-allocated
> transcrashes, but there is a
> -   "kmem_cache_t *_txnh_slab" created for that purpose in this file.
> +   "struct kmem_cache *_txnh_slab" created for that purpose in this file.
>  */
>  
>  /* Extending the other system call interfaces for future transaction
> features:
> @@ -279,9 +279,9 @@
>  
>  /* FIXME: In theory, we should be using the slab cache init & destructor
>     methods instead of, e.g., jnode_init, etc. */
> -static kmem_cache_t *_atom_slab = NULL;
> +static struct kmem_cache *_atom_slab = NULL;
>  /* this is for user-visible, cross system-call transactions. */
> -static kmem_cache_t *_txnh_slab = NULL;
> +static struct kmem_cache *_txnh_slab = NULL;
>  
>  /**
>   * init_txnmgr_static - create transaction manager slab caches
> diff -Nru linux-2.6.20-reiser4/fs/reiser4/znode.c
> new-linux-2.6.20-reiser4/fs/reiser4/znode.c
> --- linux-2.6.20-reiser4/fs/reiser4/znode.c	2007-02-05 01:55:43.000000000
> +0100
> +++ new-linux-2.6.20-reiser4/fs/reiser4/znode.c	2007-02-05
> 01:30:46.000000000 +0100
> @@ -196,7 +196,7 @@
>  #undef KMALLOC
>  
>  /* slab for znodes */
> -static kmem_cache_t *znode_cache;
> +static struct kmem_cache *znode_cache;
>  
>  int znode_shift_order;
>  
> 
>  
> 

-- 
View this message in context: http://www.nabble.com/-patch--reiser4-for-2.6.20-tf3172392.html#a8898527
Sent from the ReiserFS - General mailing list archive at Nabble.com.

