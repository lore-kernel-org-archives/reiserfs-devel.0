From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Sun, 13 Jul 2014 03:33:57 +0200
Message-ID: <53C1E205.3030209@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <1403434126-6390-4-git-send-email-intelfx100@gmail.com> <53B9E01D.10503@gmail.com> <2011776.QNB5kWXL2t@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000602090504040808010007"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type;
        bh=I5t3y0MRDeTctFhkUaIQ+cvUiohknfsuXzBwB840OD0=;
        b=XbNK+IVa9UPc1sCvXsabafeC8e0KTvhByZ3PfHjwRiL4X+6+4lpp3YfrM2nBG5CtJj
         aeNHryhzmPEM4aO4Yt1UoGYsXpkormwF6qdlRUAvdyuO0dzA1o0w20riX21DU41B3jAB
         IlfvRMKPNYPZWIKhYd0+RdHJ9XNoY03QcpMK3m+DkohhG3cJDswa1s1bNL8nnAgQ5KSn
         YqfqVJ7JJTIBEREBPazz/qVH6X3DFdhdxlWTcrFpwMbMtP0vq2mUMWwLH/I3qaC52ZxP
         6rcj5+Ji3tCATVATZ4aEXotojeh4S/l3TwZOfmGpWaQvt3pZf3Pr+VUWDS7TqtUrm6Am
         oifA==
In-Reply-To: <2011776.QNB5kWXL2t@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------000602090504040808010007
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2014 02:40 PM, Ivan Shapovalov wrote:
> On Monday 07 July 2014 at 01:47:41, Edward Shishkin wrote:	
>> On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
>> [...]
[...]
>>
>>> + * - if a single extent is smaller than the erase unit, then this particular
>>> + *   extent won't be discarded even if it is surrounded by enough free blocks
>>> + *   to constitute a whole erase unit;
>>
>> Why not to discard the aligned and padded extent, which coincides
>> with the whole erase unit?
> With a number of whole erase units.
>
>>
>>> + * - we won't be able to merge small adjacent extents forming an extent long
>>> + *   enough to be discarded.
>>
>> At this point we have already sorted and merged everything.
>> So may be it makes sense just to check the head and tail of every resulted
>> extent and discard the aligned and padded one?
> "Head and tail" is not sufficient. We may check the whole extent with a single
> bitmap request, but such algorithm will be very inefficient: it will miss many
> possibilities for discarding.
>
> Consider many-block extent, from which one block has been allocated again.
> In this case we miss (all-1) blocks to be discarded (if granularity = 1 block).
>
>> Please, consider such possibility. Iterating over erase units in
>> discard_extent()
>> looks suboptimal.
> Yes, it's costly... but I don't see any other ways to do the task efficiently.


How about this function?  (the attached patch is against v6-series).
Total number of bitmap checks is in [N+1, 2N], where N is number of
extents  in the list. At the same time we don't leave any non-discarded
"garbage"...

Edward.
P.S. I tested it, but not enough.

--------------000602090504040808010007
Content-Type: text/x-patch;
 name="reiser4-iterate-extents-discard.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-iterate-extents-discard.patch"

---
 fs/reiser4/blocknrlist.c |   10 +
 fs/reiser4/discard.c     |  249 ++++++++++++++++++++++++++++++++++++++++++++++-
 fs/reiser4/txnmgr.h      |    2 
 3 files changed, 259 insertions(+), 2 deletions(-)

--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -167,6 +167,249 @@ static int discard_extent(txn_atom *atom
 	return 0;
 }
 
