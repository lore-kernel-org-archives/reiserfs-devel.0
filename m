From: <doiggl@velocitynet.com.au>
Subject: Which patches can be applied on top of reiser4-for-3.15.1.patch.gz
Date: Wed, 20 Aug 2014 17:42:52 +1000
Message-ID: <f6e6b313d9543ba6a1ad9a5707637dc8@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

Which patches can be applied on top of reiser4-for-3.15.1.patch.gz
2014-08-09 616.4 kB 
I see this listing[1]  [sorted by date] in
http://www.spinics.net/lists/reiserfs-devel/maillist.html
Thanks Glenn

[1] long patch listing based on date.
extracted via  # grep -i PATCHv listing.txt  | grep -i reiser4:| more

Re: [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl):
initial implementation.
[RFC] [PATCHv3 9/9] reiser4: batch discard support: honor minimal extent
length passed from the userspace.
[RFC] [PATCHv3 8/9] reiser4: block_alloc: add a "min_len" parameter to
reiser4_blocknr_hint to limit allocated extent length from below.
[RFC] [PATCHv3 7/9] reiser4: batch discard support: actually implement the
FITRIM ioctl handler.
[RFC] [PATCHv3 6/9] reiser4: batch discard support: add a dummy FITRIM
ioctl handler for directories.
[RFC] [PATCHv3 5/9] reiser4: txnmgr: call reiser4_post_write_back_hook()
also for empty atoms.
[RFC] [PATCHv3 4/9] reiser4: txnmgr: add reiser4_create_atom() which
creates an empty atom without capturing any nodes.
[RFC] [PATCHv3 3/9] reiser4: txnmgr: free allocated but unneeded atom in
atom_begin_and_assign_to_txnh().
[RFC] [PATCHv3 2/9] reiser4: block_alloc: add a "forward" parameter to
reiser4_blocknr_hint to allocate blocks only in forward direction.
[RFC] [PATCHv3 1/9] reiser4: block_alloc: add BA_SOME_SPACE flag for
grabbing a fixed amount of space.
[RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl): initial
implementation.
Re: [RFC] [PATCHv2 0/7] reiser4: batch discard support (FITRIM ioctl):
initial implementation.
Re: [RFC] [PATCHv2 0/7] reiser4: batch discard support (FITRIM ioctl):
initial implementation.
[RFC] [PATCHv2 7/7] reiser4: batch discard support: actually implement the
FITRIM ioctl handler.
[RFC] [PATCHv2 6/7] reiser4: batch discard support: add a dummy FITRIM
ioctl handler for directories.
[RFC] [PATCHv2 5/7] reiser4: txnmgr: call reiser4_post_write_back_hook()
also for empty atoms.
[RFC] [PATCHv2 4/7] reiser4: txnmgr: add reiser4_create_atom() which
creates an empty atom without capturing any nodes.
[RFC] [PATCHv2 3/7] reiser4: txnmgr: free allocated but unneeded atom in
atom_begin_and_assign_to_txnh().
[RFC] [PATCHv2 2/7] reiser4: block_alloc: add a "forward" parameter to
reiser4_blocknr_hint to allocate blocks only in forward direction.
[RFC] [PATCHv2 1/7] reiser4: block_alloc: add BA_SOME_SPACE flag for
grabbing a fixed amount of space.
[RFC] [PATCHv2 0/7] reiser4: batch discard support (FITRIM ioctl): initial
implementation.
Re: [PATCHv2 0/3] reiser4: discard support: perform discard before all
deallocations.
Re: [PATCHv2 0/3] reiser4: discard support: perform discard before all
deallocations.
Re: [PATCHv7 0/6] reiser4: discard support: simplified and race-free
initial implementation.
[PATCHv7 6/6] reiser4: discard support: initial implementation using
blocknr_list, without extent padding.
[PATCHv7 5/6] reiser4: blocknr_set: use kmem_cache instead of kmalloc for
allocating entries.
[PATCHv7 3/6] reiser4: add an implementation of "block lists", splitted
off the discard code.
[PATCHv7 4/6] reiser4: blocknr_list: use kmem_cache instead of kmalloc for
allocating entries.
[PATCHv7 2/6] reiser4: make space_allocator's check_blocks() reusable.
[PATCHv7 1/6] reiser4: fix reiser4_post_{commit,write_back}_hook() and
their invocations.
[PATCHv7 0/6] reiser4: discard support: simplified and race-free initial
implementation.
Re: [PATCHv2 0/3] reiser4: discard support: perform discard before all
deallocations.
Re: [PATCHv2 0/3] reiser4: discard support: perform discard before all
deallocations.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
[PATCHv2 3/3] reiser4: discard support: perform discard before all
deallocations.
[PATCHv2 2/3] reiser4: discard support: use reiser4_post_write_back_hook()
for discarding and completing deferred deallocations.
[PATCHv2 1/3] reiser4: fix reiser4_post_{commit,write_back}_hook() and
their invocations.
[PATCHv2 0/3] reiser4: discard support: perform discard before all
deallocations.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
[PATCHv6 5/5] reiser4: blocknr_set: use kmem_cache instead of kmalloc for
allocating entries.
[PATCHv6 4/5] reiser4: blocknr_list: use kmem_cache instead of kmalloc for
allocating entries.
[PATCHv6 3/5] reiser4: discard support: initial implementation using
linked lists.
[PATCHv6 2/5] reiser4: add an implementation of "block lists", splitted
off the discard code.
[PATCHv6 1/5] reiser4: make space_allocator's check_blocks() reusable.
[PATCHv6 0/5] reiser4: discard support: initial implementation.
Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation,
refactored.
Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation,
refactored.
Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation,
refactored.
Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation,
refactored.
Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation,
refactored.
[RFC] [PATCHv5 1/4] reiser4: make space_allocator's check_blocks()
reusable.
[RFC] [PATCHv5 3/4] reiser4: add reiser4_debug(): a conditional equivalent
of reiser4_log().
[RFC] [PATCHv5 4/4] reiser4: discard support: initial implementation using
linked lists.
[RFC] [PATCHv5 2/4] reiser4: add an implementation of "block lists",
splitted off the discard code.
[RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation,
refactored.
[RFC] [PATCHv4 4/4] reiser4: discard support: enable discard functionality
through a mount option.
[RFC] [PATCHv4 3/4] reiser4: discard support: initial implementation using
extent lists.
[RFC] [PATCHv4 1/4] reiser4: discard support: make space_allocator's
check_blocks() reusable.
[RFC] [PATCHv4 2/4] reiser4: add reiser4_debug(): a conditional equivalent
of reiser4_log().
[RFC] [PATCHv4 0/4] reiser4: discard support: initial implementation.
[RFC] [PATCHv3 5/5] reiser4: discard support: downgrade all reiser4_log()
to reiser4_debug().
[RFC] [PATCHv3 4/5] reiser4: discard support: add assertions to all code
written within this feature.
[RFC] [PATCHv3 3/5] reiser4: discard support: enable discard functionality
through a mount option.
[RFC] [PATCHv3 2/5] reiser4: discard support: initial implementation using
extent lists.
[RFC] [PATCHv3 1/5] reiser4: discard support: make space_allocator's
check_blocks() reusable.
[RFC] [PATCHv3 0/5] reiser4: discard support: initial implementation.
Re: [RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.
Re: [RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.
[PATCHv2] reiser4: fix an assertion broken since 3.11.
Re: [RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.
[RFC] [PATCHv2 5/5] reiser4: discard support: downgrade all reiser4_log()
to reiser4_debug().
[RFC] [PATCHv2 4/5] reiser4: discard support: add assertions to all code
written within this feature.
[RFC] [PATCHv2 3/5] reiser4: discard support: enable discard functionality
through a mount option.
[RFC] [PATCHv2 2/5] reiser4: discard support: initial implementation using
extent lists.
[RFC] [PATCHv2 1/5] reiser4: discard support: make space_allocator's
check_blocks() reusable.
[RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.

