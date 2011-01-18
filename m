From: <doiggl@velocitynet.com.au>
Subject: How do I  list  Reiser4 statistics on number of files on r4 partition and disk space used
Date: Wed, 19 Jan 2011 10:32:52 +1100
Message-ID: <5ee8be91243c959b67cf2073736efe35@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello
How do I  list  Reiser4 Statistics on number of files on r4 partition and
disk space used and space saved with compression ?
I can list these items at this time [1]
Thanks Glenn

[1]

# fsck.reiser4 --print-profile /dev/sdb
Default profile:
create:          "reg40"           (id:0x0 type:0x0)    [Regular file
plugin for creat(2)]
key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
compress:        "lzo1"            (id:0x0 type:0xc)    [Compression
plugin]
compressMode:    "conv"            (id:0x4 type:0xd)    [Compression Mode
plugin]
cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin]
hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entry
hash plugin]
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration
plugin]
formatting:      "smart"           (id:0x2 type:0x5)    [File body
formatting plugin]

