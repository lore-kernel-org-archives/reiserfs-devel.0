From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: fix problem of non-deletable directories
Date: Fri, 26 Sep 2014 22:01:01 +0200
Message-ID: <5425C5FD.6020907@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050309020205040404050908"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=ZzAji0bi5xr/AUvTBmsOM7hE9cS1MoSFrVzLYIaasso=;
        b=Whxh5qMjkBN4myr+77OSyvSdPppYUEwqw/Ufe2z9R1RxvY4zYrG49J69OHfyDgxJAD
         XXKSa6X0o6nwZsth0D6Nx+t3bICtk95ZO2FLR4TEhfozWybF4rtw+aVxpKAAOiPzFj/A
         lgrDlObK3S+2BX9tqCARzmiCkOsLe+XxaMcP6IVIdTotHfm6BjpUAo4SMXWIi3itNfbE
         oCbU+N0yiDgelYPVVM2ZRlsdBQ4dUdw7FRXSScicraYQ0/lrmS86PBnYZUXyG37o0G+b
         8nxuhCAmqa5YbxYlO9cSka7lkOb0NHqrEu8+HUeHJzGgY4hXP8PS4txXEWzK6rXNTXba
         VE8Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050309020205040404050908
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------050309020205040404050908
Content-Type: text/x-patch;
 name="reiser4-fix-problem-non-deletable-dirs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-problem-non-deletable-dirs.patch"

Problem:
parse_cut() calculates cut mode incorrectly when the range contains
objects with non-unique keys, e.g. directory items.

