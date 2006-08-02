From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: [nikita-3002]: assertion failed: carry_level_invariant(doing, CARRY_DOING)
Date: Wed, 2 Aug 2006 17:49:29 -0400
Message-ID: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

     Every few weeks reiser4 panics on me, generally while kmail is
receiving emails. Until recently, the panic was "invalid opcode: 0000
[#1]" (previously reported), but I have some new errors:

The first is:
reiser4 panicked cowardly: reiser4[less(7234)]: set_file_state (fs/reiser4/plugin/file/file.c:200)[vs-1162]:
assertion failed: ergo(level == LEAF_LEVEL && cbk_result == CBK_COORD_FOUND, uf_info->container == UF_CONTAINER_TAILS)
Kernel panic - not syncing: reiser4[less(7234)]: set_file_state (fs/reiser4/plugin/file/file.c:200)[vs-1162]:
assertion failed: ergo(level == LEAF_LEVEL && cbk_result == CBK_COORD_FOUND, uf_info->container == UF_CONTAINER_TAILS)

and the second is:
reiser4[patch(25956)]: carry_level_invariant (fs/reiser4/carry.c:1250)[]:
WARNING: wrong key order
reiser4 panicked cowardly: reiser4[patch(25956)]: carry_on_level (fs/reiser4/carry.c:356)[nikita-3002]:
assertion failed: carry_level_invariant(doing, CARRY_DOING)
Kernel panic - not syncing: reiser4[patch(25956)]: carry_on_level (fs/reiser4/carry.c:356)[nikita-3002]:
assertion failed: carry_level_invariant(doing, CARRY_DOING)

Both were for 2.6.18-rc2-mm1 [1]. The second error occurred on a recently fscked filesystem.

[1] with one patch reverted for unrelated reasons.

I hope this helps get to the root of the problem. Unfortunately, I do
not yet have a reproduceable test case.

Andrew Wade
