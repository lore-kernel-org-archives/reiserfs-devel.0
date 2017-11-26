From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7, Format
 4.0.2
Date: Mon, 27 Nov 2017 00:01:53 +0100
Message-ID: <2cf6aac6-650d-4940-359d-316dc70a183d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=wH2LoMflJG6ylSfLPeBPXG6s5wWavOu7PPD9Cz8q12g=;
        b=g7gy8p4xcFcUdXMsA0E23/Eh+1BRJuC1rivytr0diuma9WHevI76VM0aA4h61KSFP5
         +Nsp1rJno1NXHhQkuJGCjshbFRC/kgOA7sS7N6XJc0aQxJKcCXG4eIBhGqtCtT9DN7gy
         3dWjJjYP3HlxwOtAXZCsiI4yyj8M0bYxzAm9ZbVWV/9kZDmKmSNi41P+AHhbdnY4w/kk
         emA0NXv40IRn/KCbt8TvlYqgs2VMCaTKXnk8d2c3cDF8eqHAGD494Wn0KvmxaNMtvXUH
         Dmfv/+wr3fh6djhWI417FLVocCF94cviFlyyatVlzewRWz/ww/W70CGVFuLx6T2XsF14
         kU6A==
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Hi all,

ZSTD compression support in Reiser4 is brought for you by BratSinot.
We recommend it as a replacement of gzip1. To enjoy ZSTD compression,
please build and install kernel stuff for linux-4.14, reiser4progs-1.2.0,
and specify mkfs option "-o compress=zstd1".

In accordance with Reiser4 development model we announce a new
software framework release 4.0.2 of Reiser4 kernel module and
Reiser4progs. So, before the next mount session please don't forget
to check your old reiser4 partitions by new fsck to update things
(not urgently).

The latest stuff can be found here:
https://sourceforge.net/projects/reiser4/files
https://github.com/edward6/

Thanks,
Edward.

