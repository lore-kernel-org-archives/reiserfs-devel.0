From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 --build-fs  /dev/sdb report
Date: Sun, 08 May 2011 21:40:32 +0200
Message-ID: <4DC6F1B0.8060808@gmail.com>
References: <5c3c4d6d36bc2aba8b9562c21ecbd080@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=7LEv0R586ysiYQWgGB+dquFiobbPXTAy2lOc2EpA3+I=;
        b=njgWmGORQwqBAUICnn5ZY1ELn7F0F0/um6tXMd3syUzxzgTa4bpUfyvooeTU7xN6r5
         a+EuxNRTISmVtfW5WqZ2dK9sx1afThkfT4BMxF2U4f4O2TueTfqqqq+u6GdS/77gBrKU
         Cx5Ot45pXyuMGdROCMrkOnqyo+wwC1XdBY6jA=
In-Reply-To: <5c3c4d6d36bc2aba8b9562c21ecbd080@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 05/08/2011 09:57 AM, doiggl@velocitynet.com.au wrote:
> Hello,
> I did a rpair on a reiser4 disk report is listed at [2] Is the report ok
> and is the disk ok to use ?


Should be consistent.


> Disk has a large volume, time taken was Thu May 5 20:38:11 2011 to Sun May
> 8 13:51:08 2011

It can be rather annoying.
Have smaller volumes for reiser4, if possible..

Thanks,
Edward.


