From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 3/6] kill-the-BKL/reiserfs: release write lock while rescheduling on prepare_for_delete_or_cut()
Date: Fri,  1 May 2009 04:44:19 +0200
Message-ID: <1241145862-21700-4-git-send-email-fweisbec@gmail.com>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=ibgcR1gdPnYM3v85FzFaw9uBwqrSLfqdWIvyJLo2lTk=;
        b=dYS8davfjRvwad1yjxOgkvQBWCr2xAl0OvTHQj6/8rrBv50P1zpANwd2wZgSXAxpdv
         v3AQ8JUknW2EKSrTiZ0VtGeToUIlEQ5Vuz9FUfV/3Sm5oXAJ0gk5OG6mniFOu+dYMbYg
         oyplOmqIbVqbAyAB4qOqKubpZdAkPVSvJPwpU=
In-Reply-To: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

prepare_for_delete_or_cut() can process several types of items, including
indirect items, ie: items which contain no file data but pointers to
unformatted nodes scattering the datas of a file.

In this case it has to zero out these pointers to block numbers of
unformatted nodes and release the bitmap from these block numbers.

It can take some time, so a rescheduling() is performed between each
block processed. We can safely release the write lock while
rescheduling(), like the bkl did, because the code checks just after
if the item has moved after sleeping.

[ Impact: release the reiserfs write lock when it is not needed ]

Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/stree.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 6bd99a9..6ddcecb 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1026,7 +1026,9 @@ static char prepare_for_delete_or_cut(struct reiserfs_transaction_handle *th, st
 			reiserfs_free_block(th, inode, block, 1);
 		    }
 
+		    reiserfs_write_unlock(sb);
 		    cond_resched();
+		    reiserfs_write_lock(sb);
 
 		    if (item_moved (&s_ih, path))  {
 			need_re_search = 1;
-- 
1.6.2.3

