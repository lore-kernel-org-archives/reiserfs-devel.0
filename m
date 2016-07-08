From: <doiggl@velocitynet.com.au>
Subject: fsck.reiser4 --fix -y /dev/sdb [2 fatal corruptions were detected in FileSystem.]
Date: Fri, 08 Jul 2016 15:05:47 +1000
Message-ID: <00f934017e48470fe40f1f8072c3a41f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
will bug be fixed ?
--Glenn

Is this the cause of problem ?
see:

Re: reiser4progs revision.
http://www.spinics.net/lists/reiserfs-devel/msg04577.html

At revision now:
# rpm -qa |grep -i reiser4 |sort
kernel-reiser4-4.6.0-1.1.x86_64
libreiser4-1_1-0-1.1.0-13.1.x86_64
reiser4progs-1.1.0-35.1.x86_64

# fsck.reiser4 --fix -y /dev/sdb -L /tmp/fsck.reiser4--fix02--sdb.log
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
            
Will fix minor corruptions of the Reiser4 SuperBlock.                     
                                                                          
            
Will fix minor corruptions of the Reiser4 FileSystem.                     
                                                                          
            
***** fsck.reiser4 started at Thu Jul  7 20:42:24 2016
Backup update is needed. Done.                                            
                                                                          
            
Reiser4 fs was detected on /dev/sdb.                                      
                                                                          
            
Master super block (16): 
magic:          ReIsEr4 
blksize:        4096 
format:         0x0 (format40) 
uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede 
label:          <none> 
 
Format super block (17): 
plugin:         format40 
description:    Disk-format plugin. 
version:        1 
magic:          ReIsEr40FoRmAt 
mkfs id:        0x1ddaf754 
flushes:        0 
blocks:         488378640 
free blocks:    292574056 
root block:     125733 
tail policy:    0x2 (smart) 
next oid:       0xedae0 
file count:     138364 
tree height:    6 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE                                                 
                                                                          
            
        Read nodes 168671776                                              
                                                                          
            
        Nodes left in the tree 168671774 
                Leaves of them 166751030, Twigs of them 1898463 
        Nodes with wrong delimiting keys 2 
                Leaves of them 0, Twigs of them 1 
        Time interval: Thu Jul  7 20:44:19 2016 - Fri Jul  8 03:16:45 2016

CHECKING EXTENT REGIONS.                                                  
                                                                          
            
        Read twigs 1898463                                                
                                                                          
            
        Time interval: Fri Jul  8 03:16:45 2016 - Fri Jul  8 03:44:55 2016

Warn : Fatal corruptions were found. Semantic pass is skipped.            
                                                                          
            
***** fsck.reiser4 finished at Fri Jul  8 03:44:55 2016
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

This was done in the past:

http://www.spinics.net/lists/reiserfs-devel/msg04667.html
[This is the sequence of --checks and --build-fs times of Reiser4 volume
on disk /dev/sdb]
