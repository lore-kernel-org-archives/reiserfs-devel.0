From: Jens Benecke <jens@spamfreemail.de>
Subject: data-logging 2.4.23 patches: 1 reject in fs/inode.c in 2.4.25
Date: Thu, 19 Feb 2004 13:40:59 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <c12ap7$vor$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1595003.4nVJyJLnUm"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-16852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart1595003.4nVJyJLnUm
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Chris' data-logging patches do not apply cleanly to 2.4.25, are they being
updated?

I think the fix for inode.c is not very hard but I don't dare to fiddle
around with file system code. ;)

Thank you!


server:linux-2.4.25-r> for X in ../*gz ; do zcat $X | patch -p1 ; done
patching file fs/reiserfs/inode.c
patching file fs/reiserfs/journal.c
patching file fs/buffer.c
Hunk #1 succeeded at 799 with fuzz 1 (offset 64 lines).
patching file fs/jbd/journal.c
patching file include/linux/fs.h
Hunk #1 succeeded at 266 (offset 3 lines).
patching file include/linux/jbd.h
Hunk #1 succeeded at 311 (offset 26 lines).
patching file fs/reiserfs/bitmap.c
patching file fs/reiserfs/journal.c
patching file fs/reiserfs/objectid.c
patching file fs/reiserfs/super.c
patching file fs/reiserfs/ibalance.c
patching file include/linux/reiserfs_fs_sb.h
patching file include/linux/reiserfs_fs.h
patching file fs/reiserfs/Makefile
patching file fs/reiserfs/tail_conversion.c
patching file fs/reiserfs/journal.c
patching file fs/reiserfs/stree.c
patching file fs/reiserfs/namei.c
patching file fs/reiserfs/super.c
patching file fs/reiserfs/file.c
patching file fs/reiserfs/procfs.c
patching file fs/reiserfs/fix_node.c
patching file fs/reiserfs/inode.c
patching file fs/reiserfs/ioctl.c
patching file fs/reiserfs/do_balan.c
patching file fs/buffer.c
Hunk #1 succeeded at 659 (offset 36 lines).
Hunk #2 succeeded at 1112 (offset 36 lines).
Hunk #3 succeeded at 1386 with fuzz 2 (offset 36 lines).
patching file kernel/ksyms.c
Hunk #1 succeeded at 175 with fuzz 2 (offset 3 lines).
patching file include/linux/fs.h
Hunk #1 succeeded at 1214 (offset 4 lines).
Hunk #2 succeeded at 1503 (offset 42 lines).
patching file include/linux/reiserfs_fs_i.h
patching file include/linux/reiserfs_fs_sb.h
patching file include/linux/reiserfs_fs.h
patching file fs/reiserfs/tail_conversion.c
patching file fs/reiserfs/bitmap.c
patching file fs/reiserfs/stree.c
patching file fs/reiserfs/namei.c
patching file fs/reiserfs/super.c
patching file fs/reiserfs/file.c
patching file fs/reiserfs/fix_node.c
patching file fs/reiserfs/inode.c
patching file fs/reiserfs/do_balan.c
patching file include/linux/reiserfs_fs.h
patching file fs/inode.c
Hunk #1 succeeded at 503 (offset 32 lines).
Hunk #2 succeeded at 522 (offset 32 lines).
Hunk #3 succeeded at 787 (offset 33 lines).
Hunk #4 FAILED at 821.
Hunk #5 succeeded at 1285 (offset 92 lines).
Hunk #6 succeeded at 1365 (offset 92 lines).
Hunk #7 succeeded at 1474 (offset 97 lines).
1 out of 7 hunks FAILED -- saving rejects to file fs/inode.c.rej
patching file mm/filemap.c
Hunk #1 succeeded at 3151 with fuzz 1 (offset 325 lines).
Hunk #2 succeeded at 3317 with fuzz 2 (offset 354 lines).


--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic
--nextPart1595003.4nVJyJLnUm
Content-Type: text/x-diff; name="inode.c.rej"
Content-Transfer-Encoding: 8Bit
Content-Disposition: attachment; filename="inode.c.rej"

***************
*** 820,854 ****
  	spin_unlock(&inode_lock);
  
  	dispose_list(freeable);
  
  	/* 
- 	 * If we didn't freed enough clean inodes schedule
- 	 * a sync of the dirty inodes, we cannot do it
- 	 * from here or we're either synchronously dogslow
- 	 * or we deadlock with oom.
  	 */
  	if (goal)
- 		schedule_task(&unused_inodes_flush_task);
  }
  
  int shrink_icache_memory(int priority, int gfp_mask)
  {
  	int count = 0;
- 
- 	/*
- 	 * Nasty deadlock avoidance..
- 	 *
- 	 * We may hold various FS locks, and we don't
- 	 * want to recurse into the FS that called us
- 	 * in clear_inode() and friends..
- 	 */
- 	if (!(gfp_mask & __GFP_FS))
- 		return 0;
- 
  	count = inodes_stat.nr_unused / priority;
- 
  	prune_icache(count);
- 	return kmem_cache_shrink(inode_cachep);
  }
  
  /*
--- 821,849 ----
  	spin_unlock(&inode_lock);
  
  	dispose_list(freeable);
+ 	kmem_cache_shrink(inode_cachep);
  
  	/* 
+ 	 * If we didn't freed enough clean inodes 
+ 	 * start a sync now
  	 */
  	if (goal)
+ 		try_to_sync_unused_inodes();
+ }
+ 
+ void prune_icache(int goal) {
+ 	atomic_add(goal, &kinoded_goal);
+ 	if (atomic_read(&kinoded_goal) > 16) {
+ 		wake_up_interruptible(&kinoded_wait);
+ 	} 
  }
  
  int shrink_icache_memory(int priority, int gfp_mask)
  {
  	int count = 0;
  	count = inodes_stat.nr_unused / priority;
  	prune_icache(count);
+ 	return 0;
  }
  
  /*

--nextPart1595003.4nVJyJLnUm--

