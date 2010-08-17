From: David Rientjes <rientjes@google.com>
Subject: [patch 6/6] reiserfs: remove dependency on __GFP_NOFAIL
Date: Mon, 16 Aug 2010 19:58:07 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1008161957170.17924@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1008161953430.17924@chino.kir.corp.google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1282013892; bh=tqnbRQ37OtVqwDVOCVJx0O6RDjQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=A4N3ZULb4y7gKcVT2sPk4JG7ucflB5vLvTOmIEfJf2KL8N01C0AYH5niqV0PDyCot
	 ZMXiWJOwzMyXUqPxMrWiQ==
In-Reply-To: <alpine.DEB.2.00.1008161953430.17924@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Removes the dependency on __GFP_NOFAIL by looping indefinitely in the
caller.

Signed-off-by: David Rientjes <rientjes@google.com>
---
 fs/reiserfs/journal.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2593,8 +2593,11 @@ static int journal_read(struct super_block *sb)
 static struct reiserfs_journal_list *alloc_journal_list(struct super_block *s)
 {
 	struct reiserfs_journal_list *jl;
-	jl = kzalloc(sizeof(struct reiserfs_journal_list),
-		     GFP_NOFS | __GFP_NOFAIL);
+
+	do {
+		/* FIXME: this may potentially loop forever */
+		jl = kzalloc(sizeof(struct reiserfs_journal_list), GFP_NOFS);
+	} while (!jl);
 	INIT_LIST_HEAD(&jl->j_list);
 	INIT_LIST_HEAD(&jl->j_working_list);
 	INIT_LIST_HEAD(&jl->j_tail_bh_list);
