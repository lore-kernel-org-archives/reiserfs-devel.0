From: dE <de.techno@gmail.com>
Subject: Re: Reiser4 corruption.
Date: Sat, 01 Nov 2014 21:35:14 +0530
Message-ID: <545504BA.9070206@gmail.com>
References: <5453BACD.8040801@gmail.com> <5453C63B.5020808@gmail.com> <5454C129.3020103@gmail.com> <5454D64B.1070700@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=RCOXYpaPMdpnDeSAqx+B++SUNLrGqgjYF1UNFUaSitQ=;
        b=u8EHvsWiQvySXT9ftD3oIJLCT3QvUvW1/++6ysDnRTEo624wQFM7lj6VD/TzfkdExr
         uh9q45WCJ/CatY2q5PbtVr8yecn+DNuQjgkTCc7vjg1uCHu7iz3me2vH6NyGbpSizul9
         3kqzxP/LN+EfYS3UslOBms8GjB+MHMX4M+kLnCTp+GuQlGqfAgsyWNoqZv9ICCcc5sBo
         DY5TH9HflTmWOq4+Ob+7c+3A5VJhIvTdzfIHVSAnqLXkaWG0rMmb9WIx/HKZh/UiDxmS
         IY96YrJPaTP/QJ1bzqgVh8mWRy/Me7PxMhL4AYolOm66tZsHShBgumIduoZ7EOJkWB6+
         pEhQ==
In-Reply-To: <5454D64B.1070700@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 11/01/14 18:17, Edward Shishkin wrote:
>
> On 11/01/2014 12:16 PM, dE wrote:
>> On 10/31/14 22:56, Edward Shishkin wrote:
>>> On 10/31/2014 05:37 PM, dE wrote:
>>>> Hi!
>>>>
>>>
>>>
>>> Hello.
>>>
>>>
>>>> I've encountered a corruption again.
>>>>
>>>> This's what I get when accessing a certain file --
>>>>
>>>> [ 2449.493892] reiser4[gwenview(7968)]: dc_check_checksum 
>>>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>>>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>>>> -1553131906) Fsck?
>>>>
>>>> [ 2449.493898] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>>>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>>>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>>> [ 2449.493926] reiser4[gwenview(7968)]: dc_check_checksum 
>>>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>>>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>>>> -1553131906) Fsck?
>>>>
>>>> [ 2449.493929] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>>>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>>>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>>> [ 2449.493971] reiser4[gwenview(7968)]: dc_check_checksum 
>>>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>>>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>>>> -1553131906) Fsck?
>>>>
>>>> [ 2449.493974] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>>>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>>>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>>> [ 2449.494145] reiser4[gwenview(7968)]: dc_check_checksum 
>>>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>>>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>>>> -1553131906) Fsck?
>>>>
>>>> [ 2449.494157] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>>>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>>>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>>>
>>>> This again happened with the .mozilla/firefox dir.
>>>>
>>>> Anything I can do to report?
>>>
>>>
>>> Which kernel version?
>>> Is it annoying (reproducible)?
>>>
>>> Thanks,
>>> Edward.
>>
>> 3.14.8
>
>
> What is the name of the file with Inode 3109170?
> You can find out this by the following way:
> $ find ~/ -inum 3109170
>
> Also I would ask you to
> 1) fsck you partition with the option --build-fs;
> 2) send me the fsck logs;
> 3) upgrade you kernel to 3.16 or later, or build a new one with the 
> following patch applied:
> http://marc.info/?l=reiserfs-devel&m=141176163530650&w=2
> 4) let me know, if the problem hasn't gone away.
>
> Thanks,
> Edward.
>
>
>>
>> It doesn't come up frequently.
>>
>> Last time I reported this --
>>
>> http://www.spinics.net/lists/reiserfs-devel/msg03797.html
>>
>> Which seems to be related.
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe 
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>

Yes, that's how I came to know this was a problem with the FF 
configuration directory. It's an image (snapshot of one of the entries 
in the new tab page in FF). Last time it was also an image.

I've hardlinked that image to another place and remove the original copy.

I'll return to you.
