From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Repacker cause fs corruption:
Date: Tue, 14 Sep 2004 13:42:23 +0400
Message-ID: <20040914094223.GE2252@backtop.namesys.com>
References: <710218328.20040914105908@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21737-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <710218328.20040914105908@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Tue, Sep 14, 2004 at 10:59:08AM +0200, Spam wrote:
> 
>   I tried the resier4 repacker yesterday on a 2GB device that I use
>   for /usr/portage in Gentoo. This morning I found these errors in the
>   kernel log:

Thanks for the report.  

How did you start the repacker?  which direction did you run it in?

> 
> ##########################################################
> 
> Repacker: I am alive, pid = 32717
> reiser4[k_reiser4_repac(32717)]: renew_sibling_link (fs/reiser4/tree_walk.c:441)[nikita-3532]:
> WARNING: Sibling nodes on the different levels: 1 != 1
> reiser4 repacker: 659 formatted node(s) processed, 170984 unformatted node(s) processed, ret = -5

We have similar bug report, but no information that the breakage was connected
to the repacker.

> 
> ##########################################################
> 
>   I did a fsck. This is the output from this:
> 
> ##########################################################
> 
> ***** fsck.reiser4 started at Tue Sep 14 10:30:09 2004
> Reiser4 journal (journal40) on usr_portage.loop: 0 transactions replayed of the total 0 blocks.
> Reiser4 fs was detected on usr_portage.loop.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           fb81301f-8994-49db-a70a-02d1dcb1ad4c
> label:          usr_portage
> 
> Format super block (17):
> plugin:         format40
> description:    Disk-format for reiser4, ver. 1.0.1
> magic:          ReIsEr40FoRmAt
> flushes:        0
> mkfs id:        0x6624937f
> blocks:         524288
> free blocks:    359376
> root block:     152472
> tail policy:    0x2 (smart)
> next oid:       0x3041e
> file count:     96887
> tree height:    4
> key policy:     LARGE
> 
> 
> CHECKING STORAGE TREE
> FSCK: Node (89186): The last key [15a4b:4(FB):6c657373746966:15a4f:45d] in the node is greater then the right delimiting key [15a4b:4(FB):4368616e67654c:15a50:5aa].
> FSCK: Node (152380), item (74), unit (0): Points to the node [89186] with wrong delimiting keys. The whole subtree is skipped.
> 
>         Read nodes 23702
>         Nodes left in the tree 23701
>                 Leaves of them 23321, Twigs of them 373
>         Nodes with wrong delimiting keys 1
>                 Leaves of them 1, Twigs of them 0
>         Time interval: Tue Sep 14 10:30:11 2004 - Tue Sep 14 10:33:23 2004
> CHECKING EXTENT REGIONS.
>         Read twigs 373
>         Time interval: Tue Sep 14 10:33:24 2004 - Tue Sep 14 10:33:31 2004
> Warn : Fatal corruptions were found. Semantic pass is skipped.
> ***** fsck.reiser4 finished at Tue Sep 14 10:33:31 2004
> Closing fs...done
> 
> 1 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.
> 
> ##########################################################
> 
>  Here follows the output from --build-fs:
> 
> ##########################################################
> 
> ***** fsck.reiser4 started at Tue Sep 14 10:35:37 2004
> Reiser4 journal (journal40) on usr_portage.loop: 0 transactions replayed of the total 0 blocks.
> Reiser4 fs was detected on usr_portage.loop.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           fb81301f-8994-49db-a70a-02d1dcb1ad4c
> label:          usr_portage
> 
> Format super block (17):
> plugin:         format40
> description:    Disk-format for reiser4, ver. 1.0.1
> magic:          ReIsEr40FoRmAt
> flushes:        0
> mkfs id:        0x6624937f
> blocks:         524288
> free blocks:    359376
> root block:     152472
> tail policy:    0x2 (smart)
> next oid:       0x3041e
> file count:     96887
> tree height:    4
> key policy:     LARGE
> 
> CHECKING STORAGE TREE
> FSCK: Node (89186): The last key [15a4b:4(FB):6c657373746966:15a4f:45d] in the node is greater then the right delimiting key [15a4b:4(FB):4368616e67654c:15a50:5aa].
> FSCK: Node (152380), item (74), unit (0): Points to the node [89186] with wrong delimiting keys. Removed, content will be inserted later item-by-item.
>         Read nodes 23702
>         Nodes left in the tree 23701
>                 Leaves of them 23321, Twigs of them 373
>         Nodes with wrong delimiting keys 1
>                 Leaves of them 1, Twigs of them 0
>         Time interval: Tue Sep 14 10:35:39 2004 - Tue Sep 14 10:41:01 2004
> CHECKING EXTENT REGIONS.
>         Read twigs 373
>         Time interval: Tue Sep 14 10:41:15 2004 - Tue Sep 14 10:41:25 2004
> LOOKING FOR UNCONNECTED NODES
>         Read nodes 0
>         Good nodes 0
>                 Leaves of them 0, Twigs of them 0
>         Time interval: Tue Sep 14 10:41:32 2004 - Tue Sep 14 10:41:32 2004
> CHECKING EXTENT REGIONS.
>         Read twigs 0
>         Time interval: Tue Sep 14 10:41:32 2004 - Tue Sep 14 10:41:32 2004
> INSERTING UNCONNECTED NODES
> 1. Twigs: done
> 2. Twigs by item: done
> 3. Leaves: done
> 4. Leaves by item: done
>         Twigs: read 0, inserted 0, by item 0, empty 0
>         Leaves: read 0, inserted 0, by item 0
>         Time interval: Tue Sep 14 10:41:38 2004 - Tue Sep 14 10:41:38 2004
> CHECKING SEMANTIC TREE
> FSCK: No 'lost+found' entry found. Building a new object with the key 2a:0:ffff.
> FSCK: Failed to recognize the plugin for the directory [2a:0:ffff].
> FSCK: Trying to recover the directory [2a:0:ffff] with the default plugin--dir40.
> FSCK: The file [2a:0:ffff] does not have a StatData item. Creating a new one. Plugin dir40.
> FSCK: Directory [2a:0:ffff]: The entry "." is not found. Insert a new one. Plugin (dir40).
> FSCK: Node (1095), item (1), [2a:0:ffff] (stat40): wrong size (0), Fixed to (1).
> FSCK: Node (1095), item (1), [2a:0:ffff] (stat40): wrong bytes (0), Fixed to (50).
>         Found 96889 objects.
>         Time interval: Tue Sep 14 10:41:41 2004 - Tue Sep 14 10:51:34 2004
> CLEANUPING STORAGE TREE
>         Removed items 0
>         Time interval: Tue Sep 14 10:51:34 2004 - Tue Sep 14 10:52:52 2004
> ***** fsck.reiser4 finished at Tue Sep 14 10:52:53 2004
> Closing fs...done
> 
> FS is consistent.
> 
> ##########################################################
>  
> 

-- 
Alex.