Scenario of corruption.
A node contains only one cde-item with 44 (#0-#43) units, and the units
#42,#43 have identical keys (because of hash collision). We shift units
#0-#42 to left. In this case parse_cut() jumps to the branch "removed
completely". As the result the whole item is removed, while only units
#0-#42 are copied to the left neighbor. unlink() can not find directory
entry which corresponds to unexpectedly killed unit #43. rmdir() doesn't
decrement size of the directory in the error path. As the result, the
directory becomes non-deletable.

Fixup:
For ranges with non-unique keys use a special version of parse_cut(),
which doesn't calculate cut mode by keys.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/node/node40.c |  148 ++++++++++++++++++++++++++++++++--------
 1 file changed, 122 insertions(+), 26 deletions(-)

--- a/fs/reiser4/plugin/node/node40.c
+++ b/fs/reiser4/plugin/node/node40.c
@@ -1017,36 +1017,32 @@ int shrink_item_node40(coord_t * coord,
 	return 0;
 }
 
-/* this is used by cut_node40 and kill_node40. It analyses input parameters and calculates cut mode. There are 2 types
-   of cut. First is when a unit is removed from the middle of an item.  In this case this function returns 1. All the
-   rest fits into second case: 0 or 1 of items getting tail cut, 0 or more items removed completely and 0 or 1 item
-   getting head cut. Function returns 0 in this case */
-static int
-parse_cut(struct cut40_info *cinfo, const struct cut_kill_params *params)
+/*
+ * Evaluate cut mode, if key range has been specified.
+ *
+ * This is for the case when units are not minimal objects
+ * addressed by keys.
+ *
+ * This doesn't work when range contains objects with
+ * non-unique keys (e.g. directory items).
+ */
+static int parse_cut_by_key_range(struct cut40_info *cinfo,
+				  const struct cut_kill_params *params)
 {
-	reiser4_key left_key, right_key;
 	reiser4_key min_from_key, max_to_key;
-	const reiser4_key *from_key, *to_key;
-
-	init_cinfo(cinfo);
-
-	/* calculate minimal key stored in first item of items to be cut (params->from) */
+	const reiser4_key *from_key = params->from_key;
+	const reiser4_key *to_key = params->to_key;
+	/*
+	 * calculate minimal key stored in first item
+	 * of items to be cut (params->from)
+	 */
 	item_key_by_coord(params->from, &min_from_key);
-	/* and max key stored in last item of items to be cut (params->to) */
+	/*
+	 * calculate maximal key stored in last item
+	 * of items to be cut (params->to)
+	 */
 	max_item_key_by_coord(params->to, &max_to_key);
 
-	/* if cut key range is not defined in input parameters - define it using cut coord range */
-	if (params->from_key == NULL) {
-		assert("vs-1513", params->to_key == NULL);
-		unit_key_by_coord(params->from, &left_key);
-		from_key = &left_key;
-		max_unit_key_by_coord(params->to, &right_key);
-		to_key = &right_key;
-	} else {
-		from_key = params->from_key;
-		to_key = params->to_key;
-	}
-
 	if (params->from->item_pos == params->to->item_pos) {
 		if (keylt(&min_from_key, from_key)
 		    && keylt(to_key, &max_to_key))
@@ -1069,7 +1065,7 @@ parse_cut(struct cut40_info *cinfo, cons
 	} else {
 		cinfo->first_removed = params->from->item_pos + 1;
 		cinfo->removed_count =
-		    params->to->item_pos - params->from->item_pos - 1;
+			params->to->item_pos - params->from->item_pos - 1;
 
 		if (keygt(from_key, &min_from_key)) {
 			/* first item is not cut completely */
@@ -1089,10 +1085,110 @@ parse_cut(struct cut40_info *cinfo, cons
 		if (cinfo->removed_count)
 			cinfo->mode |= CMODE_WHOLE;
 	}
+	return 0;
+}
+
+/*
+ * Evaluate cut mode, if the key range hasn't been specified.
+ * In this case the range can include objects with non-unique
+ * keys (e.g. directory entries).
+ *
+ * This doesn't work when units are not the minimal objects
+ * addressed by keys (e.g. bytes in file's body stored in
+ * unformatted nodes).
+ */
+static int parse_cut_by_coord_range(struct cut40_info *cinfo,
+				    const struct cut_kill_params *params)
+{
+	coord_t *from = params->from;
+	coord_t *to = params->to;
+
+	if (from->item_pos == to->item_pos) {
+		/*
+		 * cut is performed on only one item
+		 */
+		if (from->unit_pos > 0 &&
+		    to->unit_pos < coord_last_unit_pos(to))
+			/*
+			 * cut from the middle of item
+			 */
+			return 1;
+		if (from->unit_pos > 0) {
+			/*
+			 * tail of item is to be cut
+			 */
+			cinfo->tail_removed = params->from->item_pos;
+			cinfo->mode |= CMODE_TAIL;
+		} else if (to->unit_pos < coord_last_unit_pos(to)) {
+			/*
+			 * head of item is to be cut
+			 */
+			cinfo->head_removed = params->from->item_pos;
+			cinfo->mode |= CMODE_HEAD;
+		} else {
+			/*
+			 * item is removed completely
+			 */
+			assert("edward-1631",
+			       from->unit_pos == 0 &&
+			       to->unit_pos == coord_last_unit_pos(to));
+
+			cinfo->first_removed = params->from->item_pos;
+			cinfo->removed_count = 1;
+			cinfo->mode |= CMODE_WHOLE;
+		}
+	} else {
+		cinfo->first_removed = from->item_pos + 1;
+		cinfo->removed_count =
+			to->item_pos - from->item_pos - 1;
 
+		if (from->unit_pos > 0) {
+			/*
+			 * first item is not cut completely
+			 */
+			cinfo->tail_removed = from->item_pos;
+			cinfo->mode |= CMODE_TAIL;
+		} else {
+			cinfo->first_removed--;
+			cinfo->removed_count++;
+		}
+		if (to->unit_pos < coord_last_unit_pos(to)) {
+			/*
+			 * last item is not cut completely
+			 */
+			cinfo->head_removed = to->item_pos;
+			cinfo->mode |= CMODE_HEAD;
+		} else {
+			cinfo->removed_count++;
+		}
+		if (cinfo->removed_count)
+			cinfo->mode |= CMODE_WHOLE;
+	}
 	return 0;
 }
 
+/*
+ * this is used by cut_node40 and kill_node40. It analyses input parameters
+ * and calculates cut mode. There are 2 types of cut. First is when a unit is
+ * removed from the middle of an item.  In this case this function returns 1.
+ * All the rest fits into second case: 0 or 1 of items getting tail cut, 0 or
+ * more items removed completely and 0 or 1 item getting head cut. Function
+ * returns 0 in this case
+ */
+static int parse_cut(struct cut40_info *cinfo,
+		     const struct cut_kill_params *params)
+{
+	init_cinfo(cinfo);
+	if (params->from_key == NULL) {
+		/*
+		 * cut key range is not defined in input parameters
+		 */
+		assert("vs-1513", params->to_key == NULL);
+		return parse_cut_by_coord_range(cinfo, params);
+	} else
+		return parse_cut_by_key_range(cinfo, params);
+}
+
 static void
 call_kill_hooks(znode * node, pos_in_node_t from, pos_in_node_t count,
 		carry_kill_data * kdata)

--------------050309020205040404050908--
