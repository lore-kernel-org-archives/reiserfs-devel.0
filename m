From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: [PATCH] reiser4: missed patch in porting to 3.15
Date: Fri, 30 Sep 2016 09:36:28 +0300
Message-ID: <20160930063629.13794-1-intelfx@intelfx.name>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TlkzMq/jXd6ySqs1tQ4LaLqsa+pKiERXBxPUQmY3A+U=;
        b=M7fzsZcVmI2sBWSyFVTZP2XSxDkzzIq+Vj0yR7QaAF8LlbxV5wHfjTgWxFM4+dIzhl
         6qSdhzWpF6sSj9l/UitXveJF5Ux8pSrkm7ZFySS6/dA2TpRMbx5BsozhaE6urJuLn7j9
         IzQrFIX/XKlj4NBxojjH5GRqPhqbx6xh9tOp4=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx@intelfx.name>

A patch was missed in the days of 3.15...

Ivan Shapovalov (1):
  Adjust reiser4 for 3.15: replace truncate_inode_pages(..., 0) with truncate_inode_pages_final(...).

 plugin/file/cryptcompress.c | 2 --
 super_ops.c                 | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.10.0

