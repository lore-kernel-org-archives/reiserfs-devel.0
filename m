From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: What can I do next to use R4 partition  sdb
Date: Wed, 27 Aug 2014 14:56:05 +0200
Message-ID: <53FDD565.6030500@gmail.com>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop> <458361e3164a300c930420b3dd9e5b43@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=bTgludGzVlpmPwihRhqv3SKmXdjIcG6R9nvkGGo+OxA=;
        b=J07aYFQ2Q1F4p4fYppeOfUh6mkakMYPfK3SLsISTDDY1YPQHYGb+EMQZa0vxz5epR7
         z/T607lH8pHq2JkSz2u5eOkvu3Z4No2pPOwJbxhURTsnMIEEfX5JtjFLQJXrnzVEUuGU
         /y7piYIvjnqKffzZEUtXwZjbWxDdo7AoUd0mdrNDlvsj0YZEvBA5d8VBrxIkfDuzC2k0
         XXsvp8lB0M7e6AE8z2OhvV/hwhvt2eZ1GGqRWnXDHEFndK/+C07pNwemt2bLbUYqoOvh
         cZ1yXdC++z/gAt5mAAJtOlQiXOJ3GdbdOolgJlGz7Z+4TOrh4iYLuFdAbWM/lx38EE9c
         WE6A==
In-Reply-To: <458361e3164a300c930420b3dd9e5b43@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

On 08/27/2014 09:33 AM, doiggl@velocitynet.com.au wrote:
>> Looks like the filesystem is damaged. Make sure that reiser4progs are
>> installed
>> and run
>>
>> # fsck.reiser4 --build-fs /dev/sdb
>>
>> (You may need to use --force because apparently you have R4 on a whole
>> disk,
>> not on a partition.)
>>
>> Hope that helps,
> #
>
> Hello,
> Thanks for the details.
>
> I did the fpllowing steps:
> # fsck.reiser4 --build-fs --force  /dev/sdb
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/sdb block device.
>                                                                            
>                                                                            
>             
> Will check the consistency of the Reiser4 SuperBlock.
>                                               
> Will build the Reiser4 FileSystem.
>                                               
> ***** fsck.reiser4 started at Tue Aug 26 17:22:24 2014
> Reiser4 fs was detected on /dev/sdb.
>                                               
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
> label:          <none>
>   
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        0
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x1ddaf754
> flushes:        0
> blocks:         488378640
> free blocks:    217146980
> root block:     37017218
> tail policy:    0x2 (smart)
> next oid:       0xedade
> file count:     188313
> tree height:    6
> key policy:     LARGE
>   
>   
> CHECKING THE STORAGE TREE
>                                               
>          Read nodes 197008413
>                                               
>          Nodes left in the tree 197008413
>                                               
>                  Leaves of them 194764277, Twigs of them 2217790
>                                               
>          Time interval: Tue Aug 26 17:24:21 2014 - Wed Aug 27 01:25:31 2014
>                                               
> CHECKING EXTENT REGIONS.
>                                               
>          Read twigs 2217790
>                                               
>          Time interval: Wed Aug 27 01:25:31 2014 - Wed Aug 27 03:35:39 2014
>                                               
> LOOKING FOR UNCONNECTED NODES
>                                               
> FSCK: node.c: 108: repair_node_items_check: Node (43828275), items (0) and
> (1): Wrong order of keys.
> FSCK: node.c: 108: repair_node_items_check: Node (52697435), items (79)
> and (80): Wrong order of keys.
> FSCK: node.c: 108: repair_node_items_check: Node (63227569), items (24)
> and (25): Wrong order of keys.
> FSCK: node.c: 108: repair_node_items_check: Node (63227571), items (73)
> and (74): Wrong order of keys.
> FSCK: node.c: 108: repair_node_items_check: Node (116595727), items (20)
> and (21): Wrong order of keys.
> FSCK: node.c: 108: repair_node_items_check: Node (227923161), items (22)
> and (23): Wrong order of keys.
> FSCK: node.c: 108: repair_node_items_check: Node (284305753), items (61)
> and (62): Wrong order of keys.
>          Read nodes 1481038
>                                             
>          Good nodes 471512
>                  Leaves of them 466164, Twigs of them 5348
>          Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27 03:39:46 2014
>
> ***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
> Closing fs...done
>
> FS is consistent.


This is a bug in fsck: it jumps to wrong branch for some reasons.
Not yet fixed.

Edward.
