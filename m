From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: SuSe 9.3 kernel 2.6.11.4-21.11-smp warning: vs-8115:
	get_num_ver: not directory or indirect item error
Date: Mon, 17 Jul 2006 00:02:12 +0400
Message-ID: <1153080132.6265.38.camel@tribesman.namesys.com>
References: <1152904584.24048.5.camel@serpent.office.seatab.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-VzdbVlLhUSPYzs7DkS+B"
Return-path: <reiserfs-list-return-29017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152904584.24048.5.camel@serpent.office.seatab.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Brad Dameron <brad@seatab.com>
Cc: reiserfs-list@namesys.com

--=-VzdbVlLhUSPYzs7DkS+B
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Fri, 2006-07-14 at 12:16 -0700, Brad Dameron wrote:
> I am seeing a lot of these errors:
> 
> ReiserFS: sda7: warning: vs-8115: get_num_ver: not directory or indirect
> item
> 

it is just interesting case. I think that this warning can be removed if
everything works normally.

But, would you, please, apply the attached patch and reproduce this
warning and send me kernel output so that I can see the case which was
considered impossible.

> I did a google search and all I see is emails back from 2004/2005 about
> it being a issue with the 2.6.8 kernel. Are these warnings something I
> should run reiserfsck on the partition to correct or something I should
> ignore? This is on a production server and I would hate to lose the
> data.
> 
> Thanks,
> Brad Dameron
> SeaTab Software
> www.seatab.com
> 
> 
> 

--=-VzdbVlLhUSPYzs7DkS+B
Content-Description: 
Content-Disposition: inline; filename=reiserfs-debug.patch
Content-Type: text/x-patch; charset=utf-8
Content-Transfer-Encoding: 7bit


diff -puN fs/reiserfs/prints.c~reiserfs-debug fs/reiserfs/prints.c
--- linux-2.6.11/fs/reiserfs/prints.c~reiserfs-debug	2006-07-16 23:44:01.000000000 +0400
+++ linux-2.6.11-vs/fs/reiserfs/prints.c	2006-07-17 00:01:06.000000000 +0400
@@ -423,10 +423,6 @@ static int print_internal (struct buffer
     return 0;
 }
 
-
-
-
-
 static int print_leaf (struct buffer_head * bh, int print_mode, int first, int last)
 {
     struct block_head * blkh;
@@ -725,3 +721,20 @@ bmap with search %d, without %d, dir2ind
   */
 
 }
+
+void print_virtual_node (struct virtual_node * vn)
+{
+    int i;
+    struct virtual_item * vi;
+
+    printk ("VIRTUAL NODE CONTAINS %d items, has size %d,%s,%s, ITEM_POS=%d POS_IN_ITEM=%d MODE=\'%c\'\n",
+            vn->vn_nr_item, vn->vn_size,
+            (vn->vn_vi[0].vi_type & VI_TYPE_LEFT_MERGEABLE )? "left mergeable" : "",
+            (vn->vn_vi[vn->vn_nr_item - 1].vi_type & VI_TYPE_RIGHT_MERGEABLE) ? "right mergeable" : "",
+            vn->vn_affected_item_num, vn->vn_pos_in_item, vn->vn_mode);
+
+    vi = vn->vn_vi;
+    for (i = 0; i < vn->vn_nr_item; i ++, vi ++)
+        op_print_vi (vi);
+
+}
diff -puN fs/reiserfs/fix_node.c~reiserfs-debug fs/reiserfs/fix_node.c
--- linux-2.6.11/fs/reiserfs/fix_node.c~reiserfs-debug	2006-07-16 23:55:09.000000000 +0400
+++ linux-2.6.11-vs/fs/reiserfs/fix_node.c	2006-07-17 00:09:17.000000000 +0400
@@ -346,6 +346,8 @@ static void check_right (struct tree_bal
   return;
 }
 
+int pvn = 0;
+void print_virtual_node (struct virtual_node * vn);
 
 /*
  * from - number of items, which are shifted to left neighbor entirely
@@ -376,6 +378,9 @@ static int get_num_ver (int mode, struct
     int split_item_positions[2]; /* these are positions in virtual item of
 				    items, that are split between S[0] and
 				    S1new and S1new and S2new */
+    int vs8115;
+
+    vs8115 = 0;
 
     split_item_positions[0] = -1;
     split_item_positions[1] = -1;
@@ -512,8 +517,11 @@ static int get_num_ver (int mode, struct
 
 	if (vn->vn_vi[split_item_num].vi_index != TYPE_DIRENTRY &&
 	    vn->vn_vi[split_item_num].vi_index != TYPE_INDIRECT)
-	    reiserfs_warning (tb->tb_sb, "vs-8115: get_num_ver: not "
+	    vs8115 = 1;
+	/*
+	  reiserfs_warning (tb->tb_sb, "vs-8115: get_num_ver: not "
 			      "directory or indirect item");
+	*/
     }
 
     /* now we know S2bytes, calculate S1bytes */
@@ -531,6 +539,14 @@ static int get_num_ver (int mode, struct
 	snum012[3] = op_unit_num (&vn->vn_vi[split_item_num]) - snum012[3] - bytes_to_r - bytes_to_l - bytes_to_S2new;
     }
     
+    if (vs8115 == 1 && pvn == 0) {
+	print_virtual_node(vn);
+	printk("sip[0] %d, sip[1] %d, snum=[%d %d %d %d %d]\n",
+	       split_item_positions[0], split_item_positions[1],
+	       snum012[0], snum012[1], snum012[2], snum012[3], snum012[4]);
+	pvn = 1;
+    }
+
     return needed_nodes;
 }
 

_

--=-VzdbVlLhUSPYzs7DkS+B--

