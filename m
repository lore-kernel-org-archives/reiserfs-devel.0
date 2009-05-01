From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 4/6] kill-the-BKL/reiserfs: release the write lock inside get_neighbors()
Date: Fri,  1 May 2009 04:44:20 +0200
Message-ID: <1241145862-21700-5-git-send-email-fweisbec@gmail.com>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=D5exrwvPwFJG0GEAUcIFXICXBwF3fzj9cWbGt8zY+ic=;
        b=ghqgGtPcuoFvHk7blh7efqVW+DjFsmON9Orl1KdmoW/INl5x7dOYHD54xRp6bywfRY
         p4EVnniwTU4a6b1+B1Lp6CAQoKpCsvpmU3BolyFTadQteReinkQKuK5rdh324il0rGGz
         uNh5cMrWXI9ZJsdYa/32kRJmDIaiVlIhM5iZ0=
In-Reply-To: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

get_neighbors() is used to get the left and/or right blocks
against a given one in order to balance a tree.

sb_bread() is used to read the buffer of these neighors blocks and
while it waits for this operation, it might sleep.

The bkl was released at this point, and then we can also release
the write lock before calling sb_bread().

This is safe because if the filesystem is changed after this
lock release, the function returns REPEAT_SEARCH (aka SCHEDULE_OCCURRED
in the function header comments) in order to repeat the neighbhor
research.

[ Impact: release the reiserfs write lock when it is not needed ]

Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/fix_node.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
index bf5f2cb..3a685e3 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -1971,7 +1971,9 @@ static int get_neighbors(struct tree_balance *tb, int h)
 		     tb->FL[h]) ? tb->lkey[h] : B_NR_ITEMS(tb->
 								       FL[h]);
 		son_number = B_N_CHILD_NUM(tb->FL[h], child_position);
+		reiserfs_write_unlock(sb);
 		bh = sb_bread(sb, son_number);
+		reiserfs_write_lock(sb);
 		if (!bh)
 			return IO_ERROR;
 		if (FILESYSTEM_CHANGED_TB(tb)) {
@@ -2009,7 +2011,9 @@ static int get_neighbors(struct tree_balance *tb, int h)
 		child_position =
 		    (bh == tb->FR[h]) ? tb->rkey[h] + 1 : 0;
 		son_number = B_N_CHILD_NUM(tb->FR[h], child_position);
+		reiserfs_write_unlock(sb);
 		bh = sb_bread(sb, son_number);
+		reiserfs_write_lock(sb);
 		if (!bh)
 			return IO_ERROR;
 		if (FILESYSTEM_CHANGED_TB(tb)) {
-- 
1.6.2.3

