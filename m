From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk <
 reiser4_block_count(super)
Date: Mon, 6 Jun 2005 20:39:14 +0200
Message-ID: <20050606203914.3271673f.reiser4@blinkenlights.ch>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
	<200506061255.22953.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24325-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506061255.22953.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

I upgraded to Linux 2.6.11.11 using the -5 reiser4 patch.


It fixed it.. somewhat.. it's still funky:


 * mkisofs doesn't crash with the new kernel, yeah!
 * after running mkisofs, grub can't read the filesystem anymore..
   The filesystem got corrupted. (It was ok before i booted
   into 2.6.11.11 and ran mkisofs !)

So i bootet my rescue-system
(Same kernel, reiser4progs 1.0.4. It's on /dev/md3)

Running fsck:

root@fuzzy:~# fsck.reiser4 /dev/md1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/md1 block device.                           
Will check the consistency of the Reiser4 SuperBlock.                           
Will check the consistency of the Reiser4 FileSystem.                           
Continue?                           
(Yes/No): Yes
***** fsck.reiser4 started at Mon Jun  6 20:07:51 2005
Reiser4 fs was detected on /dev/md1.                           
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           c3fc85d3-be0d-4d71-9413-376cefcdf8fd 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format for reiser4.  
magic:          ReIsEr40FoRmAt 
flushes:        0 
mkfs id:        0x5bedb66f 
blocks:         9765488 
free blocks:    2035573 
root block:     4270052 
tail policy:    0x2 (smart) 
next oid:       0x62d63 
file count:     180460 
tree height:    4 
key policy:     LARGE 
 
 
CHECKING STORAGE TREE                           
FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: does not look like a valid SD plugin set extention: wrong pset member count detected (12).
FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: does not look like a valid stat data. 
FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: broken item found. 
FSCK: Node (411219): the node is broken. Pointed from the node (411211), item (0), unit (0). The whole subtree is skipped. 
        Read nodes 130082                           
        Nodes left in the tree 130081 
                Leaves of them 127827, Twigs of them 2199 
        Broken of them 1 
                Leaves of them 1, Twigs of them 0 
        Time interval: Mon Jun  6 20:07:54 2005 - Mon Jun  6 20:09:12 2005 
CHECKING EXTENT REGIONS.                           
        Read twigs 2199                            
        Time interval: Mon Jun  6 20:09:12 2005 - Mon Jun  6 20:09:15 2005 
Warn : Fatal corruptions were found. Semantic pass is skipped.                           
***** fsck.reiser4 finished at Mon Jun  6 20:09:15 2005
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.


 .. ok, again with --build-fs

root@fuzzy:~# fsck.reiser4 --build-fs /dev/md1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/md1 block device.                         
Will check the consistency of the Reiser4 SuperBlock.                         
Will build the Reiser4 FileSystem.                         
Continue?                         
(Yes/No): Yes
***** fsck.reiser4 started at Mon Jun  6 20:09:55 2005
Reiser4 fs was detected on /dev/md1.                         
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           c3fc85d3-be0d-4d71-9413-376cefcdf8fd 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format for reiser4.  
magic:          ReIsEr40FoRmAt 
flushes:        0 
mkfs id:        0x5bedb66f 
blocks:         9765488 
free blocks:    2035573 
root block:     4270052 
tail policy:    0x2 (smart) 
next oid:       0x62d63 
file count:     180460 
tree height:    4 
key policy:     LARGE 
 
 
CHECKING STORAGE TREE                         
FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: does not look like a valid SD plugin set extention: wrong pset member count detected (12).                 
FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: does not look like a valid stat data. 
FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: broken item found. Remove it. 
FSCK: Node (411219): The left delimiting key [2a:0(NAME):0:0:0] in the parent node (411211), pos (0/4294967295) does not match the first key [29:1(SD):0:2a:0]
in the node. Fixed. 
        Read nodes 130082                          
        Nodes left in the tree 130082 
                Leaves of them 127828, Twigs of them 2199 
        Corrected nodes 1 
                Leaves of them 1, Twigs of them 0 
        Time interval: Mon Jun  6 20:09:58 2005 - Mon Jun  6 20:11:29 2005 
CHECKING EXTENT REGIONS.                         
        Read twigs 2199                         
        Time interval: Mon Jun  6 20:11:29 2005 - Mon Jun  6 20:11:32 2005 
LOOKING FOR UNCONNECTED NODES                         
        Read nodes 0                         
        Good nodes 0 
                Leaves of them 0, Twigs of them 0 
        Time interval: Mon Jun  6 20:11:33 2005 - Mon Jun  6 20:11:33 2005 
CHECKING EXTENT REGIONS.                         
        Read twigs 0                         
        Time interval: Mon Jun  6 20:11:33 2005 - Mon Jun  6 20:11:33 2005 
INSERTING UNCONNECTED NODES                         
1. Twigs: done                          
2. Twigs by item: done                         
3. Leaves: done                         
4. Leaves by item: done                         
        Twigs: read 0, inserted 0, by item 0, empty 0                         
        Leaves: read 0, inserted 0, by item 0 
        Time interval: Mon Jun  6 20:11:33 2005 - Mon Jun  6 20:11:33 2005 
CHECKING SEMANTIC TREE                         
FSCK: Failed to recognize the plugin for the directory [29:0:2a].                         
FSCK: Trying to recover the directory [29:0:2a] with the default plugin--dir40. 
FSCK: The file [29:0:2a] does not have a StatData item. Creating a new one. Plugin dir40.                         
FSCK: Node (411219), item (0), [29:0:2a] (stat40): wrong size (0), Fixed to (23). 
FSCK: Node (411219), item (0), [29:0:2a] (stat40): wrong bytes (0), Fixed to (1150). 
        Found 180460 objects.                         
        Time interval: Mon Jun  6 20:11:33 2005 - Mon Jun  6 20:15:22 2005 
CLEANUPING STORAGE TREE                          
        Removed items 0                         
        Time interval: Mon Jun  6 20:15:22 2005 - Mon Jun  6 20:17:42 2005 
***** fsck.reiser4 finished at Mon Jun  6 20:17:42 2005
Closing fs...done



..running again fsck.reiser4 --check : No errors..

I mounted/umounted /dev/md1 3 times: No problems
..running fsck.reiser4 again: no errors.. fine..

So i booted again using /dev/md1 as my rootfs.. No errors so far.
After logging in, i rebooted again to /dev/md3 and started
a fsck on /dev/md1 ..

Now the same thing happens again :-/

# fsck.reiser4 /dev/md1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/md1 block device.                                            
Will check the consistency of the Reiser4 SuperBlock.                         
Will check the consistency of the Reiser4 FileSystem.                         
Continue?                                                                     
(Yes/No): Yes
***** fsck.reiser4 started at Mon Jun  6 20:33:27 2005
Reiser4 fs was detected on /dev/md1.                                          
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           c3fc85d3-be0d-4d71-9413-376cefcdf8fd 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format for reiser4.  
magic:          ReIsEr40FoRmAt 
flushes:        0 
mkfs id:        0x5bedb66f 
blocks:         9765488 
free blocks:    2035524 
root block:     4270046 
tail policy:    0x2 (smart) 
next oid:       0x62de4 
file count:     180460 
tree height:    4 
key policy:     LARGE 
 
 
CHECKING STORAGE TREE                                                         
FSCK: Node (35026), item (0), [29:1(SD):0:2a:0]: does not look like a valid SD 
plugin set extention: wrong pset member count detected (12). 
FSCK: Node (35026), item (0), [29:1(SD):0:2a:0]: does not look like a valid stat
data. 
FSCK: Node (35026), item (0), [29:1(SD):0:2a:0]: broken item found. 
FSCK: Node (35026): the node is broken. Pointed from the node (35024), item (0),
unit (0). The whole subtree is skipped. 
        Read nodes 130082                                                     
        Nodes left in the tree 130081 
                Leaves of them 127827, Twigs of them 2199 
        Broken of them 1 
                Leaves of them 1, Twigs of them 0 
        Time interval: Mon Jun  6 20:33:30 2005 - Mon Jun  6 20:34:47 2005 
CHECKING EXTENT REGIONS.                                                      
        Read twigs 2199                                                       
        Time interval: Mon Jun  6 20:34:47 2005 - Mon Jun  6 20:34:50 2005 
Warn : Fatal corruptions were found. Semantic pass is skipped.                
***** fsck.reiser4 finished at Mon Jun  6 20:34:50 2005
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.




