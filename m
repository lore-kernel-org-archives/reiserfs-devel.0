From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4progs revision.
Date: Thu, 28 Aug 2014 14:54:58 +0200
Message-ID: <53FF26A2.2060300@gmail.com>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop> <458361e3164a300c930420b3dd9e5b43@mail.velocitynet.com.au> <53FDD565.6030500@gmail.com> <4a7ae00218566234cc327500710d1a61@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=qJ8QQQrmEbbkRf0slwfoEewL0uWiAj5FZN0SN2i+jnc=;
        b=sR/4izbJx3Gq3u2KvBpxWIXy1YEdK6X5iItsh+CrQgkL0B9bTwBKzZx+fQziy+YRfS
         HwgJ9geARqQkwj6lz7zCTuGGRU3MNiEFkwhJj8CXDL1jUK7hJl6/UgnxQUakUN7d7YGE
         0HOUFc9Oi0aH85LB4YX0hpppvAhytB5YWn/LQKH5fWUK+NKW9jiOdnNrvCaoRBU0H0k6
         7JSUHM+pCTPJiTEQdA/Hjaum35Z3cLhlW7Pa4G2v2knxJG+njDjWgan43j5KvN8zFJG2
         bPPDdUaPhdf9Htfq2u75bhXdo3AfnFJD67xddlaDgdNW79H1C+S8vVVKPFCw+Hpnw0Qf
         /ofQ==
In-Reply-To: <4a7ae00218566234cc327500710d1a61@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

On 08/28/2014 04:34 AM, doiggl@velocitynet.com.au wrote:
> On Wed, 27 Aug 2014 14:56:05 +0200, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> On 08/27/2014 09:33 AM, doiggl@velocitynet.com.au wrote:
>>>> Looks like the filesystem is damaged. Make sure that reiser4progs are
>>>> installed
>>>> and run
>>>>
>>>> # fsck.reiser4 --build-fs /dev/sdb
>>>>
>>>> (You may need to use --force because apparently you have R4 on a whole
>>>> disk,
>>>> not on a partition.)
>>>>
>>>> Hope that helps,
>>> #
>>>
>>> Hello,
>>> Thanks for the details.
>>>
>>> I did the fpllowing steps:
>>> # fsck.reiser4 --build-fs --force  /dev/sdb
>>> *******************************************************************
>>> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>>> *******************************************************************
>>>
>>> Fscking the /dev/sdb block device.
>>>
>>>
>>>              
>>> Will check the consistency of the Reiser4 SuperBlock.
>>>                                                
>>> Will build the Reiser4 FileSystem.
>>>                                                
>>> ***** fsck.reiser4 started at Tue Aug 26 17:22:24 2014
>>> Reiser4 fs was detected on /dev/sdb.
>>>                                                
>>> Master super block (16):
>>> magic:          ReIsEr4
>>> blksize:        4096
>>> format:         0x0 (format40)
>>> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
>>> label:          <none>
>>>    
>>> Format super block (17):
>>> plugin:         format40
>>> description:    Disk-format plugin.
>>> version:        0
>>> magic:          ReIsEr40FoRmAt
>>> mkfs id:        0x1ddaf754
>>> flushes:        0
>>> blocks:         488378640
>>> free blocks:    217146980
>>> root block:     37017218
>>> tail policy:    0x2 (smart)
>>> next oid:       0xedade
>>> file count:     188313
>>> tree height:    6
>>> key policy:     LARGE
>>>    
>>>    
>>> CHECKING THE STORAGE TREE
>>>                                                
>>>           Read nodes 197008413
>>>                                                
>>>           Nodes left in the tree 197008413
>>>                                                
>>>                   Leaves of them 194764277, Twigs of them 2217790
>>>                                                
>>>           Time interval: Tue Aug 26 17:24:21 2014 - Wed Aug 27 01:25:31
>>>           2014
>>>                                                
>>> CHECKING EXTENT REGIONS.
>>>                                                
>>>           Read twigs 2217790
>>>                                                
>>>           Time interval: Wed Aug 27 01:25:31 2014 - Wed Aug 27 03:35:39
>>>           2014
>>>                                                
>>> LOOKING FOR UNCONNECTED NODES
>>>                                                
>>> FSCK: node.c: 108: repair_node_items_check: Node (43828275), items (0)
>>> and
>>> (1): Wrong order of keys.
>>> FSCK: node.c: 108: repair_node_items_check: Node (52697435), items (79)
>>> and (80): Wrong order of keys.
>>> FSCK: node.c: 108: repair_node_items_check: Node (63227569), items (24)
>>> and (25): Wrong order of keys.
>>> FSCK: node.c: 108: repair_node_items_check: Node (63227571), items (73)
>>> and (74): Wrong order of keys.
>>> FSCK: node.c: 108: repair_node_items_check: Node (116595727), items
> (20)
>>> and (21): Wrong order of keys.
>>> FSCK: node.c: 108: repair_node_items_check: Node (227923161), items
> (22)
>>> and (23): Wrong order of keys.
>>> FSCK: node.c: 108: repair_node_items_check: Node (284305753), items
> (61)
>>> and (62): Wrong order of keys.
>>>           Read nodes 1481038
>>>                                              
>>>           Good nodes 471512
>>>                   Leaves of them 466164, Twigs of them 5348
>>>           Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27 03:39:46
>>>           2014
>>>
>>> ***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
>>> Closing fs...done
>>>
>>> FS is consistent.
>>
>> This is a bug in fsck: it jumps to wrong branch for some reasons.
>> Not yet fixed.
>>
>> Edward.
> Hello,

Hello.

> Some questions:
>
>   - Can fsck be fixed so it jumps to "correct" branch branch. ?

Yes, it can.

>   - It would be useful to display a message when a Node or key is fixed.

Why?


Thanks,
Edward.


>   - I can test and report back on the results on a newer reiser4progs
>
>   - I can get it build at following location:
>     Rpms will be produced.
>     https://build.opensuse.org/package/show/home:doiggl/reiser4progs
>     
>     reiser4progs.changes 	5.73 KB 	
>     reiser4progs.spec 	3.73 KB 	
>     reiser4progs-1.0.9.tar.gz 	892 KB
>
> Thanks Glenn
>
> # fsck.reiser4  --h
> Usage: fsck.reiser4 [ options ] FILE
> Fsck options:
>    --check                       checks the consistency (default)
>    --fix                         fixes minor corruptions
>    --build-sb                    rebuilds the super block
>    --build-fs                    rebuilds the filesystem
>
>    -L, --logfile file            complains into the file
>    -n, --no-log                  makes fsck to not complain
>    -a, --auto                    automatically checks the consistency
>                                  without any questions.
>    -q, --quiet                   supresses gauges
>    -r                            ignored
> Plugins options:
>    --print-profile               prints the plugin profile.
>    -l, --print-plugins           prints all known plugins.
>    -o, --override TYPE=PLUGIN    overrides the default plugin of the type
>                                  "TYPE" by the plugin "PLUGIN" in the
>                                  profile.
> Common options:
>    -?, -h, --help                prints program usage.
>    -V, --version                 prints current version.
>    -y, --yes                     assumes an answer 'yes' to all questions.
>    -f, --force                   makes fsck to use whole disk, not block
>                                  device or mounted partition.
>    -p, --preen                   automatically repair the filesysem.
>    -c, --cache N                 number of nodes in tree buffer cache
>   
>   

