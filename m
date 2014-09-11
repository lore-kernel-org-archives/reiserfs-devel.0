From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 (ccreg40): very slow mount, poor unlink performance,
 questions about compression modes
Date: Thu, 11 Sep 2014 19:16:40 +0200
Message-ID: <5411D8F8.2070603@gmail.com>
References: <1466481.l6KPymqJEh@intelfx-laptop> <5410B1CB.3080705@gmail.com> <4194447.EgbZsqfSzA@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=ypiP5naBbWP8cTd1x9KaXWvag25TgOD+XBe2LZxEfts=;
        b=GwuC+PY9qNlFP0FdcEHWm1s4XpA6HMIT/CbDUzRJPcAsgPz+/WZlouCuBjEcCbWMju
         ImbD/tG1q3Vk1ZR0rRbZHb2IqDhKUtPfBMrisWH/tMRp2DfkYBSTkN90UTZxWe6W8TEQ
         t6o2lh7B4LYae1X6bq2hwYxpC/fyhk+2Czhn7DeQeG/z5GhK/PJ1POu8we3lTyCp8J5f
         3aP6ArtBtHqm+Ii3Zyrr7xv7jNEh97n/tlqle69CHqamd1ZGw0+mcQbhBPm+MMVmcZbl
         DwQBvSrQfXldEdD0Had8fB8SHXrbCzNkCki9TZ0/kbbQxdCl/VMXpsfWmXIyJNWTOSD0
         MfEQ==
In-Reply-To: <4194447.EgbZsqfSzA@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>


On 09/10/2014 11:39 PM, Ivan Shapovalov wrote:
> On Wednesday 10 September 2014 at 22:17:15, Edward Shishkin wrote:	
>> On 09/10/2014 09:00 PM, Ivan Shapovalov wrote:
>>> Hi!
>>>
>>> The preamble: recently I had to force-change my configuration (the old laptop
>>> was stolen). What I have now is a combination of a tiny 16 GiB SSD and a huge
>>> 1 TiB HDD.
>>>
>>> ...So I've placed my /home on HDD. Partition size is 800 GiB, formatting
>>> options are "create=ccreg40,compress=gzip1,compressMode=latt" and I have a few
>>> questions.
>>>
>>> 1. What is the recommended compression mode?
>> The default one (conv).
> OK, thanks.
>
>>> More specifically, what is the default "conv" mode? What is its purpose, why is
>>> it the default?
>> In this mode intelligent switches take place in 2 interfaces:
>> 1) in FILE interface (if the first 64K of the file are incompressible, then
>>       management is passed to unix-file plugin forever);
>> 2) in COMPRESSION interface (turn on/off compression transform
>>       on a dynamic lattice).
>>
>> In other compression modes switches take place only in COMPRESSION
>> interface.
>>
>>
>>> I'm asking, because I wasn't able to understand its purpose from code, and the
>>> code itself looks hackish in some places (hardcoded fallback to extent-only
>>> files,
>> Actually, this is implementation of a compression mode, not a hardcoded
>> fallback.
>>
>>
>>>    hardcoded policy, hardcoded fallback to "latt" in many cases, etc).
>> ditto
> Yes, I understand that this is implementation and it doesn't have an obligation
> to be configurable in every aspect... but still it feels somewhat strange.
> E. g. why "extents only" formatting is forced when a file is decided to be
> incompressible?


"extents only" formatting policy was set to facilitate debugging process
when implementing the "conv" compression mode.

When "conv" is set, cryptcompress plugin "sends a signal" to the upper
dispatcher to perform switch to unix-file plugin, which, in turn, performs
switches in the ITEM interface, if "smart" formatting policy is 
installed (this is
"classic" tail conversion: tails to extents, if file size >= 20K, and 
backward).

Setting "extents only", or "tails only" disables the switches.
Why "extents only" instead of "tails only"? When "conv" makes a decision
about the switch, the file is 64K long, so extents are better than tails.

I think that now we can set "smart" instead of "extents only": those
switches won't step on each other.


>   Why the heuristic in FILE interface check (compressible only if
> size can be reduced twice) is different from the one in COMPRESSION interface
> (compressible if size can be reduced at all)?


I wanted to increase the portion of unix-files on the partition. It showed
better performance than the heuristics that performs switches in the
COMPRESSION interface. I still don't have satisfactory explanation of 
this fact.


> (I'm sorry for too many questions. I'm just curious.)
>
>>> 2. The mount time of a 800-GiB partition is >20 seconds. And with
>>> dont_load_bitmap it's around 1-2 seconds. Why so much?
>> By default all bitmap blocks are loaded to memory at mount time.
>> Now calculate a number of bitmap blocks for 800-GiB partition that
>> should be read from disk.
> 25 MiB of bitmaps. 20 seconds still looks strange...
> Are the blocks specially processed? Don't see anything.
>
>>>    Why other filesystems
>>> have drastically less mount times? If they have an equivalent of
>>> dont_load_bitmap enabled by default, why don't we do it?
>> For historical reasons. I recommended to not use large partitions
>> for reiser4, so there wasn't any need in this option.
> OK...
>
>>> 3. Given a directory tree with ~20k files of total size around 20 GiB,
>>> its removal takes forever. From strace I see that a single unlink takes
>>> ~1 second. Again, why so much? Is it related to my choice of "latt" compression
>>> mode over the default "conv"?
>> Yes, in particular.
>> "latt" means that all file bodies are represented by fragments in
>> formatted nodes.
> So... are all cryptcompress files stored in formatted nodes, without
> any equivalent of extents?


Yes, cryptcompress files are composed of items of only one type, so-called
"ctails" (they resembles tails, but have a 1-byte header, which contain size
of file's logical cluster). Unlike unix-file plugin cryptcompress plugin 
doesn't
perform switches in ITEM interface.


>>> 3a. I can reproduce the "directory not empty" bug :) Interestingly, it is
>>> always the same directory under the aforementioned huge hierarchy. (I've
>>> done the unpack-remove cycle a few times.)
>> I've made a conclusion that this is caused by unexpected disappearing
>> of a record, which represents a directory entry in the directory item
>> (currently directory items are managed by cde ITEM plugin, aka "compound
>> directory entries"). In the error path (ENOENT) the size of the directory is
>> not decremented, which makes the directory undeletable. I still don't know
>> who kills the entries. Special debugging info is needed to find/fix it.
> What kind of information is needed?


We need to find all places, where the records are created / killed
and insert a hook, which prints such events for the entry which
unexpectedly disappears. This will get us a chance to find the culprit.
I have to say: this is not a big fun...

Thanks,
Edward.
