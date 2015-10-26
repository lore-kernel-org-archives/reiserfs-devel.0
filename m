From: <doiggl@velocitynet.com.au>
Subject: Segmentation fault' in # fsck.reiser4  --fix --force  /dev/sdb
Date: Mon, 26 Oct 2015 11:07:23 +1100
Message-ID: <8b9ac5c40043c6fafa61a8ffdcdaac5a@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I get a 'Segmentation fault' in # fsck.reiser4  --fix --force  /dev/sdb
How do you find the cause of it ?

It got to 
CHECKING THE STORAGE TREE
about 12%

Using opensuse 64 bit [x86_64].

--Glenn

# fsck.reiser4  --fix --force  /dev/sdb
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                                     
Will fix minor corruptions of the Reiser4 SuperBlock.                     
                                                                          
                                     
Will fix minor corruptions of the Reiser4 FileSystem.                     
                                                                          
                                     
***** fsck.reiser4 started at Sun Oct 25 22:34:14 2015
FSCK: backup.c: 505: repair_backup_open: Found backup does not match to
the on-disk filesystem metadata.                                           
                                        
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
free blocks:    217146980 
root block:     37017218 
tail policy:    0x2 (smart) 
next oid:       0xedade 
file count:     188313 
tree height:    6 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE                                                 
                                                                   
        Read nodes 197008413                                              
                                                                   
        Nodes left in the tree 197008413 
                Leaves of them 194764277, Twigs of them 2217790 
        Time interval: Sun Oct 25 22:36:09 2015 - Mon Oct 26 06:12:32 2015

CHECKING EXTENT REGIONS.                                                  
                                              
        Read twigs 2217790                                                
                                              
        Time interval: Mon Oct 26 06:12:32 2015 - Mon Oct 26 08:22:47 2015

CHECKING THE SEMANTIC TREE                                                
                                              
FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize the
plugin for the directory [29:0:2a].              
FSCK: semantic.c: 651: repair_semantic_root_prepare: No root directory
opened. 
        Time interval: Mon Oct 26 08:22:48 2015 - Mon Oct 26 08:22:48 2015
                                              
FSCK: repair.c: 547: repair_sem_fini: On-disk used block bitmap and really
used block bitmap differ.                      
Segmentation fault

# which fsck.reiser4  
/usr/sbin/fsck.reiser4

# rpm -qf /usr/sbin/fsck.reiser4
reiser4progs-1.1.0-13.1.x86_64

-rpms installed
# rpm -qa| grep -i reiser4 |sort
                                                                          
                      
# rpm -qa| grep -i reiser4 |sort
kernel-reiser4-4.2.1-34.1.gd2bbe7f.x86_64
libreiser4-1_0-8-1.0.8-3.1.2.x86_64
libreiser4-1_1-0-1.1.0-13.1.x86_64
libreiser4-minimal-1_1-0-1.1.0-13.1.x86_64
reiser4progs-1.1.0-13.1.x86_64
reiser4progs-debuginfo-1.1.0-14.1.x86_64
reiser4progs-debugsource-1.1.0-14.1.x86_64
reiser4progs-devel-1.1.0-13.1.x86_64

Using patches in kernel:
reiser4-for-4.2.2.patch

[PATCHv2 0/3] reiser4: another batch of fixes for 4.2.
http://www.spinics.net/lists/reiserfs-devel/msg04912.html
