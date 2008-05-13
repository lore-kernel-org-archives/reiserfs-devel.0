From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 11:53:19 +0400
Message-ID: <482948EF.7030502@gmail.com>
References: <loom.20080512T225740-889@post.gmane.org> <5ac301dfeac0d00ba1e2b281d90be66d@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5ac301dfeac0d00ba1e2b281d90be66d@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: geearf@free.fr
Cc: reiserfs-devel@vger.kernel.org

John wrote:
 >debugfs.reiser4 1.0.6
 >Copyright (C) 2001-2005 by Hans Reiser, licensing governed by 
reiser4progs/COPYING.
 >
 >Default profile:
 >create:          "reg40"           (id:0x0 type:0x0)    [Regular file 
plugin for creat(2)]
 >key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
 >compress:        "lzo1"            (id:0x0 type:0xc)    [Compression 
plugin]
 >compressMode:    "conv"            (id:0x4 type:0xd)    [Compression 
Mode plugin]
 >cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin]
 >hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory 
entry hash plugin]
 >fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration 
plugin]
 >formatting:      "smart"           (id:0x2 type:0x5)    [File body 
formatting plugin]
 >Error: Device is mounted 'rw' at the moment. Use -f to force over.
 >
 >I am confused, does reg40 means no compression, or does the compress 
lzo1 being there means compression?

The first statement is correct.

The above is initial vector of plugins that will be installed by
mkfs.reiser4 to the root directory when formatting a partition
(and then propagated through the semantic tree by the system).
So, actually the option "-p" makes sense only for mkfs utility,
I don't know why other utilities (debugfs, fsck) also show this:
IMHO not a very good idea.

This option is to show resulted vector of plugins _before_ formatting
a partition. Sometimes it is convenient to see what you'll actually
have (especially if you want to override some default values). For
example, "mkfs.reiser4 -p -o create=ccreg40,compress=gzip1" will show:

create:          "ccreg40"         (id:0x4 type:0x0)    [Regular file 
plugin for creat(2)]
key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
compress:        "gzip1"           (id:0x1 type:0xc)    [Compression plugin]
compressMode:    "conv"            (id:0x4 type:0xd)    [Compression 
Mode plugin]
cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin]
hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entry 
hash plugin]
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration 
plugin]
formatting:      "smart"           (id:0x2 type:0x5)    [File body 
formatting plugin]

Note, that "compress", "compressMode" and cluster" settings make
sense only with "ccreg40" installed.
Also "formatting" makes sense only with "reg40" installed.
Such dependencies are not well documented, so please keep them in
mind for now..

Edward.
