From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 1/1] FS: reiserfs, fix unreachable statement
Date: Wed,  6 Jan 2010 23:09:50 +0100
Message-ID: <1262815790-5864-1-git-send-email-jslaby@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, jirislaby@gmail.com, reiserfs-devel@vger.kernel.org

Stanse found an unreachable statement in reiserfs_ioctl. There is
if followed by assignment and `break'. with no braces. Add the
braces so that we don't break every time, but only in error case.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/ioctl.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
index ace7745..f53505d 100644
--- a/fs/reiserfs/ioctl.c
+++ b/fs/reiserfs/ioctl.c
@@ -104,9 +104,10 @@ setflags_out:
 		err = put_user(inode->i_generation, (int __user *)arg);
 		break;
 	case REISERFS_IOC_SETVERSION:
-		if (!is_owner_or_cap(inode))
+		if (!is_owner_or_cap(inode)) {
 			err = -EPERM;
 			break;
+		}
 		err = mnt_want_write(filp->f_path.mnt);
 		if (err)
 			break;
-- 
1.6.5.7

