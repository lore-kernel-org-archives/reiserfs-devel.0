From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 1/3] reiser4: discard: signify non-idempotence of check_free_blocks() by changing its name.
Date: Fri, 13 Feb 2015 08:02:56 +0300
Message-ID: <1423803778-19698-2-git-send-email-intelfx100@gmail.com>
References: <1423803778-19698-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tFEO1inrGzUNfUUATFFSlLsrG3rDwYVxAKGmYSCi2F8=;
        b=EZo02AjQqYSTD9EGw1VXFoAimnJ2EW/tQzaQf2az4iWkSQ2YwLWECLeCpEOa9pok/7
         o5nr3omcEO5jGI0Q6VZICXyVo0+hLFam6z6IHAxU/afFAnEI97vqKWMIdb4CDMye+2t8
         sifUx8AVHNYux9ykHRP/AyHnoDFdc5c6E+Q6rw2o/byCKQhdF1ZpPnTjFdWWWNe6g9Q4
         0nWIa3nJRkjlVUko1+jbNYEyXtvIztLm2H79eDPZ9c8SNuo5se3uMaywHExWxT8AO7/F
         j5CbwyATKIc6QOFDwFFY9pDhEjmRWaO8LmBYw76VD/+aGpIQ7DtBZne0aQGgR7Rv7UEK
         ZQxQ==
In-Reply-To: <1423803778-19698-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/discard.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index b4cd236..a615b7d 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -185,8 +185,13 @@ static inline struct list_head *get_next_at(struct list_head *pos,
 	return pos->next == head ? NULL : pos->next;
 }
 
-static inline int check_free_blocks(const reiser4_block_nr start,
-				    const reiser4_block_nr len)
+/*
+ * Check if a given block range is free (clean) and allocate it.
+ *
+ * NOTE: this operation is not idempotent.
+ */
+static inline int try_allocate_blocks(const reiser4_block_nr start,
+				      const reiser4_block_nr len)
 {
 	/*
 	 * NOTE: we do not use BA_PERMANENT in out allocations
@@ -321,7 +326,7 @@ static int discard_precise_extents(struct list_head *head)
 		}
 		else if (p_start >= p_headp /* discard unit is complete */ &&
 			 !headp_is_known_dirty &&
-			 check_free_blocks(start - headp, headp)) {
+			 try_allocate_blocks(start - headp, headp)) {
 			/*
 			 * pad the head
 			 */
@@ -379,7 +384,7 @@ static int discard_precise_extents(struct list_head *head)
 				 * check space between the extents;
 				 * if it is free, then allocate it
 				 */
-				if (check_free_blocks(end, next_start - end)) {
+				if (try_allocate_blocks(end, next_start - end)) {
 					/*
 					 * jump to the glued extent
 					 */
@@ -422,7 +427,7 @@ static int discard_precise_extents(struct list_head *head)
 				 */
 				if (tailp == 0)
 					break;
-				else if (check_free_blocks(end, tailp)) {
+				else if (try_allocate_blocks(end, tailp)) {
 					/*
 					 * tail padding is clean,
 					 * pad the tail
-- 
2.3.0

