From: Jan Kara <jack@suse.cz>
Subject: [PATCH 2/2] printk: Debug patch 2
Date: Fri, 10 Oct 2014 16:23:48 +0200
Message-ID: <1412951028-4085-44-git-send-email-jack@suse.cz>
References: <1412951028-4085-1-git-send-email-jack@suse.cz>
Return-path: <linux-ext4-owner@vger.kernel.org>
In-Reply-To: <1412951028-4085-1-git-send-email-jack@suse.cz>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, Dave Chinner <david@fromorbit.com>, xfs@oss.sgi.com, cluster-devel@redhat.com, Steven Whitehouse <swhiteho@redhat.com>, Mark Fasheh <mfasheh@suse.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.de>, Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net, tytso@mit.edu, viro@zeniv.linux.org.uk, Jan Kara <jack@suse.cz>

Signed-off-by: Jan Kara <jack@suse.cz>
---
 kernel/printk/printk.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a39f4129f848..00a9ad5c2708 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1718,17 +1718,19 @@ asmlinkage int vprintk_emit(int facility, int level,
 
 	logbuf_cpu = UINT_MAX;
 	raw_spin_unlock(&logbuf_lock);
-	local_irq_restore(flags);
-
-	/* If called from the scheduler, we can not call up(). */
-	if (in_sched)
-		return printed_len;
