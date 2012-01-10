From: Greg KH <gregkh@suse.de>
Subject: [14/40] reiserfs: Fix quota mount option parsing
Date: Tue, 10 Jan 2012 13:45:27 -0800
Message-ID: <20120110214619.418388994@clark.kroah.org>
References: <20120110214630.GA14384@kroah.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120110214630.GA14384@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, alan@lxorguk.ukuu.org.uk, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

3.0-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jan Kara <jack@suse.cz>

commit a06d789b424190e9f59da391681f908486db2554 upstream.

When jqfmt mount option is not specified on remount, we mistakenly clear
s_jquota_fmt value stored in superblock. Fix the problem.

CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 fs/reiserfs/super.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1164,7 +1164,8 @@ static void handle_quota_files(struct su
 			kfree(REISERFS_SB(s)->s_qf_names[i]);
 		REISERFS_SB(s)->s_qf_names[i] = qf_names[i];
 	}
-	REISERFS_SB(s)->s_jquota_fmt = *qfmt;
+	if (*qfmt)
+		REISERFS_SB(s)->s_jquota_fmt = *qfmt;
 }
 #endif
 

