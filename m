From: "Serge Kolodeznyh" <mysubscribes@paradigma.ru>
Subject: Re: quota support ?
Date: Tue, 20 Aug 2002 18:24:39 +0400
Message-ID: <01b201c24855$51b19dd0$6501000a@kolodez>
References: <5.1.1.6.2.20020819155611.01ff7af0@pop.tvnet.hu> <20020819195906.A19984@namesys.com> <3D614477.8050500@namesys.com> <m3u1lpx4l0.fsf@merlin.emma.line.org> <3D6211FA.3010500@namesys.com> <20020820101309.GA26839@merlin.emma.line.org> <018401c2484b$3112fbf0$6501000a@kolodez> <20020820171539.A19402@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11254-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Last patch doesn't apllied :-(

[root@helios linux-2.4.19]# gzip -cd kinoded-8-2.4.19-pre3.diff.gz |
patch -p1
patching file fs/inode.c
Hunk #4 FAILED at 698.
Hunk #5 succeeded at 1119 (offset -1 lines).
Hunk #7 succeeded at 1278 (offset -1 lines).
1 out of 7 hunks FAILED -- saving rejects to file fs/inode.c.rej

inode.c.rej:

***************
*** 697,731 ****
   spin_unlock(&inode_lock);

   dispose_list(freeable);

   /*
-   * If we didn't freed enough clean inodes schedule
-   * a sync of the dirty inodes, we cannot do it
-   * from here or we're either synchronously dogslow
-   * or we deadlock with oom.
    */
   if (goal)
-   schedule_task(&unused_inodes_flush_task);
  }

  int shrink_icache_memory(int priority, int gfp_mask)
  {
   int count = 0;
-
-  /*
-   * Nasty deadlock avoidance..
-   *
-   * We may hold various FS locks, and we don't
-   * want to recurse into the FS that called us
-   * in clear_inode() and friends..
-   */
-  if (!(gfp_mask & __GFP_FS))
-   return 0;
-
   count = inodes_stat.nr_unused / priority;
-
   prune_icache(count);
-  kmem_cache_shrink(inode_cachep);
   return 0;
  }

--- 698,729 ----
   spin_unlock(&inode_lock);

   dispose_list(freeable);
+  kmem_cache_shrink(inode_cachep);

   /*
+   * If we didn't freed enough clean inodes
+   * start a sync now
    */
   if (goal)
+         try_to_sync_unused_inodes();
+ }
+
+ void prune_icache(int goal) {
+  if (!atomic_read(&kinoded_goal)) {
+   atomic_set(&kinoded_goal, goal) ;
+   wake_up_interruptible(&kinoded_wait);
+  }
+  /* otherwise, kinoded has already been woken up, move on
+  ** to other caches that might be shrinkable instead of spending time
+  ** waiting for kinoded to make progress
+  */
  }

  int shrink_icache_memory(int priority, int gfp_mask)
  {
   int count = 0;
   count = inodes_stat.nr_unused / priority;
   prune_icache(count);
   return 0;
  }



---
Serge Kolodeznyh
Paradigma AG
Network /system administrator
SVK42-RIPN / SVK33-RIPE

----- Original Message -----
From: "Oleg Drokin" <green@namesys.com>
To: "Serge Kolodeznyh" <mysubscribes@paradigma.ru>
Cc: <reiserfs-list@namesys.com>
Sent: Tuesday, August 20, 2002 5:15 PM
Subject: Re: [reiserfs-list] quota support ?


> Hello!
>
> On Tue, Aug 20, 2002 at 05:12:09PM +0400, Serge Kolodeznyh wrote:
>
> > Who know, will quota support and fs at all be working, if my kernel is
> > 2.4.19 version, and make the patches for quota support from reiserfs
site ?
> > The problem is that reiser's patches are for 2.4.19-pre3, not clean
2.4.19.
>
> This is not a problem. Everything should work fine if applies correctly.
>
> Bye,
>     Oleg
>


