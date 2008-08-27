From: David Howells <dhowells@redhat.com>
Subject: [PATCH 41/59] CRED: Wrap task credential accesses in the ReiserFS
	filesystem
Date: Wed, 27 Aug 2008 14:49:13 +0100
Message-ID: <20080827134913.19980.39495.stgit@warthog.procyon.org.uk>
References: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk>
Sender: linux-security-module-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-security-module@vger.kernel.org, David Howells <dhowells@redhat.com>, Serge Hallyn <serue@us.ibm.com>, reiserfs-devel@vger.kernel.org

Wrap access to task credentials so that they can be separated more easily from
the task_struct during the introduction of COW creds.

Change most current->(|e|s|fs)[ug]id to current_(|e|s|fs)[ug]id().

Change some task->e?[ug]id to task_e?[ug]id().  In some places it makes more
sense to use RCU directly rather than a convenient wrapper; these will be
addressed by later patches.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jmorris@namei.org>
Acked-by: Serge Hallyn <serue@us.ibm.com>
Cc: reiserfs-devel@vger.kernel.org
---

 fs/reiserfs/namei.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)


diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index f89ebb9..4f322e5 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -573,7 +573,7 @@ static int new_inode_init(struct inode *inode, struct inode *dir, int mode)
 	/* the quota init calls have to know who to charge the quota to, so
 	 ** we have to set uid and gid here
 	 */
-	inode->i_uid = current->fsuid;
+	inode->i_uid = current_fsuid();
 	inode->i_mode = mode;
 	/* Make inode invalid - just in case we are going to drop it before
 	 * the initialization happens */
@@ -584,7 +584,7 @@ static int new_inode_init(struct inode *inode, struct inode *dir, int mode)
 		if (S_ISDIR(mode))
 			inode->i_mode |= S_ISGID;
 	} else {
-		inode->i_gid = current->fsgid;
+		inode->i_gid = current_fsgid();
 	}
 	DQUOT_INIT(inode);
 	return 0;

