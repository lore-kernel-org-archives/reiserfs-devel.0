From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-tree crashes
Date: Tue, 16 Mar 2004 13:19:37 +0300
Message-ID: <200403161319.37233.vitaly@namesys.com>
References: <4054D69A.5040308@arcor.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_5StVAWlFQn+8qkb"
Return-path: <reiserfs-list-return-17240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4054D69A.5040308@arcor.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Franz Mueller <fm4@arcor.de>, reiserfs-list@namesys.com

--Boundary-00=_5StVAWlFQn+8qkb
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Franz,

the reiserfsprogs patch attached should cure for your problem.
Email me please about the result.

-- 
Thanks,
Vitaly Fertman

On Monday 15 March 2004 01:03, Franz Mueller wrote:
> Hello reiserfs-Mailinglist,
>
> the latest version of reiserfsck (3.6.13) doesn't help to solve my
> problem. I am using SuSE 9.0 with kernel 2.4.21. When I run
>
> reiserfsck --rebuild-tree -S /dev/hdb4
>
> I get the following error message:
>
> Will rebuild the filesystem (/dev/hdb4) tree
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> Replaying journal..
> 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Sun Mar 14 22:55:09 2004
> ###########
>
> Pass 0:
> ####### Pass 0 #######
> The whole partition (7689110 blocks) is to be scanned
> Skipping 8445 blocks (super block, journal, bitmaps) 7680665 blocks will
> be read
> 0%....20%.block 2008259: The number of items (270) is incorrect, should
> be (169) - corrected
> block 2008259: The free space (0) is incorrect, should be (16) - corrected
> pass0: vpf-10110: block 2008259, item (0): Unknown item type found
> [17235969 0 0xb7c1000 ??? (15)] - deleted
> lbalance.c 1019 leaf_delete_items_entirely
> leaf_delete_items_entirely: bad leaf 2008259: level=1, nr_items=168,
> free_space=40 rdkey
> Abgebrochen
>
> Is there anything else that can be done?
>
> Franz

--Boundary-00=_5StVAWlFQn+8qkb
Content-Type: text/x-diff;
  charset="koi8-r";
  name="fsck_lbalance.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fsck_lbalance.patch"

===== reiserfscore/lbalance.c 1.11 vs edited =====
--- 1.11/reiserfsprogs/reiserfscore/lbalance.c	Mon Jan 26 15:08:41 2004
+++ edited/reiserfscore/lbalance.c	Tue Mar 16 13:14:44 2004
@@ -949,7 +949,8 @@
 	set_dc_child_size (dc, get_dc_child_size (dc) - cut_size);
 	mark_buffer_dirty(bi->bi_parent);
     }
-    if (is_a_leaf(bh->b_data, bh->b_size) != THE_LEAF)
+    if (is_a_leaf(bh->b_data, bh->b_size) != THE_LEAF &&
+	is_a_leaf(bh->b_data, bh->b_size) != HAS_IH_ARRAY)
 	reiserfs_panic ("leaf_cut_from_buffer: bad leaf %lu: %b",
 			bh->b_blocknr, bh);
 }
@@ -1015,7 +1016,8 @@
 	    (j - last_removed_loc + IH_SIZE * del_num));
 	mark_buffer_dirty(bi->bi_parent);
     }
-    if (is_a_leaf(bh->b_data, bh->b_size) != THE_LEAF)
+    if (is_a_leaf(bh->b_data, bh->b_size) != THE_LEAF &&
+	is_a_leaf(bh->b_data, bh->b_size) != HAS_IH_ARRAY)
 	reiserfs_panic ("leaf_delete_items_entirely: bad leaf %lu: %b", bh->b_blocknr, bh);
 }
 

--Boundary-00=_5StVAWlFQn+8qkb--

