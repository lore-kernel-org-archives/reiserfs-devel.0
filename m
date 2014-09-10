From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 (ccreg40): very slow mount, poor unlink performance,
 questions about compression modes
Date: Wed, 10 Sep 2014 22:17:15 +0200
Message-ID: <5410B1CB.3080705@gmail.com>
References: <1466481.l6KPymqJEh@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=0vsKV3bKFPCfVFqvJ0Z3rUgu745vNWMQquDV2sSC9RM=;
        b=YI/6I2VUSV/CFKj35mBO6gDo9Xrm6LtlXGSkbxwnTxn1ZknIUsac/AzOjgy/0Ihi3g
         tvphs5obvShgqDGzoZIQ5ju9VlFvyYh0dmYJ9bnf5OhemfKspRVpX8WqL7owPLFQauZ5
         gD+P+QL8gG/sI7W1SfqPzFz9dJ4qzgYqEcXZXFCQMR8+1Tc3ORMP5WMNXuklscfMN82E
         g2Skd7vth/iYAKRwFgPj6J5qxx5bBGgvUz3V8tfNqsfM05RQdrcfRWeDok0IXQliK5We
         uinhN03qnaHsl+BKujxVRyRXV4o+FupaH7U5Lvp57+gtL9jTtbCvFySrwCOM2i5zfKce
         HzIQ==
In-Reply-To: <1466481.l6KPymqJEh@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

On 09/10/2014 09:00 PM, Ivan Shapovalov wrote:
> Hi!
>
> The preamble: recently I had to force-change my configuration (the old laptop
> was stolen). What I have now is a combination of a tiny 16 GiB SSD and a huge
> 1 TiB HDD.
>
> ...So I've placed my /home on HDD. Partition size is 800 GiB, formatting
> options are "create=ccreg40,compress=gzip1,compressMode=latt" and I have a few
> questions.
>
> 1. What is the recommended compression mode?


The default one (conv).


> More specifically, what is the default "conv" mode? What is its purpose, why is
> it the default?


In this mode intelligent switches take place in 2 interfaces:
1) in FILE interface (if the first 64K of the file are incompressible, then
     management is passed to unix-file plugin forever);
2) in COMPRESSION interface (turn on/off compression transform
     on a dynamic lattice).

In other compression modes switches take place only in COMPRESSION
interface.


> I'm asking, because I wasn't able to understand its purpose from code, and the
> code itself looks hackish in some places (hardcoded fallback to extent-only
> files,


Actually, this is implementation of a compression mode, not a hardcoded
fallback.


>   hardcoded policy, hardcoded fallback to "latt" in many cases, etc).


ditto


>
> 2. The mount time of a 800-GiB partition is >20 seconds. And with
> dont_load_bitmap it's around 1-2 seconds. Why so much?


By default all bitmap blocks are loaded to memory at mount time.
Now calculate a number of bitmap blocks for 800-GiB partition that
should be read from disk.



>   Why other filesystems
> have drastically less mount times? If they have an equivalent of
> dont_load_bitmap enabled by default, why don't we do it?


For historical reasons. I recommended to not use large partitions
for reiser4, so there wasn't any need in this option.


>
> 3. Given a directory tree with ~20k files of total size around 20 GiB,
> its removal takes forever. From strace I see that a single unlink takes
> ~1 second. Again, why so much? Is it related to my choice of "latt" compression
> mode over the default "conv"?


Yes, in particular.
"latt" means that all file bodies are represented by fragments in 
formatted nodes.


>
> 3a. I can reproduce the "directory not empty" bug :) Interestingly, it is
> always the same directory under the aforementioned huge hierarchy. (I've
> done the unpack-remove cycle a few times.)


I've made a conclusion that this is caused by unexpected disappearing
of a record, which represents a directory entry in the directory item
(currently directory items are managed by cde ITEM plugin, aka "compound
directory entries"). In the error path (ENOENT) the size of the directory is
not decremented, which makes the directory undeletable. I still don't know
who kills the entries. Special debugging info is needed to find/fix it.

Thanks,
Edward.
