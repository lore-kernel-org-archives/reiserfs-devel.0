From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] reiserfs: reiserfs.h: delete a duplicated word
Date: Sun, 19 Jul 2020 17:14:31 -0700
Message-ID: <20200720001431.29718-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=TkhWvc8l5CWS7bsnAdkWIdDqNQ8IJGTo9sI225rq3q4=; b=F97bN00y3oZwW6tXBYCAsEozAk
        KYJN3W/aECayJzQSpsGwG4AD0hR8oYAYaJSS718Rx2y4ljPfyfVfYvKY9+ZjTejnFtdCqotwk+5/X
        bFa8A/wMZDTgkwANY7tsfq1X6BolD6eZzCTilngKKlQmWxOF0ABKhUjFBPbxLZxOv960dpu4bsNtV
        Mx4bocaliEvjvET+6y7k6KWVM+7afWLYJBa4CahI1XrHOmP9J0fSSAA1ILxMoGSNRPMqsRGiIxqXW
        rIUtWvPKAI5pJxYpWxe6dxAgv9dlcoc84rXVsFGLxIXFwFYuqkCSCL6rpwco+7p2rrYGtii7o4jpW
        p6eXJtqg==;
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Jan Kara <jack@suse.cz>, Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

Drop the repeated word "than" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/reiserfs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/fs/reiserfs/reiserfs.h
+++ linux-next-20200717/fs/reiserfs/reiserfs.h
@@ -1109,7 +1109,7 @@ int is_reiserfs_jr(struct reiserfs_super
  * ReiserFS leaves the first 64k unused, so that partition labels have
  * enough space.  If someone wants to write a fancy bootloader that
  * needs more than 64k, let us know, and this will be increased in size.
- * This number must be larger than than the largest block size on any
+ * This number must be larger than the largest block size on any
  * platform, or code will break.  -Hans
  */
 #define REISERFS_DISK_OFFSET_IN_BYTES (64 * 1024)
