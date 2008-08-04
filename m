From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Todo for inclusion (updated 05 Aug 2008)
Date: Tue, 05 Aug 2008 03:35:32 +0400
Message-ID: <48979244.3040903@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080001090607010703040901"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>
Cc: Ryan Hope <rmh3093@gmail.com>

This is a multi-part message in MIME format.
--------------080001090607010703040901
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

           Todo for inclusion (updated 05 Aug 2008)


The updated todo-list initially composed by Akpm is attached.
It makes sense to try to address the following items
(complexity is increased):

#10,11: Cleanups.

#3 There is a pending patch to review/merge:
http://marc.info/?l=reiserfs-devel&m=119316601418489&w=2

#9: I don't see any leaked jref there. Perhaps we need to rewrite this
portion of code to make it more clear.

#14 needs to be addressed.

--------------080001090607010703040901
Content-Type: text/plain;
 name="todo_for_inclusion_cached"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="todo_for_inclusion_cached"

Tasks are needed to done for getting reiser4 code into the kernel as found by AKPM in 2.6.18-rc2-mm1 (# means that an issue is done)

   1. - running igrab() in the writepage() path is really going to hammer inode_lock. Something else will need to be done here.
   2. The preferred way of solving the above would be to mark the page as

      PageWriteback() with set_page_writeback() prior to unlocking it. That'll pin the page and the inode. It does require that the page actually get written later on. If we cannot do that then more thought is needed.
   3. If poss, use wake_up_process() rather than wake_up(). That'll save some locking.
   4. Running iput() in entd() is a bit surprising. iirc there are various ways in which this can recur into the filesystem, perform I/O, etc. I guess it works.. But again, it will hammer inode_lock.
   5. the writeout logic in entd_flush() is interesting (as in "holy cow"). It's very central and really needs some good comments describing what's going on in there - what problems are being solved, which decisions were taken and why, etc. The big comment in page_cache.c is useful. Please maintain it well. Boy, it has some old stuff in it.
   6. reiser4_wait_page_writeback() needs commenting.
   7. reading the comment in txnmgr.c regarding MAP_SHARED pages: a number of things have changed since then. We have page-becoming-writeable notifications and probably soon we'll always take a pagefault when a MAP_SHARED page transitions from pte-clean to pte-dirty (although I wouldn't recommend that a filesystem rely upon the latter for a while yet).
   8. page_cache.c: yes, mpage_end_io_write() and mpage_end_io_read() are pretty generic - we might as well export them.
   9. truncate_jnodes_range() looks wrong to me. When we populate gang[], there can be any number of NULL entries placed in it. But the loop which iterates across the now-populated gang[] will bale out when it its the _first_ NULL entry. Any following entries will have a leaked jref() against them.
  10. Waaaaaaaaaaaaaaay too many typedefs.
  11. There are many coding-style nits. One I will mention is very large number of unneeded braces:
          * if (foo) {
                o bar(); 
            } 
      it'd be nice to fix these up sometime. Note: Easy to find and repair with checkpatch.pl script found at

      http://www.kernel.org/pub/linux/kernel/people/apw/checkpatch/
  12. General comment: the lack of support for extended attributes, access control lists and direct-io is a big problem and it's getting bigger. I don't see how a vendor could support reiser4 without these features and permanent lack of vendor support will hurt. What's the plan here?
  13. (from CH)

      Another issue is the lack of support for blocksize < pagesize. This prevents it from being used across architectures. Even worse when I tried the last time it didn't allow me to create a 64k blocksize filesystem that I could actually test on ppc64.
  14.

      set_page_dirty_internal() pokes around in VFS internals. Use
          *

            set_page_dirty_no_buffers() or create a new library function in mm/page-writeback.c. In particular, it gets the radix-tree dirty tagging out of sync. 
  15.

      #wbq.sem should be using a completion for the "wait until entd finishes", not a semaphore. Because there's a teeny theoretical race when using semaphores this way which completions were designed to avoid. (The waker can still be playing with the semaphore when it has gone out of scope on the wakee's stack).
  16.

      #write_page_by_ent(): the "spin until entd thread" thing is gross. This function is really lock-intensive.
  17.

      #entd_flush(): bug:
          *

            rq->wbc->range_start = rq->page->index << PAGE_CACHE_SHIFT; 

      this can overflow on 32-bit. Need to cast rq->page->index to loff_t.
  18.

      #writeout() is a poor name for a global function. Even things like "txn_restart" are a bit generic-sounding. Low-risk, but the kernel's getting bigger... If it were mine, I'd prefix all these symbols with "r4_". prepare_to_sleep(), page_io(), drop_page(), statfs_type(), pre_commit_hook(), etc, etc, etc, etc. Much namespace pollution.
  19.

      #invalidate_list() is a poorly-chosen global identifier. We already have an invalidate_list() in fs/inode.c, too. Please audit all of reiser4's global identifiers (use nm *.o) for suitable naming choices.
  20.

      #- semaphores are deprecated. Please switch to mutexes and/or completions where appropriate and possible.
  21.

      #drop_page() is a worry. Why _does_ reiser4 need to remove pages from pagecache? That isn't a filesystem function. drop_page() appears to leave the no-longer-present page tagged as dirty in the radix-tree.
  22.

      #reiser4_invalidate_pages() is a mix of reiser4 things and of things-which-the-vfs-is-supposed-to-do. It is uncommented and I am unable to work out why it was necessary to do this, and hence what we can do about it.
  23.

      #reiser4_readpages() shouldn't need to clean up the remaining pages on *pages. read_cache_pages() does that now.
  24.

      #<wonders what formatted and unformatted nodes are> A brief glossary might help.
  25.

      #REISER4_ERROR_CODE_BASE actually overlaps real errnos (see include/linux/errno.h). Suggest that it be changed to 1000000 or something.
  26.

      #blocknr_set_add() modifies a list_head without any apparent locking. Certainly without any _documented_ locking... Ditto blocknr_set_destroy(). I'm sure there's locking, but it's harder than it should be to work out what it is. Given that proper locking is in place, the filesystem seems to use list_*_careful() a lot more than is necessary?
  27.

      #It would be clearer to remove `struct blocknr_set' and just use list_head. 

Last update: 02/06/2007

Reiser4/ToDo (last edited 2007-11-25 21:57:14 by M9132)

--------------080001090607010703040901--