+/*
+ * Return size of head padding of an extent on a lattice
+ * with step @ulen and offset @uoff.
+ * @start - the start offset of the extent.
+ */
+static int extent_get_headp(reiser4_block_nr start, int uoff, int ulen)
+{
+	__u64 headp;
+	headp = ulen + start - uoff;
+	headp = do_div(headp, ulen);
+	return headp;
+}
+
+/*
+ * Return size of tail padding of an extent on a lattice
+ * with step @ulen and offset @uoff.
+ * @end - the end offset of the extent.
+ */
+static int extent_get_tailp(reiser4_block_nr end, int uoff, int ulen)
+{
+	__u64 tailp;
+	tailp = ulen + end - uoff;
+	tailp = do_div(tailp, ulen);
+	if (tailp)
+		tailp = ulen - tailp;
+	return tailp;
+}
+
+static struct list_head *get_next_at(struct list_head *pos,
+				     struct list_head *head)
+{
+	assert("edward-1631", pos != NULL);
+	assert("edward-1632", head != NULL);
+	assert("edward-1633", pos != head);
+
+	return pos->next == head ? NULL : pos->next;
+}
+
+static inline int check_free_blocks(const reiser4_block_nr start,
+				    const reiser4_block_nr len)
+{
+	return reiser4_check_blocks(&start, &len, 0);
+}
+
+/* Make sure that extents are sorted and merged */
+#if REISER4_DEBUG
+static inline void check_blocknr_list_at(struct list_head *pos,
+					 struct list_head *head)
+{
+	struct list_head *next;
+
+	next = get_next_at(pos, head);
+	if (next == NULL)
+		return;
+	if (blocknr_list_entry_start(next) <=
+	    blocknr_list_entry_start(pos) + blocknr_list_entry_len(pos))
+		warning("edward-1634",
+			"discard bad pair of extents: (%llu,%llu), (%llu,%llu)",
+			blocknr_list_entry_start(pos),
+			blocknr_list_entry_len(pos),
+			blocknr_list_entry_start(next),
+			blocknr_list_entry_len(next));
+}
+#else
+#define check_blocknr_list_at(pos, head) noop
+#endif
+
+/*
+ * discard_sorted_extents() - iterate through the list of
+ * sorted and merged extents and check head and tail paddings
+ * of each extent in the working space map. Try to "glue" the
+ * nearby extents. Discard the (glued) extents with padded (or
+ * cut) head and tail.
+ *
+ * Pre-conditions: @head points to the list of sorted and
+ * merged extents.
+ *
+ * Local variables:
+ *
+ * d_uni - discard unit size (in blocks);
+ * d_off - discard alignment (in blocks);
+ *
+ * start - offset of the first block of the extent;
+ * len - length of the extent;
+ * end - offset of the first block beyond extent;
+ *
+ * headp - size of head padding of the extent;
+ * tailp - size of tail padding of the extent;
+ *
+ * astart - actual start to discard (offset of the head padding);
+ * alen - actual length to discard (length of glued aligned and padded extents).
+ *
+ * Terminology in the comments:
+ *
+ * head - a part of extent at the beginning;
+ * tail - a part of extent at the end.
+ */
+
+static int discard_sorted_extents(struct list_head *head)
+{
+	int ret;
+	struct super_block *sb = reiser4_get_current_sb();
+	struct queue_limits *limits = &bdev_get_queue(sb->s_bdev)->limits;
+
+	int d_uni;
+	int d_off;
+	struct list_head *pos;
+
+	d_uni = limits->discard_granularity / sb->s_blocksize;
+	if (d_uni == 0)
+		d_uni = 1;
+	d_off = (bdev_discard_alignment(sb->s_bdev) / sb->s_blocksize) % d_uni;
+
+	for (pos = head->next; pos != head; pos = pos->next) {
+		int headp;
+		int tailp;
+		int headp_is_known_dirty = 0;
+		reiser4_block_nr start;
+		reiser4_block_nr len;
+		reiser4_block_nr end;
+		reiser4_block_nr astart; __s64 alen;
+
+		check_blocknr_list_at(pos, head);
+
+		start = blocknr_list_entry_start(pos);
+		len = blocknr_list_entry_len(pos);
+		/*
+		 * Step I. Cut or pad the head of extent
+		 *
+		 * This extent wasn't glued
+		 */
+		headp = extent_get_headp(start, d_off, d_uni);
+
+		if (headp && !headp_is_known_dirty &&
+		    check_free_blocks(start - headp, headp)) {
+			/*
+			 * head padding is clean,
+			 * pad the head
+			 */
+			astart = start - headp;
+			alen = len + headp;
+		}
+		else {
+			/*
+			 * head padding is empty or dirty,
+			 * cut the head
+			 */
+			headp_is_known_dirty = 0;
+			astart = start + (d_uni - headp);
+			alen = len - (d_uni - headp);
+		}
+		/*
+		 * Step II. Try to glue all nearby extents to the tail
+		 * Cut or pad the tail of the last extent.
+		 */
+		end = start + len;
+		tailp = extent_get_tailp(end, d_off, d_uni);
+
+		/*
+		 * This "gluing" loop updates @pos, @end, @tailp, @alen
+		 */
+		while (1) {
+			struct list_head *next;
+
+			next = get_next_at(pos, head);
+			check_blocknr_list_at(next, head);
+
+			if (next && (end + tailp >= blocknr_list_entry_start(next))) {
+				/*
+				 * try to glue the next extent
+				 */
+				reiser4_block_nr next_start;
+				reiser4_block_nr next_len;
+
+				next_start = blocknr_list_entry_start(next);
+				next_len = blocknr_list_entry_len(next);
+
+				if (check_free_blocks(end, next_start - end)) {
+					/*
+					 * jump to the glued extent
+					 */
+					if (end + tailp < next_start + next_len) {
+						/*
+						 * the glued extent doesn't
+						 * fit into the tail padding,
+						 * so update the last one
+						 */
+						tailp = extent_get_tailp(next_start + next_len,
+									 d_off, d_uni);
+						alen += (next_start + next_len - end);
+					}
+					pos = next;
+					end = next_start + next_len;
+					/*
+					 * try to glue more extents
+					 */
+					continue;
+				} else {
+					/*
+					 * gluing failed, cut the tail
+					 */
+					if (end + tailp > next_start)
+						headp_is_known_dirty = 1;
+
+					alen -= (d_uni - tailp);
+					break;
+				}
+			} else {
+				/*
+				 * nothing to glue:
+				 * this is the last extent, or the next
+				 * extent is too far. So just check the
+				 * rest of tail padding
+				 */
+				if (tailp && check_free_blocks(end, tailp))
+					/*
+					 * tail padding is clean,
+					 * pad the tail
+					 */
+					alen += tailp;
+				else
+					/*
+					 * empty or dirty tail padding,
+					 * cut the tail
+					 */
+					alen -= (d_uni - tailp);
+				break;
+			}
+		}
+		/*
+		 * Step III. Discard the result
+		 */
+		if (alen > 0) {
+			ret = __discard_extent(sb->s_bdev,
+					       astart * (sb->s_blocksize >> 9),
+					       alen * (sb->s_blocksize >> 9));
+			if (ret)
+				return ret;
+		}
+	}
+	return 0;
+}
+
 int discard_atom(txn_atom *atom)
 {
 	int ret;
@@ -195,11 +438,13 @@ int discard_atom(txn_atom *atom)
 	blocknr_list_sort_and_join(&discard_set);
 
 	/* Perform actual dirty work. */
-	ret = blocknr_list_iterator(NULL, &discard_set, &discard_extent, NULL, 1);
+
+	//ret = blocknr_list_iterator(NULL, &discard_set, &discard_extent, NULL, 1);
+
+	ret = discard_sorted_extents(&discard_set);
 	if (ret != 0) {
 		return ret;
 	}
-
 	/* Let's do this again for any new extents in the atom's discard set. */
 	return -E_REPEAT;
 }
