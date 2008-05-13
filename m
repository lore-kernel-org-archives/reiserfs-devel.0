From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 12:53:59 +0400
Message-ID: <48295727.9050909@gmail.com>
References: <loom.20080512T225740-889@post.gmane.org> <5ac301dfeac0d00ba1e2b281d90be66d@free.fr> <482936F6.1020009@soltysiak.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <482936F6.1020009@soltysiak.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Maciej Soltysiak <maciej@soltysiak.com>
Cc: reiserfs-devel@vger.kernel.org

Maciej Soltysiak wrote:

> Hi,
>
> I haven't looked at r4 development for a while now and I have a few 
> questions.

[...]

>>
>> I am confused, does reg40 means no compression, or does the compress 
>> lzo1 being there means compression?
>>   
>
> Is it possible to create a regular r4 partition and choose which files 
> keep compressed (how?)


Not yet.
There is a (deprecated) pseudo-file interface, which allows to set
compression et al per directory (the latest patch is against 2.6.13).

> or do I have to create a all-compressed partition?


Yes.
Reiser4 has means to automatically reduce cpu and memory usage on
incompressible data.

With the default plugin scheduler (compressMode: "conv") conversion
will be performed in 2 interfaces:
1. FILE: convert cryptcompress to unix-file plugin;
2. COMPRESS: turn on/off compression in flush time.

However, this scheduler uses very simple heuristics which work
incorrectly on various media files, etc.. I believe it can be improved
to process 80-90% of _all_ files properly.

>
> To play with compression can I just use the standard patch from
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/ 
> ?
>

Yes.

> Does this patch include also file-as-directory stuff?


No, this stuff was removed (see my comment about pseudo-file interface 
above)

>
> BTW it might be good to change the *Reiser4 is released!* message on
>
>        http://reiser4.erudified.com/install_v4.html
>
> to at least point to
>
>        
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/ 
>
>
> instead of giving a 404.


This is a temporal place for Hans's whitepaper.
I don't have a time to fix all the links to work properly.

Thanks,
Edward.
