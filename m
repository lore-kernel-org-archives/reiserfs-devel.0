From: Morgan Smith <moondog13@gmail.com>
Subject: Flushing like mad
Date: Thu, 18 Jul 2013 12:03:30 -0600
Message-ID: <51E82DF2.8030704@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :x-enigmail-version:content-type:content-transfer-encoding;
        bh=qS5h5z3rv6rBya3ah/QGrTAKqKzZtxDGY/V+LZnAU1E=;
        b=uKU0iEn6B0dVv5U3ZOKjeQ4FXsojYSxkwG+XuhzD+hlcux0hs+lh2yZHDz1PbuP6b5
         MhHIWeaivCdkfhqkpDoiGD/zlWAFgI04y2shbkzeCOIf/ghDcIXA2jI+IgvCzELzi4Rl
         V5YgTVGZji+7RQxA27WNFK/SdanUVwiPnlLPhhXJM1WSwPS3ubkB5t186agdQXD4Rro0
         wyrlEbq0MKISwauehOhqIzuLbGufizpc4efmACJEWc6zEpBZGuTLLHQJQBnuqgtG3bgW
         KnSTGpabrOV1WrslbNMDNR+Qlp3Kt8Pv/32K2/DyTdgD5qIMJPpw/h/FmI+GG1NkOnlb
         2IAg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Good morning.

I have a machine with a reiser4 formatted drive of redundant data on it.
The data is accessed and modified daily as if it were a production
machine except that nobody cares if the data is lost.

I have noticed these warnings in the daily logs:

Jul 14 06:37:08 logan kernel: reiser4[ktxnmgrd:sdb1:r(31883)]: commit_current_atom (fs/reiser4/txnmgr.c:1049)[nikita-3176]:

Jul 14 06:37:08 logan kernel: WARNING: Flushing like mad: 16384


This is even after a file system check with fsck.reiser4 1.0.8 which
reported 0 issues. I don't seem to have any performance issues or data
corruptions though I'd like to provide what information I can regarding
this if it's of any concern. I believe the drive was formatted with the
following options:

create=reg40,hash=tea_hash,fibration=lexic_fibre,formatting=smart


-- Morgan


