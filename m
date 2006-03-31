From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 1/2] Reiser4: Fix double insertion of loglevel in printk calls
Date: Fri, 31 Mar 2006 15:57:34 +0200
Message-ID: <20060331135804.151077125@antares.localdomain>
References: <20060331135733.311177477@antares.localdomain>
Return-path: <reiserfs-list-return-28426-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline; filename=reiser4_fix_loglevel_usage_in_DCALL.patch
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

DCALL used to insert loglevel twice in the string sent to printk.

Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>

 fs/reiser4/debug.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6-mm/fs/reiser4/debug.h
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/debug.h
+++ linux-2.6-mm/fs/reiser4/debug.h
@@ -16,8 +16,8 @@
 ({									\
 /*	reiser4_print_prefix(lev, reperr, label,*/			\
 /*	__FUNCTION__, __FILE__, __LINE__);*/				\
-	fun(lev "%sreiser4[%.16s(%i)]: %s (%s:%i)[%s]:\n" format "\n" ,	\
-	    lev, current->comm, current->pid, __FUNCTION__,		\
+	fun(lev "reiser4[%.16s(%i)]: %s (%s:%i)[%s]:\n" format "\n" ,	\
+	    current->comm, current->pid, __FUNCTION__,			\
 	    __FILE__, __LINE__, label, ## __VA_ARGS__);			\
 })
 

--

