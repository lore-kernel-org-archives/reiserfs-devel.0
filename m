From: Hannes Eder <hannes@hanneseder.net>
Subject: [PATCH v2 13/15] NULL noise: fs/reiserfs/inode.c
Date: Thu, 05 Mar 2009 20:18:05 +0100
Message-ID: <20090305191745.30062.89094.stgit@f10box.hanneseder.net>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: trivial@kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Fix this sparse warning:
  fs/reiserfs/inode.c:2555:19: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

 fs/reiserfs/inode.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 823227a..e69d63a 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2552,7 +2552,7 @@ static int reiserfs_write_begin(struct file *file,
 	int old_ref = 0;
 
  	inode = mapping->host;
-	*fsdata = 0;
+	*fsdata = NULL;
  	if (flags & AOP_FLAG_CONT_EXPAND &&
  	    (pos & (inode->i_sb->s_blocksize - 1)) == 0) {
  		pos ++;

