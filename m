From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: handle cnode allocation failure gracefully
Date: Mon, 28 Nov 2005 16:42:18 -0800
Message-ID: <438BA3EA.3070207@namesys.com>
References: <20051124001606.GA3970@locomotive.unixthugs.org> <438548A6.1090602@namesys.com> <438B7630.8080903@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <438B7630.8080903@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:

> Hans Reiser wrote:
>
> >Jeff Mahoney wrote:
>
> >>If an external device is used for a journal, by default it will use the
> >>entire device. The reiserfs journal code allocates structures per
> journal
> >>block when it mounts the file system. If the journal device is too
> large, and
> >>memory cannot be allocated for the structures, it will continue and
> ultimately
> >>panic when it can't pull one off the free list.
> >>
> >>This patch handles the allocation failure gracefully and prints an error
> >>message at mount time.
> >>
> >>Changes: Updated error message to be more descriptive to the user.
> >>
> >>Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> >>
> >>diff -ruNpX dontdiff linux-2.6.13.orig/fs/reiserfs/journal.c
> linux-2.6.13.fixed/fs/reiserfs/journal.c
> >>--- linux-2.6.13.orig/fs/reiserfs/journal.c    2005-09-16
> 11:42:58.000000000 -0400
> >>+++ linux-2.6.13.fixed/fs/reiserfs/journal.c    2005-11-23
> 19:14:17.000000000 -0500
> >>@@ -2757,6 +2757,13 @@ int journal_init(struct super_block *p_s
> >>    journal->j_cnode_used = 0;
> >>    journal->j_must_wait = 0;
> >>
> >>+    if (journal->j_cnode_free == 0) {
> >>+            reiserfs_warning(p_s_sb, "journal-2004: Journal cnode
> memory "
> >>+                         "allocation failed. Journal is too large "
> >>+                 "for available memory.");
> >>+            goto free_and_return;
> >>+    }
> >>+
> >>    init_journal_hash(p_s_sb);
> >>    jl = journal->j_current_jl;
> >>    jl->j_list_bitmap = get_list_bitmap(p_s_sb, jl);
> >>
> >>
> >>
> >This is better than handling it ungracefully but..... can there be a
> >memory shortage for some other reason and then this prints the wrong
> >diagnostic? Forgive me, it is hard to know the answer looking at the
> >patch by itself.....
>
>
> Well, the error message is always true. ;) The failure will always be
> because it couldn't allocate enough memory to support the internal
> housekeeping for the journal. However, it's possible for other causes
> than JUST the journal being oversized to cause the allocation failure.
> On x86, the vmalloc area is limited to ~128MB. If other sources
> (including other reiserfs file systems) are taking up most of the
> vmalloc area, it could fail with a standard journal size. When the
> vmalloc limit isn't a factor, memory could simply be unavailable to fill
> the request, even a small one.
>
> In most cases, though, it's a result of allocate_cnodes() asking for too
> much memory. Using the standard 8192 block journal size, a 32-bit system
> will allocate 288K for cnodes. If an external 8 GB partition is used,
> 2*1024*1024 blocks will be needed, causing 72 MB of RAM to be allocated
> for cnodes alone.
>
> I wouldn't be opposed to changing the error message to:
> journal-2004: Journal cnode memory allocation failed (%lu bytes).
> Journal may be too large or your system does not have enough available
> memory.


How about:  Journal is too large for the available memory.  Usually this
is because the journal is too large a device.

>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs

