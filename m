From: <doiggl@velocitynet.com.au>
Subject: Re: ls: reading directory .: Input/output error on reiser4 partition
Date: Tue, 12 Apr 2011 22:37:22 +1000
Message-ID: <3902b176fc930c92f7de292ffced6760@mail.velocitynet.com.au>
References: <bbbd01a6540b1e8806d343871853ef25@mail.velocitynet.com.au> <4DA308C3.30304@gmail.com> <e1e039f5a7cc6feeae0eb475c0c9204e@mail.velocitynet.com.au> <4DA322AF.4050004@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4DA322AF.4050004@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Mon, 11 Apr 2011 17:47:59 +0200, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 04/11/2011 05:32 PM, doiggl@velocitynet.com.au wrote:
>> On Mon, 11 Apr 2011 15:57:23 +0200, Edward Shishkin
>> <edward.shishkin@gmail.com>  wrote:
>>> On 04/11/2011 03:50 PM, doiggl@velocitynet.com.au wrote:
>>>> Hello
>>>> I get this error on a Reiser4 disk:
>>>>
>>>> What are the commands to
>>>> - check disk structure
>>>
>>>
>>> make sure /dev/sdd is unmounted, or mounted read-only;
>>> fsck.reiser4 /dev/sdd
>>>
>>>
>>>> - list any errors
>>>> - repair errors
>>>>
>>>> I am using Reiser4 vers 2.6.38
>>>> Build log
>>>>
>>
->https://build.opensuse.org/package/binaries?package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_11.4
>>>>
>>
>> Hello
>> Thanks for the info
>> I did the following
>> - installed reiser4progs
>> - umount  /dev/sdd
>>
>> This next step will take a long time [in progress] Its at 0%
>> -I'll reply later with full result, its checking 1.2 TB data and> 
>> 250,000
>> files
> 
> 
> Reiser4 doesn't have production stability so far,
> so, creating large reiser4 volumes is not a good idea.
> 
> An old nasty bug still lives in reiser4 kernel module
> (appearing objects with inconsistent key order).
> Fsck will cope with this kind of corruption, however,
> it will take a lot of time.
> 
> Thanks,
> Edward.

> 
>> What I have so far.
>> Glenn
>>
>> # fsck.reiser4 /dev/sdd
>> *******************************************************************
>> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>> *******************************************************************
>> ***** fsck.reiser4 started at Tue Apr 12 01:18:23 2011
>> Reiser4 fs was detected on /dev/sdd.
>>
>>
>> Master super block (16):
>> magic:          ReIsEr4
>> blksize:        4096
>> format:         0x0 (format40)
>> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
>> label:<none>
>>
>> Format super block (17):
>> plugin:         format40
>> description:    Disk-format plugin.
>> version:        0
>> magic:          ReIsEr40FoRmAt
>> mkfs id:        0x1ddaf754
>> flushes:        0
>> blocks:         488378640
>> free blocks:    184741937
>> root block:     240062537
>> tail policy:    0x2 (smart)
>> next oid:       0xe6e2d
>> file count:     254746
>> tree height:    6
>> key policy:     LARGE
>>
>>
>> CHECKING THE STORAGE TREE 0%
>> FSCK: node.c: 108: repair_node_items_check: Node (7616539), items (6)
and
>> (7): Wrong order of keys.
>>
>> FSCK: filter.c: 407: repair_filter_update_traverse: Node (7616539): the
>> node is broken. Pointed from the node (35239054), item (12), unit (0).
>> The whole subtree is skipped.
Hello
Can a single directory be repaired or has the whole disk structure be
repaired in one pass ?
What is the command to repair disk structure.
Thanks 
