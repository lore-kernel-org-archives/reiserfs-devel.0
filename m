From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH] replace list_for_each with list_for_each_entry
Date: Sun, 28 Oct 2007 21:27:54 +0100
Message-ID: <1193603274.9101.3.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-dH9MlU/N6buupctWEp69"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-dH9MlU/N6buupctWEp69
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Additional replace of list_for_each with list_for_each_entry (which
crept in) as requested by Cristoph Hellwig in
http://lkml.org/lkml/2005/9/16/134

--=-dH9MlU/N6buupctWEp69
Content-Disposition: attachment; filename=listforeach.patch
Content-Type: text/x-patch; name=listforeach.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- reiser4-for-2.6.22-2.patch.orig	2007-10-22 23:01:21.000000000 +0200
+++ reiser4-for-2.6.22-2-listforeach.patch	2007-10-28 21:20:55.000000000 +0100
@@ -15049,7 +15049,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/f
 +	list_for_each_entry(fq, &atom->flush_queues, alink) {
 +		spin_lock(&(fq->guard));
 +		/* calculate number of jnodes on fq' list of prepped jnodes */
-+		list_for_each(pos, ATOM_FQ_LIST(fq))
++		list_for_each_entry(pos, ATOM_FQ_LIST(fq))
 +			count++;
 +		spin_unlock(&(fq->guard));
 +	}
@@ -23716,7 +23716,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/l
 +{
 +	struct list_head *pos;
 +
-+	list_for_each(pos, head)
++	list_for_each_entry(pos, head)
 +		assert("", (pos->prev != NULL && pos->next != NULL &&
 +			    pos->prev->next == pos && pos->next->prev == pos));
 +}
@@ -74891,7 +74891,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/t
 +		/* dirty list */
 +		count = 0;
 +		for (level = 0; level < REAL_MAX_ZTREE_HEIGHT + 1; level += 1) {
-+			list_for_each(pos, ATOM_DIRTY_LIST(atom, level))
++			list_for_each_entry(pos, ATOM_DIRTY_LIST(atom, level))
 +				count++;
 +		}
 +		if (count != atom->dirty)
@@ -74900,7 +74900,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/t
 +
 +		/* clean list */
 +		count = 0;
-+		list_for_each(pos, ATOM_CLEAN_LIST(atom))
++		list_for_each_entry(pos, ATOM_CLEAN_LIST(atom))
 +			count++;
 +		if (count != atom->clean)
 +			warning("", "clean counter %d, real %d\n", atom->clean,
@@ -74908,7 +74908,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/t
 +
 +		/* wb list */
 +		count = 0;
-+		list_for_each(pos, ATOM_WB_LIST(atom))
++		list_for_each_entry(pos, ATOM_WB_LIST(atom))
 +			count++;
 +		if (count != atom->wb)
 +			warning("", "wb counter %d, real %d\n", atom->wb,
@@ -74916,7 +74916,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/t
 +
 +		/* overwrite list */
 +		count = 0;
-+		list_for_each(pos, ATOM_OVRWR_LIST(atom))
++		list_for_each_entry(pos, ATOM_OVRWR_LIST(atom))
 +			count++;
 +
 +		if (count != atom->ovrwr)

--=-dH9MlU/N6buupctWEp69--

