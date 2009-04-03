From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] reiserfs: fix printk format warning
Date: Fri, 3 Apr 2009 05:34:37 +0400
Message-ID: <20090403013437.GA29003@orion>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=zsuQ1vOOwy8HKkPxKjIOEJsSX4516UDrdDzTMsR+Bwg=;
        b=pnk46vK74Vikz2Bf5KddujpZJlEyE/TdiqiVDNegShyOY/ilJS8aCXK5n0XSNw4wNA
         WVJqn+EeX1AZ9++TEgyRlMALDafRrDIMo5awiTG738pOxMaYl3O09Ova/PXAHWqU6wP/
         VrtUWLDIbQopzEodH/AyD+DC4F6ZSsqMFwaj8=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Fix following warning message
fs/reiserfs/procfs.c:393: warning: format '%u' expects type 'unsigned int', but argument 22 has type 'long unsigned int'
introduced in 600ed4167
(reiserfs: audit transaction ids to always be unsigned ints)

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 include/linux/reiserfs_fs_sb.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/reiserfs_fs_sb.h b/include/linux/reiserfs_fs_sb.h
index 5621d87..1d1594a 100644
--- a/include/linux/reiserfs_fs_sb.h
+++ b/include/linux/reiserfs_fs_sb.h
@@ -193,7 +193,7 @@ struct reiserfs_journal {
 	atomic_t j_wcount;	/* count of writers for current commit */
 	unsigned long j_bcount;	/* batch count. allows turning X transactions into 1 */
 	unsigned long j_first_unflushed_offset;	/* first unflushed transactions offset */
-	unsigned long j_last_flush_trans_id;	/* last fully flushed journal timestamp */
+	unsigned int j_last_flush_trans_id;	/* last fully flushed journal timestamp */
 	struct buffer_head *j_header_bh;
 
 	time_t j_trans_start_time;	/* time this transaction started */
