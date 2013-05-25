From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.9
Date: Sat, 25 May 2013 19:40:56 +0200
Message-ID: <51A0F7A8.6030600@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=7xUfeLgtmY7bcqBbYOZ59DaODWoIQd4mE1gzZ8IzJ6A=;
        b=M7G2nj2+RcIyJWdA+EXqVMTLUUPnAf4UqyIaDfpcrB2CfbdIuV0iu2potLEhoDqzRK
         6lOGLYRHhVt/kSgrwRE/wazuwWZO9K7dIx6HYLELcysbqggMCOdSGQgmv2RbWXjRVBpq
         V8FWssuNqu7HpoB7I/HMYNX+a6r/KYBCkTyCGV4AJHCMbuR9nMWpCumb7DgQqKSC9fT9
         cVS5ZOthj8w0tn+cD5MysjdRWAfF995xr4z5u9MeBFNbpA2EG6RPfIWJ5ORkHUIJHxu7
         ZHAThflBcTI7X0ERtHnCq3sbrEif9ztTuBFx16HimMukPRMRUXetjKcx010a9PbPhC2u
         3C6A==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Changes since reiser4-for-3.7:

Ivan Shapovalov

. port for linux-3.8;
. port for linux-3.9:
   . do not depend on EXPERIMENTAL;
   . reposition PF_FLUSHER bit.

Edward Shishkin

. Fixed assertion (false positive) in balance_dirty_page_cluster();
   don't throttle writes, if no pages were dirtied;
. Remove bugop stubs in directory address space operations.

Please, find here:
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Thanks,
Edward.
