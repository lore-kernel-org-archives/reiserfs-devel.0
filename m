From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-4.1
Date: Fri, 07 Aug 2015 14:02:18 +0200
Message-ID: <55C49E4A.5000803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=XxQH/scvvCFngusx4AoExYvtmUJ/jQLZa2zS3Nztvhc=;
        b=GjQ7tDtxuMqFnDMl6fB6mTw2VJxkhEL+04nSfJB6vw9mYLLpyBBVLLL8q8SD/LJE2m
         z38Yiyb9CRjW8dj7/EQnwywrM+qiFdy2PSwXztA42LSAmDAdncJetJFLLp5emR6rfGmv
         OhPNO7SD53ODkiq3NcfYFo9qkOFTDgo1A1mK1zuybRu+FTtV9Losk1PPs0TOiJ9exsHB
         ck7TNkaZ+O5xSBiTSWeskcNS+zETTlF5Au1i7oNqQB/7lbxT4QV4K4El5zi9P68xGLDT
         1bUasfNCGE/KynDmK7L1qvjb6yTMUSn68G8d0XGut2qudktuIpbhRozrJpStnfEcYEwY
         falA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Changes since Reiser4 for Linux-4.0.4:

Fixed a problem appearing when running under "no space left on
device". It also could be the reason of sporadic silent non-reproducible
data corruptions, that were reported periodically.

The fixup was backported to Linux-4.0 (see reiser4-for-4.0.9).
If you need a backport for older kernel, then let me know.

Please, find at
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/

Thanks,
Edward.
