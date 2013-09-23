From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.11
Date: Mon, 23 Sep 2013 14:36:57 +0200
Message-ID: <524035E9.1070208@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=+T9lMH8ndWCdq2OpruXTqNm/7GhQyZFZv8/1nJ2As3s=;
        b=V/o5rto99IUtmKu+kU9xjyvLZWkGtWmTlwJuKoiAne+C8nZIjQurMDW7m1eFldQlHD
         /WNVSEPACmvGh771o51fW0mzzcc+tgLZSqo9vj/T8onZCILC2P1zEc4QNOgF17Jqb7eZ
         ZUGgpyssr8z5fjQ5IVifDvZyayCKu/TeIUMQIVWt8h2H3o0F7u0Kk3kCSGk6v+QCjNPx
         roBBIDgDOZPB4Sm5h64pLn2Pn1/ari1Yg7uTyeiFa5yLBiMxpjUxA2JVBpZauFTVbYL4
         YSa4Av9AHliQKzVcSB+kL2btIrOFWNZSQhuBbJfe5Ppg2Qc9r+aCLdNUaw2JhRdPTkVO
         tYhg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Changes since reiser4-for-3.10:

Ivan Shapovalov

. Port for linux-3.9:
   . use length argument in ->invalidatepage();
   . use ->iterate() instead of ->readdir();
   . fix up namespace collision: rename d_lock to d_c_lock;
   . replace num_physpages (went away) with totalram_pages;
   . replace d_count of struct dentry with d_lockref.count

Edward Shishkin

   . use free value 0x00000002 for PF_FLUSHER;
   . initialize wb_writeback_work->for_sync with 1 in reiser4_sync_fs().


Please, find at
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Thanks,
Edward.
