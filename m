From: "Pillars.NET" <bobvin@pillars.net>
Subject: linux 2.6.0 and reiser4 (patch/bugfix)
Date: Sat, 2 Aug 2003 06:58:53 -0400
Message-ID: <20030802105853.GA30721@pillars.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Resent-To: Reiserfs List <reiserfs-list@namesys.com>
Resent-Message-Id: <E19j2So-0008AZ-00@deer.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Figured out how to use bk to pull in the latest trees from
linux.bkbits.net and bk.namesys.com and merge the two.

Tried compiling a linux 2.6.0-test2 kernel with reiser4 built-in (not
as a module)

Ran into a compile-time error: "undefined reference to _udivdi3",
which is described by one LKML author as "somebody is doing a 64-bit
integer divide without pulling in the relevant gcc library."

Poked around and found in "include/div64.h" a helper function called
"div_long_long_rem" which appears to be custom-made for this type of
problem.

Here's what I changed to make the compiler happy:

root@pillars:/usr/src/linux-2.6.0# diff -u fs/reiser4/plugin/item/ctail.c.orig fs/reiser4/plugin/item/ctail.c
--- ctail.c.orig        2003-08-02 06:53:07.000000000 -0400
+++ fs/reiser4/plugin/item/ctail.c      2003-08-02 06:41:15.000000000 -0400
@@ -55,7 +55,8 @@
 cluster_index_by_coord(const coord_t * coord)
 {
        reiser4_key  key;
-       return get_key_offset(item_key_by_coord(coord, &key)) / cluster_size_by_coord(coord),&rem;
+       unsigned long rem;
+       return div_long_long_rem(get_key_offset(item_key_by_coord(coord, &key)),cluster_size_by_coord(coord),&rem);
 }

 static char *
@@ -764,13 +765,14 @@
 utmost_child_ctail(const coord_t * coord, sideof side, jnode ** child)
 {
        reiser4_key key;
+       long unsigned rem;

        assert("edward-257", coord != NULL);
        assert("edward-258", child != NULL);
        assert("edward-259", side == LEFT_SIDE);
        assert("edward-260", item_plugin_by_coord(coord) == item_plugin_by_id(CTAIL_ID));

-       if (get_key_offset(&key) != cluster_size_by_coord(coord) * (get_key_offset(&key) / cluster_size_by_coord(coord)))
+       if (get_key_offset(&key) != cluster_size_by_coord(coord) * div_long_long_rem(get_key_offset(&key),cluster_size_by_coord(coord),&rem))
                *child = NULL;
        else
                *child = jlook_lock(current_tree, get_key_objectid(item_key_by_coord(coord, &key)), cluster_index_by_coord(coord));

