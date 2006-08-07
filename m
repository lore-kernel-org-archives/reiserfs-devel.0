From: Laurent Riffard <laurent.riffard@free.fr>
Subject: reiser4 needs fsck after crash
Date: Mon, 07 Aug 2006 21:36:23 +0200
Message-ID: <44D79637.5040405@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hello,

I'm using a reiser4 FS for compiling my linux kernel.

Today, the kernel panics while compiling. I guess it was 
a reiser4 panic. I can't be sure as I was using an X console, 
but I'm often hit by such reiser4 panics (see my others posts 
on this list).

So I reboot using the reset button and I restart the 
compilation. I then had weird compilation errors until 
I unmount this FS and fsck it. Here is the fsck output:

[root@antares ~]# fsck.reiser4 --fix /dev/vglinux1/lvkernel 
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/vglinux1/lvkernel block device.                                                                        
Will fix minor corruptions of the Reiser4 SuperBlock.                                                                   
Will fix minor corruptions of the Reiser4 FileSystem.                                                                   
Continue?                                                                                                               
(Yes/No): yes
***** fsck.reiser4 started at Mon Aug  7 19:28:33 2006
Reiser4 fs was detected on /dev/vglinux1/lvkernel.                                                                      
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           4382e9f8-e19b-4d6f-9da7-a81d8c13276e 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format for reiser4.  
magic:          ReIsEr40FoRmAt 
flushes:        0 
mkfs id:        0x2402ed58 
blocks:         524288 
free blocks:    342801 
root block:     347110 
tail policy:    0x2 (smart) 
next oid:       0xf8ce3 
file count:     65713 
tree height:    4 
key policy:     LARGE 
 
 
CHECKING STORAGE TREE                                                                                                   
        Read nodes 60794                                                                                                
        Nodes left in the tree 60794 
                Leaves of them 59315, Twigs of them 1457 
        Time interval: Mon Aug  7 19:28:33 2006 - Mon Aug  7 19:29:49 2006 
CHECKING EXTENT REGIONS.                                                                                                
        Read twigs 1457                                                                                                 
        Time interval: Mon Aug  7 19:29:50 2006 - Mon Aug  7 19:29:52 2006 
CHECKING SEMANTIC TREE                                                                                                  
FSCK: Node (346272), item (23), [7b715:d06b6d616c6c6f63:7b88c] (stat40): wrong bytes (2199023252636), Fixed to (590).   
FSCK: Node (283954), item (4), [5e40b:d0657874322d6e6f:5e40f] (stat40): wrong bytes (4096), Fixed to (693).             
        Found 65719 objects.                                                                                            
        Time interval: Mon Aug  7 19:29:53 2006 - Mon Aug  7 19:31:19 2006 
***** fsck.reiser4 finished at Mon Aug  7 19:31:19 2006
Closing fs...done

FS is consistent.


After this, I was able to compile again.

Note that I found the following message in dmesg (before fsck):
Aug  7 17:50:19 antares kernel: reiser4[make(3875)]: present_lw_sd (fs/reiser4/plugin/item/static_stat.c:276)[]:
Aug  7 17:50:19 antares kernel: WARNING:  is encountered

It woud be nice if reiser4 could print the name of these 
"partially converted files".

But my main concern is that i was thinking that using a *journalized* 
file system will make useless the fsck after crash. Am I wrong here ?

~~
laurent
