From: Ryan Hope <rmh3093@gmail.com>
Subject: [PATCH 2/3][reiser4] don't leave loop prematurely
Date: Mon, 11 Aug 2008 18:38:17 -0400
Message-ID: <48A0BF59.4050605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755573AbYHKWif@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=MCI+fne9xZBzUbEaqL6xJ/GlzSFwVl1xFjDhmNmWD/w=;
        b=CfOI3fqMPx7twzajsbT2npWiaiZegnJ3Ha022IUMMEqFO8kO01tg+NOuQWXji3nK1V
         LkvSb2H0gzRgf39r+cICLbIW40Gj2zTlIzZ2EDYw9cN6EGEtxgeScJrJ2Ef+fouHlsB8
         /weM5fYkw4PDaqAeQTUyIgfu36TTSMitrDwzs=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Edward Shishkin <edward.shishkin@gmail.com>

This was item #9 on the todo list for reiser4 inclusion in mainline:

diff --git a/52d76fde71070a6c4c8c581dd2bfe3c6ffa82ad7:fs/reiser4/page_cache.c 
b/7f1ee1bb0c5a2948f5347646795afd088da30eaf:fs/reiser4/page_cache.c
index 
edf0911dc8bb61398374ecf4f849aa30753fb274..fe713681b73d2a6c4214f5938f21794573d8607d 
100644
--- a/52d76fde71070a6c4c8c581dd2bfe3c6ffa82ad7:fs/reiser4/page_cache.c
+++ b/7f1ee1bb0c5a2948f5347646795afd088da30eaf:fs/reiser4/page_cache.c
@@ -658,8 +658,7 @@ truncate_jnodes_range(struct inode *inode, pgoff_t from, 
pgoff_t count)
  				unhash_unformatted_jnode(node);
  				truncated_jnodes++;
  				jput(node);
-			} else
-				break;
+			}
  		}
  		if (i != taken || taken == 0)
  			break;


-Ryan
