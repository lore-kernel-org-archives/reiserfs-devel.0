From: dE <de.techno@gmail.com>
Subject: Re: Reiser4 corruption.
Date: Sat, 01 Nov 2014 16:46:57 +0530
Message-ID: <5454C129.3020103@gmail.com>
References: <5453BACD.8040801@gmail.com> <5453C63B.5020808@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=/A1ila11NnmAealFYftQL1FbOU44l8E6qwwq7/+mW+s=;
        b=z48Is4SNyNnHbf7oODGmwtkAr+27VRG6XYyyxzlRqZP8hbJLRhecht8xEjaD7eetj+
         0ltU9zBxeO9K+LHwxUvsshB7w9L2rzehONGp40/7WVYSROh4M2ZLtP04WQoaJX3jHV3w
         WvBGVBgH6704QY7K2fGTnVNgX5AWbxt2LrKrOHNuK+LRr7WvZL3beiekz+Mh60FwT2MP
         PdEctrXfWaKDRTg+3gbxk4MSxa7CmudMyeJ5QUWDM3sKqLUN9b1PvCMJNjaIu4DH5LxB
         lzyKnNAoNHGecf4E7gTO77SN04Gx2PQbEzEUIXt1yLGkG0sPN4BLDRnPL6NX/b5FiotV
         nxUw==
In-Reply-To: <5453C63B.5020808@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 10/31/14 22:56, Edward Shishkin wrote:
> On 10/31/2014 05:37 PM, dE wrote:
>> Hi!
>>
>
>
> Hello.
>
>
>> I've encountered a corruption again.
>>
>> This's what I get when accessing a certain file --
>>
>> [ 2449.493892] reiser4[gwenview(7968)]: dc_check_checksum 
>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>> -1553131906) Fsck?
>>
>> [ 2449.493898] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>> [ 2449.493926] reiser4[gwenview(7968)]: dc_check_checksum 
>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>> -1553131906) Fsck?
>>
>> [ 2449.493929] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>> [ 2449.493971] reiser4[gwenview(7968)]: dc_check_checksum 
>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>> -1553131906) Fsck?
>>
>> [ 2449.493974] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>> [ 2449.494145] reiser4[gwenview(7968)]: dc_check_checksum 
>> (fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
>> WARNING: Bad disk cluster checksum -1008173184, (should be 
>> -1553131906) Fsck?
>>
>> [ 2449.494157] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
>> (fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
>> WARNING: Inode 3109170: disk cluster 0 looks corrupted
>>
>> This again happened with the .mozilla/firefox dir.
>>
>> Anything I can do to report?
>
>
> Which kernel version?
> Is it annoying (reproducible)?
>
> Thanks,
> Edward.

3.14.8

It doesn't come up frequently.

Last time I reported this --

http://www.spinics.net/lists/reiserfs-devel/msg03797.html

Which seems to be related.
