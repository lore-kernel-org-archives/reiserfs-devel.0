From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 (ccreg40): very slow mount, poor unlink performance,
 questions about compression modes
Date: Wed, 10 Sep 2014 23:26:30 +0200
Message-ID: <5410C206.2020202@gmail.com>
References: <1466481.l6KPymqJEh@intelfx-laptop> <5410B1CB.3080705@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=E8WkELHzQd5uEHq1Rz6PRJzkeuPH/oSNeXxhXrSBHas=;
        b=njcnCHwLrPQDXkO/D+8IiWtVNusFJslc7Kak3XJbA6Vla5Z58YPrskT20UTNlGylju
         Z8TcJZghhQ27tJeR53ePXfI8uxXXZd2ZpU2SzuvS9bdurNSbmnKsEp8z7SH3gVBhPZc/
         la40cFTFC06mPJnD5VsZIrk2QBrRRZqc7Dj7tBzQOanOpEnIT3qcjid3NJ4tLyvs0Ht0
         J00UeCd/bI+XwDXhe2X7lB+gKi08dVDOUtFgTlsYwhbPdVCQ6Eb+1B34leAMF1GLQRsZ
         XIAm9aybpQhahTv8ZvLPbuwk/YpnzWwHar6BTP9DTERBLIhUpdEdo4WwndjQZJHcC0We
         yGQw==
In-Reply-To: <5410B1CB.3080705@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>


On 09/10/2014 10:17 PM, Edward Shishkin wrote:
> On 09/10/2014 09:00 PM, Ivan Shapovalov wrote:
>> Hi!
>>
>> The preamble: recently I had to force-change my configuration (the 
>> old laptop
>> was stolen). What I have now is a combination of a tiny 16 GiB SSD 
>> and a huge
>> 1 TiB HDD.
>>
>> ...So I've placed my /home on HDD. Partition size is 800 GiB, formatting
>> options are "create=ccreg40,compress=gzip1,compressMode=latt" and I 
>> have a few
>> questions.
>>
>> 1. What is the recommended compression mode?
>
>
> The default one (conv).
>
>
>> More specifically, what is the default "conv" mode? What is its 
>> purpose, why is
>> it the default?
>
>
> In this mode intelligent switches take place in 2 interfaces:
> 1) in FILE interface (if the first 64K of the file are incompressible, 
> then
>     management is passed to unix-file plugin forever);
> 2) in COMPRESSION interface (turn on/off compression transform
>     on a dynamic lattice).
>
> In other compression modes switches take place only in COMPRESSION
> interface.
>
>
>> I'm asking, because I wasn't able to understand its purpose from 
>> code, and the
>> code itself looks hackish in some places (hardcoded fallback to 
>> extent-only
>> files,
>
>
> Actually, this is implementation of a compression mode, not a hardcoded
> fallback.
>
>
>>   hardcoded policy, hardcoded fallback to "latt" in many cases, etc).
>
>
> ditto
>
>
>>
>> 2. The mount time of a 800-GiB partition is >20 seconds. And with
>> dont_load_bitmap it's around 1-2 seconds. Why so much?
>
>
> By default all bitmap blocks are loaded to memory at mount time.
> Now calculate a number of bitmap blocks for 800-GiB partition that
> should be read from disk.
>
>
>
>>   Why other filesystems
>> have drastically less mount times? If they have an equivalent of
>> dont_load_bitmap enabled by default, why don't we do it?
>
>
> For historical reasons. I recommended to not use large partitions
> for reiser4, so there wasn't any need in this option.
>
>
>>
>> 3. Given a directory tree with ~20k files of total size around 20 GiB,
>> its removal takes forever. From strace I see that a single unlink takes
>> ~1 second. Again, why so much? Is it related to my choice of "latt" 
>> compression
>> mode over the default "conv"?
>
>
> Yes, in particular.
> "latt" means that all file bodies are represented by fragments in 
> formatted nodes.


also make sure that debug mode is off..


>
>
>>
>> 3a. I can reproduce the "directory not empty" bug :) Interestingly, 
>> it is
>> always the same directory under the aforementioned huge hierarchy. (I've
>> done the unpack-remove cycle a few times.)
>
>
> I've made a conclusion that this is caused by unexpected disappearing
> of a record, which represents a directory entry in the directory item
> (currently directory items are managed by cde ITEM plugin, aka "compound
> directory entries"). In the error path (ENOENT) the size of the 
> directory is
> not decremented, which makes the directory undeletable. I still don't 
> know
> who kills the entries. Special debugging info is needed to find/fix it.
>
> Thanks,
> Edward.