> Thanks Glenn
>
> [1]
> # fdisk -l
> Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes
> 255 heads, 63 sectors/track, 243201 cylinders, total 3907029168 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
> [2]
> # fsck.reiser4 --build-fs  /dev/sdb
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/sdb block device.
>
>
> Will check the consistency of the Reiser4 SuperBlock.
>
>
> Will build the Reiser4 FileSystem.
>
>
> Continue?
>
>
> (Yes/No): yes
> ***** fsck.reiser4 started at Thu May  5 20:38:11 2011
> Reiser4 fs was detected on /dev/sdb.
>
>
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
> label:<none>
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        0
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x1ddaf754
> flushes:        0
> blocks:         488378640
> free blocks:    189330548
> root block:     165756612
> tail policy:    0x2 (smart)
> next oid:       0xe6e2d
> file count:     238587
> tree height:    6
> key policy:     LARGE
>
>
> CHECKING THE STORAGE TREE
>
>
> FSCK: node.c: 108: repair_node_items_check: Node (2719861), items (9) and
> (10): Wrong order of keys.
>
> FSCK: filter.c: 407: repair_filter_update_traverse: Node (2719861): the
> node is unrecoverable. Pointed from the node (2719884), item (61), unit
> (0). Removed.
> FSCK: node.c: 108: repair_node_items_check: Node (7616539), items (6) and
> (7): Wrong order of keys.
>
> FSCK: filter.c: 407: repair_filter_update_traverse: Node (7616539): the
> node is unrecoverable. Pointed from the node (35239054), item (12), unit
> (0). Removed.
> FSCK: node.c: 108: repair_node_items_check: Node (170425478), items (35)
> and (36): Wrong order of keys.
>
> FSCK: filter.c: 407: repair_filter_update_traverse: Node (170425478): the
> node is unrecoverable. Pointed from the node (165756211), item (30), unit
> (0). Removed.
> FSCK: node.c: 108: repair_node_items_check: Node (330424929), items (0)
> and (1): Wrong order of keys.
>
> FSCK: filter.c: 407: repair_filter_update_traverse: Node (330424929): the
> node is unrecoverable. Pointed from the node (332174991), item (50), unit
> (0). Removed.
> FSCK: node.c: 108: repair_node_items_check: Node (331972447), items (0)
> and (1): Wrong order of keys.
>
> FSCK: filter.c: 407: repair_filter_update_traverse: Node (331972447): the
> node is unrecoverable. Pointed from the node (331971073), item (77), unit
> (0). Removed.
> FSCK: node.c: 108: repair_node_items_check: Node (310651763), items (0)
> and (1): Wrong order of keys.
>
> FSCK: filter.c: 407: repair_filter_update_traverse: Node (310651763): the
> node is unrecoverable. Pointed from the node (317360788), item (68), unit
> (0). Removed.
>          Read nodes 217915943
>
>
>          Nodes left in the tree 217915937
>                  Leaves of them 215433642, Twigs of them 2453159
>          Emptied of them 6
>                  Leaves of them 3, Twigs of them 3
>          Time interval: Thu May  5 20:40:08 2011 - Fri May  6 14:56:19 2011
>
> CHECKING EXTENT REGIONS.
>
>
>          Read twigs 2453159
>
>
>          Time interval: Fri May  6 14:56:19 2011 - Fri May  6 17:21:44 2011
>
> LOOKING FOR UNCONNECTED NODES
>
>
> FSCK: node40_repair.c: 219: node40_ih_array_check: Node (165756606):
> Region of items [0-0] with wrong offsets is removed.
>
> FSCK: node40_repair.c: 219: node40_ih_array_check: Node (165756607):
> Region of items [0-0] with wrong offsets is removed.
>
> FSCK: node40_repair.c: 219: node40_ih_array_check: Node (165756608):
> Region of items [0-0] with wrong offsets is removed.
>
> FSCK: node40_repair.c: 219: node40_ih_array_check: Node (165756609):
> Region of items [0-0] with wrong offsets is removed.
>
> FSCK: node40_repair.c: 219: node40_ih_array_check: Node (165756610):
> Region of items [0-1] with wrong offsets is removed.
>
>          Read nodes 22367
>
>
>          Good nodes 109
>                  Leaves of them 109, Twigs of them 0
>          Time interval: Fri May  6 17:22:01 2011 - Fri May  6 17:22:05 2011
>
> CHECKING EXTENT REGIONS.
>
>
>          Read twigs 0
>
>
>          Time interval: Fri May  6 17:22:05 2011 - Fri May  6 17:22:05 2011
>
> INSERTING UNCONNECTED NODES
>
>
> 1. Twigs: done
>
>
> 2. Twigs by item: done
>
>
> 3. Leaves: done
>
>
> 4. Leaves by item: done
>
>
>          Twigs: read 0, inserted 0, by item 0, empty 0
>
>
>          Leaves: read 109, inserted 108, by item 1
>          Time interval: Fri May  6 17:22:18 2011 - Fri May  6 17:22:18 2011
>
> CHECKING THE SEMANTIC TREE
> FSCK: semantic.c: 705: repair_semantic_lost_prepare: No 'lost+found' entry
> found. Building a new object with the key 2a:0:ffff.
>
> FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
> plugin for the directory [2a:0:ffff].
> FSCK: semantic.c: 581: repair_semantic_dir_open: Trying to recover the
> directory [2a:0:ffff] with the default plugin--dir40.
> FSCK: obj40_repair.c: 599: obj40_prepare_stat: The file [2a:0:ffff] does
> not have a StatData item. Creating a new one. Plugin dir40.
>
> FSCK: dir40_repair.c: 40: dir40_dot: Directory [2a:0:ffff]: The entry "."
> is not found. Insert a new one. Plugin (dir40).
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (115734121),
> item (0), [2a:0:ffff] (stat40): wrong bytes (0), Fixed to (50).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (115734121), item
> (0), [2a:0:ffff] (stat40): wrong size (0), Fixed to (1).
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [18941:163637367746d2d:18969] (ccreg40): the cluster at [0] offset 65536
> bytes long is corrupted. Removed.
> FSCK: dir40_repair.c: 40: dir40_dot: Directory
> [17e3a:696e7374616c6c:18972]: The entry "." is not found. Insert a new one.
> Plugin (dir40).
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (3641920), item
> (32), [17e3a:696e7374616c6c:18972] (stat40): wrong bytes (2965), Fixed to
> (50).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (3641920), item (32),
> [17e3a:696e7374616c6c:18972] (stat40): wrong size (41), Fixed to (1).
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19af5:636f6d7061712d:19af6] (ccreg40): the cluster at [2245328896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:636f6d7061712d:4f853] (ccreg40): the cluster at [2159411200] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:636f6d7061712d:4f853] (ccreg40): the cluster at [2159411200] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:636f6d7061712d:4f853] (ccreg40): the cluster at [2159411200] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:1617375732d7072:46adf] (ccreg40): the cluster at [4192993280] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:1617375732d7072:46adf] (ccreg40): the cluster at [4192993280] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:1617375732d7072:46adf] (ccreg40): the cluster at [4192993280] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:1617375732d7072:46adf] (ccreg40): the cluster at [4192993280] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:1617375732d7072:46adf] (ccreg40): the cluster at [4192993280] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:1617375732d7072:46adf] (ccreg40): the cluster at [4192993280] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [19ea9:1617375732d7072:46adf] (ccreg40): the cluster at [4192993280] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:534c2d362d7838:2e84b] (ccreg40): the cluster at [178192384] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:348e4] (ccreg40): the cluster at [392560640] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:348e5] (ccreg40): the cluster at [399310848] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:34d00] (ccreg40): the cluster at [383320064] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [9d6b4:164656269616e2d:9d6b7] (ccreg40): the cluster at [367132672] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [9d6b4:164656269616e2d:9d9bd] (ccreg40): the cluster at [404029440] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [9d6b4:164656269616e2d:9d9bc] (ccreg40): the cluster at [402784256] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:14b4e4f50504958:236e7] (ccreg40): the cluster at [151846912] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:1534c2d362d7838:6db4e] (ccreg40): the cluster at [131399680] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:153616261796f6e:324fc] (ccreg40): the cluster at [194969600] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:153616261796f6e:31b93] (ccreg40): the cluster at [108199936] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:9d6a6] (ccreg40): the cluster at [367132672] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:9d6a0] (ccreg40): the cluster at [404029440] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:9d686] (ccreg40): the cluster at [402784256] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:9d685] (ccreg40): the cluster at [398458880] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:9d687] (ccreg40): the cluster at [403243008] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:9d9b2] (ccreg40): the cluster at [402849792] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:164656269616e2d:9d9b3] (ccreg40): the cluster at [312410112] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:16d616e64726976:3e4ca] (ccreg40): the cluster at [331350016] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:16f70656e535553:40e1c] (ccreg40): the cluster at [68681728] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:16f70656e535553:41439] (ccreg40): the cluster at [356712448] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:16f70656e535553:42a3a] (ccreg40): the cluster at [262864896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:16f70656e535553:43d8d] (ccreg40): the cluster at [363397120] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:16f70656e535553:44ac8] (ccreg40): the cluster at [172818432] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:16f70656e535553:44ac9] (ccreg40): the cluster at [95223808] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:16f70656e535553:46aa4] (ccreg40): the cluster at [276955136] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a897:1736c61636b7761:46ab8] (ccreg40): the cluster at [76939264] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [1a8a2:16f70656e535553:1a8a8] (ccreg40): the cluster at [357957632] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [e6d9c:1323031312d3034:e6da4] (ccreg40): the cluster at [275972096] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [e6d9e:1323031312d3034:e6da5] (ccreg40): the cluster at [262799360] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [e6d9f:173756e6461792d:e6da6] (ccreg40): the cluster at [336789504] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [e6da0:1323031312d3034:e6da7] (ccreg40): the cluster at [358154240] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [46b1c:16f70656e535553:46b39] (ccreg40): the cluster at [202702848] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [46b1c:16f70656e535553:46b3b] (ccreg40): the cluster at [357957632] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [508f9:1534c45442d3131:50916] (ccreg40): the cluster at [1749024768] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [50c0d:16f70656e535553:50c0e] (ccreg40): the cluster at [262864896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [503c4:16f70656e535553:503e8] (ccreg40): the cluster at [262864896] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [503c4:16f70656e535553:503ea] (ccreg40): the cluster at [363397120] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [2e021:16f70656e535553:5be80] (ccreg40): the cluster at [110821376] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [2e021:16f70656e535553:5dd19] (ccreg40): the cluster at [68681728] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [2e028:16f70656e535553:6b2f6] (ccreg40): the cluster at [198508544] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [5d736:16f70656e535553:5da41] (ccreg40): the cluster at [198508544] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [df2f1:16f70656e535553:dfcad] (ccreg40): the cluster at [51380224] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [df2f1:16f70656e535553:dfcac] (ccreg40): the cluster at [198508544] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [4f862:16f70656e535553:4f86f] (ccreg40): the cluster at [62783488] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [4baa0:16c6962676e7574:dfe8e] (ccreg40): the cluster at [0] offset 65536
> bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [de62a:16f70656e535553:de76a] (ccreg40): the cluster at [363397120] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [de62a:16f70656e535553:deecc] (ccreg40): the cluster at [357957632] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [de62a:16f70656e535553:deeec] (ccreg40): the cluster at [198508544] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [3e4c0:1736861726f6e32:3e4c9] (ccreg40): the cluster at [1013579776] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [3e4c0:1736861726f6e32:3e4c9] (ccreg40): the cluster at [1013579776] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [3e4c0:1736861726f6e32:3e4c9] (ccreg40): the cluster at [1013579776] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [3e4c0:1736861726f6e32:3e4c9] (ccreg40): the cluster at [1013579776] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: ccreg40_repair.c: 187: ccreg40_check_cluster: The file
> [3e4c0:1736861726f6e32:3e4c9] (ccreg40): the cluster at [1013579776] offset
> 65536 bytes long is corrupted. Removed.
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (55820343), item
> (2), [10003:66697800000000:10004] (stat40): wrong bytes (200), Fixed to
> (50).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (55820343), item (2),
> [10003:66697800000000:10004] (stat40): wrong size (4), Fixed to (1).
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (55820343), item
> (11), [10003:72706d73000000:1001a] (stat40): wrong bytes (1461), Fixed to
> (50).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (55820343), item
> (11), [10003:72706d73000000:1001a] (stat40): wrong size (18), Fixed to (1).
>
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (55820343), item
> (12), [10003:72706d732e7072:10032] (stat40): wrong bytes (100), Fixed to
> (50).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (55820343), item
> (12), [10003:72706d732e7072:10032] (stat40): wrong size (2), Fixed to (1).
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (55820343), item
> (14), [10003:74697073315f66:10035] (stat40): wrong bytes (200), Fixed to
> (50).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (55820343), item
> (14), [10003:74697073315f66:10035] (stat40): wrong size (4), Fixed to (1).
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (55820343), item
> (16), [10003:74697073325f66:1003b] (stat40): wrong bytes (800), Fixed to
> (50).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (55820343), item
> (16), [10003:74697073325f66:1003b] (stat40): wrong size (16), Fixed to (1).
>
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (115734128),
> item (31), [2a:16b65726e656c2d:212c8] (stat40): wrong bytes (91152384),
> Fixed to (0).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (115734128), item
> (31), [2a:16b65726e656c2d:212c8] (stat40): wrong size (91151862), Fixed to
> (0).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (6),
> [1001a:16c696271646961:1002b] (stat40): wrong size (0), Fixed to (106496).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (8),
> [1001a:16c696273617473:1002a] (stat40): wrong size (0), Fixed to (614400).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (9),
> [1001a:16c696273617473:1002e] (stat40): wrong size (0), Fixed to (897024).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (11),
> [1001a:16c69627a797070:10029] (stat40): wrong size (0), Fixed to (684032).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (12),
> [1001a:16c69627a797070:1002c] (stat40): wrong size (0), Fixed to (462848).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (13),
> [1001a:17065726c2d7361:1001b] (stat40): wrong size (0), Fixed to (798720).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (14),
> [1001a:17065726c2d7a79:10025] (stat40): wrong size (0), Fixed to (884736).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (15),
> [1001a:1707974686f6e2d:10024] (stat40): wrong size (0), Fixed to (569344).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (16),
> [1001a:1707974686f6e2d:10027] (stat40): wrong size (0), Fixed to (638976).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (17),
> [1001a:1727562792d7361:10022] (stat40): wrong size (0), Fixed to (659456).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (18),
> [1001a:1727562792d7a79:1001c] (stat40): wrong size (0), Fixed to (552960).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (19),
> [1001a:1736174736f6c76:10026] (stat40): wrong size (0), Fixed to (688128).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (75), item (20),
> [1001a:17a79707065722d:10023] (stat40): wrong size (0), Fixed to (839680).
>
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (2639), item (2),
> [1001d:6f746865722e78:10020] (stat40): wrong size (0), Fixed to (135168).
>
>          Found 238641 objects.
>
>
>          Lost&found 122 objects.
>          Time interval: Fri May  6 17:22:18 2011 - Sat May  7 20:18:20 2011
>
> CLEANING UP THE STORAGE TREE
>
>
>          Removed items 666909
>
>
>          Time interval: Sat May  7 20:18:21 2011 - Sun May  8 13:51:05 2011
>
> FSCK: repair.c: 677: repair_update: File count 238587 is wrong. Fixed to
> 238641.
>
> ***** fsck.reiser4 finished at Sun May  8 13:51:08 2011
> Closing fs...done
>
> FS is consistent.

