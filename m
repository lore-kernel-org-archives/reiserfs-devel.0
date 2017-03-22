From: <doiggl@velocitynet.com.au>
Subject: Is there a program or some code to print out all details of a reiser4 superblock and what it stores [sdbX] ?
Date: Wed, 22 Mar 2017 14:08:30 +1100
Message-ID: <7f109055fbd4ed2fc369734f850863be@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx@intelfx.name>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

#
Hello
Edward, Ivan, list: 
Question:
Is there a program or some code to print out all details of a reiser4
superblock and what it stores ?
Thanks
--Glenn

# fsck.reiser4 -y --check /dev/sdb2
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb2 block device.                                       
                                
Will check the consistency of the Reiser4 SuperBlock.                     
                                
Will check the consistency of the Reiser4 FileSystem.                     
                                
***** fsck.reiser4 started at Wed Mar 22 13:03:37 2017
Reiser4 fs was detected on /dev/sdb2.                                     
                                
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           139d06a8-1886-44a0-a058-8f9da1ab88cf 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format plugin. 
version:        1 
magic:          ReIsEr40FoRmAt 
mkfs id:        0x14b9244f 
flushes:        18446744073709551615 
blocks:         85725440 
free blocks:    56409668 
root block:     29252877 
tail policy:    0x2 (smart) 
next oid:       0x19612 
file count:     27 
tree height:    5 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE                                                 
                                
        Read nodes 833657                                                 
                                
        Nodes left in the tree 833657 
                Leaves of them 824168, Twigs of them 9377 
        Time interval: Wed Mar 22 13:03:58 2017 - Wed Mar 22 13:05:44 2017

CHECKING EXTENT REGIONS.                                                  
                                
        Read twigs 9377                                                   
                                
        Time interval: Wed Mar 22 13:05:44 2017 - Wed Mar 22 13:05:45 2017

CHECKING THE SEMANTIC TREE                                                
                                
        Found 27 objects (some could be encountered more then once).      
                                
        Time interval: Wed Mar 22 13:05:45 2017 - Wed Mar 22 13:05:54 2017

***** fsck.reiser4 finished at Wed Mar 22 13:05:54 2017
Closing fs...done

FS is consistent.

