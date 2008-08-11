From: Ryan Hope <rmh3093@gmail.com>
Subject: [PATCH 1/3][reiser4] use wake_up_process() instead of wake_up() when
 possible
Date: Mon, 11 Aug 2008 18:34:50 -0400
Message-ID: <48A0BE8A.5080600@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=TZvcX9gB8u7GGHOuHdctWgoQjbALQpcMFuGs6x72QFc=;
        b=mpesJi2kZC8uKODbIlKDrzRmLAzRa9Jc1o6x4+VtDsWQ8d0RKn3Q6/CEAz6T0F9MR3
         dzcMCC3cEqpl1AW0SljLe1Pl2BuzyALyo/AvktoCCSfsQwu5BoJUxdlcVO93Zj6dVVXk
         S3ckAOup/dxOhDw2q6/GkUj4Jn4lEZZQGaC7g=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LKML <linux-kernel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

This was item #6 on the todo list for reiser4 inclusion in mainline:

diff --git a/fs/reiser4/entd.c b/fs/reiser4/entd.c
index ecdfde6..9fd4d6e 100644
--- a/fs/reiser4/entd.c
+++ b/fs/reiser4/entd.c
@@ -218,7 +218,7 @@ void reiser4_leave_flush(struct super_block *super)
  #endif
  	spin_unlock(&ent->guard);
  	if (wake_up_ent)
-		wake_up(&ent->wait);
+		wake_up_process(ent->tsk);
  }

  #define ENTD_CAPTURE_APAGE_BURST SWAP_CLUSTER_MAX
@@ -304,7 +304,7 @@ int write_page_by_ent(struct page *page, struct 
writeback_control *wbc)
  	ent->nr_todo_reqs++;
  	list_add_tail(&rq.link, &ent->todo_list);
  	if (ent->nr_todo_reqs == 1)
-		wake_up(&ent->wait);
+		wake_up_process(ent->tsk);

  	spin_unlock(&ent->guard);


-Ryan
