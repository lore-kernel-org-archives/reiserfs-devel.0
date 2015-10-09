From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 1/3] reiser4: remove last traces of JNODE_NEW in the debugging code.
Date: Fri,  9 Oct 2015 14:16:55 +0300
Message-ID: <1444389417-14929-2-git-send-email-intelfx100@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gIblzp8QuAZU61Id+l0Qr1Bx6qtqJgEiAKhHYZlyGPY=;
        b=LOleZ47QZz7J3kpH3xXHpqGRn8Rho89adHlWbMI+Isv7qqrOIA0RAre/ecIsIDiDr3
         dfNDkDPY+6+yYMHUTmqbzyX2rdXx9n9Ft41b9xxyh/0CSztryS7USL48wr/e6Eew3GPe
         K/a4L9pGSh1iCUyN1IksOH+V/6i5CDzvHAc8d3p36umY9vX//iDEjKxogmfmzMJZKeyz
         DTk6S7R4uBlvXYfPPQsgXtpP6CbA3Gx8w0N/7S+/NTD4lluDj4T8zxUEo03tPQW5sgee
         Z4ay8s+SOm8iVTvt8QqoyyA2zQ9HP+vAReSEEuWtGTpsXKYibBY2vNhgKMQYKh9XsIzU
         IEXQ==
In-Reply-To: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

JNODE_NEW was removed in commit b5e0c1d881a88b55dfae466cb2227e0598a513cd
"reiser4: Improve truncate (->setattr)".

 fs/reiser4/jnode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiser4/jnode.c b/fs/reiser4/jnode.c
index e0c9e0c..43af7e9 100644
--- a/fs/reiser4/jnode.c
+++ b/fs/reiser4/jnode.c
@@ -1846,7 +1846,7 @@ static void info_jnode(const char *prefix /* prefix to print */ ,
 	}
 
 	printk
-	    ("%s: %p: state: %lx: [%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s], level: %i,"
+	    ("%s: %p: state: %lx: [%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s], level: %i,"
 	     " block: %s, d_count: %d, x_count: %d, "
 	     "pg: %p, atom: %p, lock: %i:%i, type: %s, ", prefix, node,
 	     node->state,
@@ -1863,7 +1863,6 @@ static void info_jnode(const char *prefix /* prefix to print */ ,
 	     jnode_state_name(node, JNODE_RIP),
 	     jnode_state_name(node, JNODE_MISSED_IN_CAPTURE),
 	     jnode_state_name(node, JNODE_WRITEBACK),
-	     jnode_state_name(node, JNODE_NEW),
 	     jnode_state_name(node, JNODE_DKSET),
 	     jnode_state_name(node, JNODE_REPACK),
 	     jnode_state_name(node, JNODE_CLUSTER_PAGE),
-- 
2.6.0

