From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/1] reiser4: add an assignment in writeback_sb_inodes missed
 in the forward port for 3.11
Date: Mon, 01 Dec 2014 22:30:26 +0100
Message-ID: <547CDDF2.5080309@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060301090002010307040605"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type;
        bh=68+MOtrDfQ9T2TezhWaRP6VNpHYt94xVEBXASCM7Rak=;
        b=MLmqIs9siP7KtNaMg34701fkqMco8gFMG8ysGLXZQ0zPTNSBSSj7jC9pnOrWy2GIS4
         Ej1j1RvhmIgFop5rhy+kQ1R9q/jv0lRiD360NZSvf86Ji/k6Lzvfb62uHXmPk6a8NtDY
         gW0yl/pBC12LCmtxIzIHAGD0dZAvK7nKe3mOy4FxIUwBGfm7qDrXV/5EKtx+byWfBXQ0
         3t42AracFXMMrpd8vthqFk5c+HbU+5klprI9cwu6ai0Mk/R2kit7+EPWLtSq6doFX70S
         ANQY1KMYgvNZsLd+Nwa6SGZJNSAaK0Wf0wMTe4Zql9GLgNH0AUJWa2/Q5/yLf593YIDy
         yGRQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>
Cc: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>

This is a multi-part message in MIME format.
--------------060301090002010307040605
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------060301090002010307040605
Content-Type: text/x-patch;
 name="reiser4-init-wbc-properly.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-init-wbc-properly.patch"

Add an assignment in writeback_sb_inodes() missed in 
the forward port for 3.11

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/fs-writeback.c |    1 +
 1 file changed, 1 insertion(+)

--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -693,6 +693,7 @@ long writeback_sb_inodes(struct super_bl
 		.tagged_writepages	= work->tagged_writepages,
 		.for_kupdate		= work->for_kupdate,
 		.for_background		= work->for_background,
+		.for_sync		= work->for_sync,
 		.range_cyclic		= work->range_cyclic,
 		.range_start		= 0,
 		.range_end		= LLONG_MAX,

--------------060301090002010307040605--
