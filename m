From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4[StorageManager(2383)]: lzo1_alloc...
Date: Wed, 30 Aug 2017 11:29:36 +0200
Message-ID: <4908fc4e-583f-1507-7184-901681dcd263@gmail.com>
References: <20170820171513.B783215FEAF@huitzilopochtli.metztli-it.com>
 <599C7CB1.6080408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=J/lvxHOlh606W3ficIuxj6ekc8EZwfETbCuJ5TZoTZc=;
        b=c0wGJ2DeDwvLvyveEnj3xRvIcc6pgpORnnmCXA66uZIFwMnDUnQ0YLtIY+uqvgs6k/
         PcvpFsQVviQYHMpMRjW2k7gnEWiDuW0Y8juVQto16O6N1MUSgqdTBx6vTc1/bHEtTw2Y
         wfwL7+J83iqtX1x02crTfc2jkw2KWuRbYTzP0yBiAxfEVOB/61/lwsbsh4KYSVN4tC3b
         A20kAv73bhUeFLcla/a8X52Mys4PZIN0PXsb1OS7i1TIy/qPyBg3zafKD3vHXnXVBSY+
         ZFao499DqCutHNVOYlCxYCBvSNL8vYyBw/jqYkGXmKGomLhbqx5FqaJsYJaB3eYWa89d
         FREg==
In-Reply-To: <599C7CB1.6080408@gmail.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Mathieu Belanger <admin@korinar.com>

On 08/22/2017 08:49 PM, Edward Shishkin wrote:
> Hello,
>
> Please, try the attached patches.
> The first patch improves responsiveness to vm subsystem
> (modified version of ->migratepage()

Hi all,

I found that the first patch leads to system lockups after ~1 hour of 
stress-testing.
This is a side effect of appearing of non-parsed jnodes in writeback 
queues for some
reasons. So please, drop it for now..

Thanks,
Edward.

> The second patch performs memory allocation in the critical
> place with __GFP_NOFAIL flag.
> Let us know about results.
>
> Thanks,
> Edward.
>
> On 08/20/2017 07:15 PM, Metztli Information Technology wrote:
>> Niltze, Ed-
>>
>> Although I am using your latest Reiser4 patch for Linux kernel 4.12.x 
>> on a test 1.2TB (transparent compression) reiser4 root fs, I have seen
>> dmesg generate the following in lesser version patches and in much 
>> smaller partitions, i.e., 20Gb -- with transparent compression, too.
>>
>> Your input would be greatly appreciated:
>>
>> [ 3449.944653] reiser4[StorageManager(2383)]: lzo1_alloc 
>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>                 WARNING: alloc workspace for lzo1 (tfm action = 1) 
>> failed
>>
>> [ 3449.944674] reiser4[StorageManager(2383)]: lzo1_alloc 
>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>                 WARNING: alloc workspace for lzo1 (tfm action = 1) 
>> failed
>>
>> [ 3449.944694] reiser4[StorageManager(2383)]: lzo1_alloc 
>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>                 WARNING: alloc workspace for lzo1 (tfm action = 1) 
>> failed
>>
>> [ 3449.944715] reiser4[StorageManager(2383)]: lzo1_alloc 
>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>                 WARNING: alloc workspace for lzo1 (tfm action = 1) 
>> failed
>>
>> [snip]
>> ( the above replicate for about two(2) thousand lines )
>>
>> Please note that the error above is not immediate but is triggered 
>> possibly by multiple events run simultaneously, i.e.,
>>   plugged 1TB USB hard disk with multiple partitions where copy 
>> operation to local disk is being run; another copy operation to-from 
>> local hard
>> disk itself on same filesystem; installing additional packages, 
>> building local software, etc.
>>
>> Subsequently system slows down in latency and fan use increases in 
>> all instances.
>>
>> Thank you in advance for your insight.
>>
>>
>> Best Professional Regards.
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe 
>> reiserfs-devel" in
>> the body of a message tomajordomo@vger.kernel.org
>> More majordomo info athttp://vger.kernel.org/majordomo-info.html
>

