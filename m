From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 4/8] blocknrset.c cleanup
Date: Tue, 23 Oct 2007 14:12:10 +0200
Message-ID: <1193141530.6236.39.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-E1QaUdsn0NxaaX+rc3z+"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-E1QaUdsn0NxaaX+rc3z+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- blocknrset.c.orig	2007-10-23 12:10:02.000000000 +0200
+++ blocknrset.c	2007-10-23 12:14:34.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+reiser4/README */
 
 /* This file contains code for various block number sets used by the
atom to
    track the deleted set and wandered block mappings. */
@@ -37,9 +38,9 @@
 /* The number of blocks that can fit the blocknr data area. */
 #define BLOCKNR_SET_ENTRIES_NUMBER		\
        ((BLOCKNR_SET_ENTRY_SIZE -		\
-         2 * sizeof (unsigned) -		\
-         sizeof(struct list_head)) /		\
-        sizeof(reiser4_block_nr))
+	2 * sizeof(unsigned) -			\
+	sizeof(struct list_head)) /		\
+	sizeof(reiser4_block_nr))
 
 /* An entry of the blocknr_set */
 struct blocknr_set_entry {
@@ -180,7 +181,8 @@ static int blocknr_set_add(txn_atom *ato
 		bse_put_pair(bse, a, b);
 	}
 
-	/* If new_bsep is non-NULL then there was an allocation race, free
this copy. */
+	/* If new_bsep is non-NULL then there was an allocation race, free
this
+	   copy. */
 	if (*new_bsep != NULL) {
 		bse_free(*new_bsep);
 		*new_bsep = NULL;
@@ -197,7 +199,7 @@ static int blocknr_set_add(txn_atom *ato
    properly freed. */
 int
 blocknr_set_add_extent(txn_atom * atom,
-		       struct list_head * bset,
+		       struct list_head *bset,
 		       blocknr_set_entry ** new_bsep,
 		       const reiser4_block_nr * start,
 		       const reiser4_block_nr * len)
@@ -215,7 +217,7 @@ blocknr_set_add_extent(txn_atom * atom,
    properly freed. */
 int
 blocknr_set_add_pair(txn_atom * atom,
-		     struct list_head * bset,
+		     struct list_head *bset,
 		     blocknr_set_entry ** new_bsep, const reiser4_block_nr * a,
 		     const reiser4_block_nr * b)
 {
@@ -251,7 +253,7 @@ void blocknr_set_destroy(struct list_hea
    actual processing of this set. Testing this kind of stuff right here
is
    also complicated by the fact that these sets are not sorted and
going
    through whole set on each element addition is going to be CPU-heavy
task */
-void blocknr_set_merge(struct list_head * from, struct list_head *
into)
+void blocknr_set_merge(struct list_head *from, struct list_head *into)
 {
 	blocknr_set_entry *bse_into = NULL;
 
@@ -261,7 +263,8 @@ void blocknr_set_merge(struct list_head 
 	/* If @into is not empty, try merging partial-entries. */
 	if (!list_empty(into)) {
 
-		/* Neither set is empty, pop the front to members and try to combine
them. */
+		/* Neither set is empty, pop the front to members and try to
+		   combine them. */
 		blocknr_set_entry *bse_from;
 		unsigned into_avail;
 

--=-E1QaUdsn0NxaaX+rc3z+
Content-Disposition: attachment; filename=blocknrset.c.patch
Content-Type: text/x-patch; name=blocknrset.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- blocknrset.c.orig	2007-10-23 12:10:02.000000000 +0200
+++ blocknrset.c	2007-10-23 12:14:34.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+reiser4/README */
 
 /* This file contains code for various block number sets used by the atom to
    track the deleted set and wandered block mappings. */
@@ -37,9 +38,9 @@
 /* The number of blocks that can fit the blocknr data area. */
 #define BLOCKNR_SET_ENTRIES_NUMBER		\
        ((BLOCKNR_SET_ENTRY_SIZE -		\
-         2 * sizeof (unsigned) -		\
-         sizeof(struct list_head)) /		\
-        sizeof(reiser4_block_nr))
+	2 * sizeof(unsigned) -			\
+	sizeof(struct list_head)) /		\
+	sizeof(reiser4_block_nr))
 
 /* An entry of the blocknr_set */
 struct blocknr_set_entry {
@@ -180,7 +181,8 @@ static int blocknr_set_add(txn_atom *ato
 		bse_put_pair(bse, a, b);
 	}
 
-	/* If new_bsep is non-NULL then there was an allocation race, free this copy. */
+	/* If new_bsep is non-NULL then there was an allocation race, free this
+	   copy. */
 	if (*new_bsep != NULL) {
 		bse_free(*new_bsep);
 		*new_bsep = NULL;
@@ -197,7 +199,7 @@ static int blocknr_set_add(txn_atom *ato
    properly freed. */
 int
 blocknr_set_add_extent(txn_atom * atom,
-		       struct list_head * bset,
+		       struct list_head *bset,
 		       blocknr_set_entry ** new_bsep,
 		       const reiser4_block_nr * start,
 		       const reiser4_block_nr * len)
@@ -215,7 +217,7 @@ blocknr_set_add_extent(txn_atom * atom,
    properly freed. */
 int
 blocknr_set_add_pair(txn_atom * atom,
-		     struct list_head * bset,
+		     struct list_head *bset,
 		     blocknr_set_entry ** new_bsep, const reiser4_block_nr * a,
 		     const reiser4_block_nr * b)
 {
@@ -251,7 +253,7 @@ void blocknr_set_destroy(struct list_hea
    actual processing of this set. Testing this kind of stuff right here is
    also complicated by the fact that these sets are not sorted and going
    through whole set on each element addition is going to be CPU-heavy task */
-void blocknr_set_merge(struct list_head * from, struct list_head * into)
+void blocknr_set_merge(struct list_head *from, struct list_head *into)
 {
 	blocknr_set_entry *bse_into = NULL;
 
@@ -261,7 +263,8 @@ void blocknr_set_merge(struct list_head 
 	/* If @into is not empty, try merging partial-entries. */
 	if (!list_empty(into)) {
 
-		/* Neither set is empty, pop the front to members and try to combine them. */
+		/* Neither set is empty, pop the front to members and try to
+		   combine them. */
 		blocknr_set_entry *bse_from;
 		unsigned into_avail;
 

--=-E1QaUdsn0NxaaX+rc3z+--

