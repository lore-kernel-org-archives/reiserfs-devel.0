From: John <geearf@free.fr>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 02:04:47 +0200
Message-ID: <5ac301dfeac0d00ba1e2b281d90be66d@free.fr>
References: <loom.20080512T225740-889@post.gmane.org>
Reply-To: geearf@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20080512T225740-889@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org



On Mon, 12 May 2008 23:01:50 +0000 (UTC), Mat <jackdachef@gmail.com> wrote:
> Hi,
> 
> sure,
> 
> debugfs.reiser4 -p /dev/foo
> 
> should print everything needed
> 
> Regards
> 
> Mat
>

debugfs.reiser4 1.0.6                                                                               
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by reiser4progs/COPYING.                 
                                                                                                    
Default profile:                                                                                    
create:          "reg40"           (id:0x0 type:0x0)    [Regular file plugin for creat(2)]          
key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]                                
compress:        "lzo1"            (id:0x0 type:0xc)    [Compression plugin]                        
compressMode:    "conv"            (id:0x4 type:0xd)    [Compression Mode plugin]                   
cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin]                            
hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entry hash plugin]               
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration plugin]                      
formatting:      "smart"           (id:0x2 type:0x5)    [File body formatting plugin]
Error: Device is mounted 'rw' at the moment. Use -f to force over.

I am confused, does reg40 means no compression, or does the compress lzo1 being there means compression?

Thanks

