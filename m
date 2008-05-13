From: Maciej Soltysiak <maciej@soltysiak.com>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 08:36:38 +0200
Message-ID: <482936F6.1020009@soltysiak.com>
References: <loom.20080512T225740-889@post.gmane.org> <5ac301dfeac0d00ba1e2b281d90be66d@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5ac301dfeac0d00ba1e2b281d90be66d@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi,

I haven't looked at r4 development for a while now and I have a few 
questions.
> Default profile:                                                                                    
> create:          "reg40"           (id:0x0 type:0x0)    [Regular file plugin for creat(2)]          
> key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]                                
> compress:        "lzo1"            (id:0x0 type:0xc)    [Compression plugin]                        
> compressMode:    "conv"            (id:0x4 type:0xd)    [Compression Mode plugin]                   
> [...]
>
> I am confused, does reg40 means no compression, or does the compress lzo1 being there means compression?
>   
Is it possible to create a regular r4 partition and choose which files 
keep compressed (how?)
or do I have to create a all-compressed partition?

To play with compression can I just use the standard patch from
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/ 
?

Does this patch include also file-as-directory stuff?

BTW it might be good to change the *Reiser4 is released!* message on

        http://reiser4.erudified.com/install_v4.html

to at least point to

        
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/

instead of giving a 404.

Best regards,
Maciej

