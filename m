From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [FIXED?] reiser4: problem with key inconsistency
Date: Sun, 28 Oct 2012 22:56:14 +0100
Message-ID: <508DA9FE.5060005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010205050902030607040408"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type;
        bh=TmnWRLNAQWCF62LVs+oHM9SYEeQy3Mmn9BuQeypOlqA=;
        b=g9mdN0K7WYwysJQc1cNiljkijFFoiuBC1WQ+870vpYPvdFj+R2eQqnb7Jl/5p/FZVw
         aG1gSRIwPSsDB0ru9lOSD8aK1pkiu/ZIG1d/sHX/LC+Glp4bLTDzYBAHVxV1MuhkNcIo
         3MKLQCdwM0A92umlM32wC6OvpFA1XMj9oAKufeSNY32CD0n6trLg9XmAolFqkNNHOXcO
         nZkqBS9LNYxcXhwrwObNbJ0C2XXWeLmCn4qQuw9A2t8wwOZx/DajKZaGOIs+zKTP/joI
         Xqm8caNY3t0GizMaZzaUFoh8wrcLJk6fnvT6Aq4Vlf38u5Hg6DFQnaqoevfSqFrPuOTN
         TXCw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Luciano <luciano@joublanc.com>, I put the Who? in Mishehu <mishehu.mashehu@gmail.com>, =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>, dimas000@ya.ru, Bringfried Stecklum <stecklum@tls-tautenburg.de>, =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, Alexey Shvetsov <alexxyum@gmail.com>

This is a multi-part message in MIME format.
--------------010205050902030607040408
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all.
It seems I do have the long-awaited fix.

The symptoms of the problem: kernel starts to issue complaints
about key inconsistency with the suggestions to check the partition
with fsck. Fsck sometimes finds corruptions, but sometimes reports
that file system is consistent.

Please apply the attached patch to reiser4 stuff for 3.6.2, or
download reiser4-for-3.6.4 (which already contains this patch), and
let me know if the problem has not gone:
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Please, don't rush to deploy production systems on reiser4: it can
take up to 80 hours to reproduce the problem with high workload.

Thank you for your help.
Edward.

--------------010205050902030607040408
Content-Type: text/x-patch;
 name="reiser4-update-dkeys-in-squeeze_right_twig.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-update-dkeys-in-squeeze_right_twig.patch"

Update dkeys of the pair of nodes, which took participation
in the "implicit shift" during squalloc on the twig level in
flush time.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/flush.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- linux-3.6.2_.orig/fs/reiser4/flush.c
+++ linux-3.6.2_/fs/reiser4/flush.c
@@ -450,6 +450,7 @@ static int znode_check_flushprepped(znod
 {
 	return jnode_check_flushprepped(ZJNODE(node));
 }
+static void update_znode_dkeys(znode * left, znode * right);
 
 /* Flush position functions */
 static void pos_init(flush_pos_t *pos);
@@ -1525,6 +1526,7 @@ static int squeeze_right_twig(znode * le
 	int ret = SUBTREE_MOVED;
 	coord_t coord;		/* used to iterate over items */
 	reiser4_key stop_key;
+	reiser4_tree *tree;
 
 	assert("jmacd-2008", !node_is_empty(right));
 	coord_init_first_unit(&coord, right);
@@ -1552,6 +1554,18 @@ static int squeeze_right_twig(znode * le
 
 		ON_DEBUG(shift_check(vp, left, coord.node));
 	}
+	/*
+	 * @left and @right nodes participated in the
+	 * implicit shift, determined by the pair of
+	 * functions:
+	 * . squalloc_extent() - append units to the @left
+	 * . squalloc_right_twig_cut() - cut the units from @right
+	 * so update their delimiting keys
+	 */
+	tree = znode_get_tree(left);
+	write_lock_dk(tree);
+	update_znode_dkeys(left, right);
+	write_unlock_dk(tree);
 
 	if (node_is_empty(coord.node))
 		ret = SQUEEZE_SOURCE_EMPTY;

--------------010205050902030607040408--
