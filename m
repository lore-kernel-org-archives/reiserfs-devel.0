From: edward.shishkin@gmail.com
Subject: [PATCH 1/3] Reiser4: fix typo in lzo1_overrun calculation
Date: Thu, 26 Jan 2017 13:23:35 +0100
Message-ID: <1485433417-10554-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=moWi4uNNwjrlve8nqPSP0sFyxDTPZVNjoWbr2GWawkM=;
        b=ZD3LTOJ3MHBzLoO5Tbbgj2b2Ysg6aUwD8RimK14+lp+8QMVm1dlNODZdWMsbnXZtt5
         J1yTJWOJcainiOHUHFdy/Vw9TxWyK/mYyBGmYz3ofWk9rEpctqdcPCCYuhKSEdRgi6Vn
         p5YNR9Kwj8JvPVGLO+fmnX2lJIkyn3jjbvWktw2FlbFZT4B3mOmqYd/k7LPNvN8kEQBC
         moP6r9f8O+4EEFfqNGIMbn8dx+/rwFCiAlcs+yXAjN115Jkp9CF6T+hfaqx88gK47xHV
         4/Q1+5rH3lrV9eRFGjXHZRVGPYdhZRclnqgcTAT1hNAlRWZkeGlJMblRLOSQBYBWvUar
         gKiw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

From: Edward Shishkin <edward.shishkin@gmail.com>

Fix typo found by BratSinot.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 plugin/compress/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugin/compress/compress.c b/plugin/compress/compress.c
index 5c3df83..a574933 100644
--- a/plugin/compress/compress.c
+++ b/plugin/compress/compress.c
@@ -214,7 +214,7 @@ static int lzo1_init(void)
 
 static int lzo1_overrun(unsigned in_len)
 {
-	return in_len / 64 + 16 + 3;
+	return in_len / 16 + 64 + 3;
 }
 
 static coa_t lzo1_alloc(tfm_action act)
-- 
2.7.4