--- a/fs/reiser4/blocknrlist.c
+++ b/fs/reiser4/blocknrlist.c
@@ -26,6 +26,16 @@ struct blocknr_list_entry {
 
 #define blocknr_list_entry(ptr) list_entry(ptr, blocknr_list_entry, link)
 
+reiser4_block_nr blocknr_list_entry_start(struct list_head *ptr)
+{
+	return blocknr_list_entry(ptr)->start;
+}
+
+reiser4_block_nr blocknr_list_entry_len(struct list_head *ptr)
+{
+	return blocknr_list_entry(ptr)->len;
+}
+
 static void blocknr_list_entry_init(blocknr_list_entry *entry)
 {
 	assert("intelfx-11", entry != NULL);
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -507,6 +507,8 @@ extern int blocknr_set_iterator(txn_atom
 /* This is the block list interface (see blocknrlist.c) */
 extern int blocknr_list_init_static(void);
 extern void blocknr_list_done_static(void);
+extern reiser4_block_nr blocknr_list_entry_start(struct list_head *blist);
+extern reiser4_block_nr blocknr_list_entry_len(struct list_head *blist);
 extern void blocknr_list_init(struct list_head *blist);
 extern void blocknr_list_destroy(struct list_head *blist);
 extern void blocknr_list_merge(struct list_head *from, struct list_head *to);

--------------000602090504040808010007--
