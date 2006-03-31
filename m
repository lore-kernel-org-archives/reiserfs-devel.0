From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 2/2] Reiser4: Remove printing of useless blank line in dmesg
Date: Fri, 31 Mar 2006 15:57:35 +0200
Message-ID: <20060331135804.499944956@antares.localdomain>
References: <20060331135733.311177477@antares.localdomain>
Return-path: <reiserfs-list-return-28425-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline; filename=reiser4_remove_printing_blank_line_in_syslog.patch
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

This patch removes printing of a useless blank line in dmesg.

Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>

 fs/reiser4/wander.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-mm/fs/reiser4/wander.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/wander.c
+++ linux-2.6-mm/fs/reiser4/wander.c
@@ -231,7 +231,7 @@ static inline int reiser4_use_write_barr
 static void disable_write_barrier(struct super_block * s)
 {
 	notice("zam-1055", "%s does not support write barriers,"
-	       " using synchronous write instead.\n", s->s_id);
+	       " using synchronous write instead.", s->s_id);
 	set_bit((int)REISER4_NO_WRITE_BARRIER, &get_super_private(s)->fs_flags);
 }
 

--

