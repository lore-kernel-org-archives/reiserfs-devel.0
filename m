From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Subject: [PATCH] reiserfs: fix __RASSERT format string
Date: Mon, 16 Mar 2015 21:45:06 +0800
Message-ID: <1426513506-30171-1-git-send-email-nicolas.iooss_linux@m4x.org>
References: <5506D81C.50805@m4x.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5506D81C.50805@m4x.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeffm@suse.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Iooss <nicolas.iooss_linux@m4x.org>

__RASSERT format string does not use the PID argument.  reiserfs_panic
arguments are therefore formatted with the wrong format specifier (for
example __LINE__ with %s).  This bug was introduced when commit
c3a9c2109f84 ("reiserfs: rework reiserfs_panic") removed a
"reiserfs[%i]" prefix.

This bug is only triggered when using CONFIG_REISERFS_CHECK, otherwise
__RASSERT is never used.

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Fixes: c3a9c2109f84 ("reiserfs: rework reiserfs_panic")
---
 fs/reiserfs/reiserfs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index bb79cddf0a1f..2adcde137c3f 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -910,7 +910,6 @@ do {									\
 	if (!(cond))							\
 		reiserfs_panic(NULL, "assertion failure", "(" #cond ") at " \
 			       __FILE__ ":%i:%s: " format "\n",		\
-			       in_interrupt() ? -1 : task_pid_nr(current), \
 			       __LINE__, __func__ , ##args);		\
 } while (0)
 
-- 
2.3.3

