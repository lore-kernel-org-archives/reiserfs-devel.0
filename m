From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk <
 reiser4_block_count(super)
Date: Tue, 7 Jun 2005 06:57:50 +0200
Message-ID: <20050607065750.4dd203b9.reiser4@blinkenlights.ch>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
	<200506061255.22953.vitaly@namesys.com>
	<20050606203914.3271673f.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24330-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050606203914.3271673f.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vitaly@namesys.com
Cc: reiserfs-list@namesys.com


> Now the same thing happens again :-/

Ok, i know why it only got corrupted after using
the partition as rootfs :

 My Reiser4 partition doesn't like to get remounted rw:

 Running
 1) mount /dev/md1 /somewhere
 2) umount /dev/md1
 3) mount -o ro /dev/md1 /somewhere
 4) umount /dev/md1

works without any problems (fsck is happy)

 But if i do:
 1) mount -o ro /dev/md1 /somewhere
 2) mount -o remount,rw /dev/md1
 3) umount /dev/md1

 (Almost the same thing would happen
  if i use it as rootfs)

 ..fsck complains again:

CHECKING STORAGE TREE                                                   
                                             FSCK: Node (35026), item
(0), [29:1(SD):0:2a:0]: does not look like a valid SD plugin set
extention: wrong pset member count detected (12). 
FSCK: Node (35026), item (0), [29:1(SD):0:2a:0]: does not look like a
valid stat data.  FSCK: Node (35026), item (0), [29:1(SD):0:2a:0]:
broken item found.  FSCK: Node (35026): the node is broken. Pointed from
the node (35024), item (0), unit (0). The whole subtree is  skipped. 
        Read nodes 130082                                               
                                                    Nodes left in the
tree 130081                 Leaves of them 127827, Twigs of them 2199 
        Broken of them 1 
                Leaves of them 1, Twigs of them 0 
        Time interval: Tue Jun  7 06:51:32 2005 - Tue Jun  7 06:52:48
2005  CHECKING EXTENT REGIONS.                                          
                                                          Read twigs
2199                                                                    
                                 Time interval: Tue Jun  7 06:52:48 2005
- Tue Jun  7 06:52:51 2005  Warn : Fatal corruptions were found.
Semantic pass is skipped.                                               
        ***** fsck.reiser4 finished at Tue Jun  7 06:52:51 2005
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them. 
