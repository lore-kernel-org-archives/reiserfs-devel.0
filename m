From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 corruption.
Date: Sat, 01 Nov 2014 13:47:07 +0100
Message-ID: <5454D64B.1070700@gmail.com>
References: <5453BACD.8040801@gmail.com> <5453C63B.5020808@gmail.com> <5454C129.3020103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=jrgTZsDudc5A0v6DL1sEQYGn2wL2ftvR/uv0VjAjJtA=;
        b=MR8gzGIlykDNoZARX93XMgngo5M6YXTvx7rwlO9IPooAyb5Ka1zxZZVWj78ZVjyYC3
         a/eudgJUIHZIZv07HKzDD8RfiF5uOgUWAhaEm0/APYqayAEbD8KWyttX2PUYu9SrYDIj
         zpi5yPAH/PwPCl8KBFRASw7mZnWD13odLRGy70HgIIoQpcv8ac26P+rZF0D8ZEqHF61r
         Xf8NgajJysSzVfyH3LFyjhQc4LDjDvWgFqh5WS87ENR6AtHqCDFZioKqcBDXVhXfeQ6l
         Ioz1F8X5cMuJM8KnYk8TNSsBQ8R5HNs8RMQfY6jWTACPAFxTuZZ3zmLBwnW7hiloM9zN
         e6og==
In-Reply-To: <5454C129.3020103@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>, reiserfs-devel@vger.kernel.org


On 11/01/2014 12:16 PM, dE wrote:
> On 10/31/14 22:56, Edward Shishkin wrote:
>> On 10/31/2014 05:37 PM, dE wrote:
>>> Hi!
>>>
>>
>>
>> Hello.
>>
>>
>>> I've encountered a corruption again.
>>>
>>> This's what I get when accessing a certain file --
>>>
>>> [ 2449.493892] reiser4[gwenview(7968)]: dc_check_checksum 
>>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>>> -1553131906) Fsck?
>>>
>>> [ 2449.493898] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>> [ 2449.493926] reiser4[gwenview(7968)]: dc_check_checksum 
>>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>>> -1553131906) Fsck?
>>>
>>> [ 2449.493929] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>> [ 2449.493971] reiser4[gwenview(7968)]: dc_check_checksum 
>>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>>> -1553131906) Fsck?
>>>
>>> [ 2449.493974] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>> [ 2449.494145] reiser4[gwenview(7968)]: dc_check_checksum 
>>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>>> -1553131906) Fsck?
>>>
>>> [ 2449.494157] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>>
>>> This again happened with the .mozilla/firefox dir.
>>>
>>> Anything I can do to report?
>>
>>
>> Which kernel version?
>> Is it annoying (reproducible)?
>>
>> Thanks,
>> Edward.
>
> 3.14.8


What is the name of the file with Inode 3109170?
You can find out this by the following way:
$ find ~/ -inum 3109170

Also I would ask you to
1) fsck you partition with the option --build-fs;
2) send me the fsck logs;
3) upgrade you kernel to 3.16 or later, or build a new one with the 
following patch applied:
     http://marc.info/?l=reiserfs-devel&m=141176163530650&w=2
4) let me know, if the problem hasn't gone away.

Thanks,
Edward.


>
> It doesn't come up frequently.
>
> Last time I reported this --
>
> http://www.spinics.net/lists/reiserfs-devel/msg03797.html
>
> Which seems to be related.
> -- 
> To unsubscribe from this list: send the line "unsubscribe 
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

