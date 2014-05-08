From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCH] reiser4progs: add discard support to mkfs.reiser4.
Date: Thu,  8 May 2014 23:15:53 +0400
Message-ID: <1399576554-6053-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=kf8Ua18NTvSFFHmBy+SE2eNeoMvQzHKf2WMb1g+9frM=;
        b=CMXYRu/z3TBhCegrvdiyiXjx1DjsMGd3j42HLBZTNAfq24zHK6G1rTJwdJIZRaP/qO
         wN/lLFq3o8jusoikaSudcYx3/EcASIm+kio7YLkzgOCcjwdMcOfZ5KbjOrJ2LK++RYjn
         QPfh0jWj0qQlNFVPQTtFN6/5pIb5sexp9OpWGgX0E9xsvF7BLCMGC7tsNdJ/0j+gemax
         YVrdhx4oDNtpmxM4ou+3OdyOtVS3WxJQb+uPfmZUcLfMbXUf/AKbsqaJwf2JT9bu0kyx
         waRayDi1FbZkGvndXBQ1KIKEw5k4f8at+DHWjLLpu0BrdORMvZvZndkM0AdsoIzK3ama
         a8GQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This uses libaal's discard device operation to erase the destination device
before creating the filesystem on that device.

Ivan Shapovalov (1):
  mkfs: implement discarding device at filesystem creation time.

 progs/mkfs/mkfs.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

-- 
1.9.2

