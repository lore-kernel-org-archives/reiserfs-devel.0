From: <doiggl@velocitynet.com.au>
Subject: Is it possible to obtain a list of file-names from Reiser4 meta-data ? [/dev/sdb]
Date: Sat, 13 Aug 2016 21:30:58 +1000
Message-ID: <0c27cab68d58945de4732824bd03313f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Hello
Question:

- Is it possible to obtain a list of file-names from Reiser4 meta-data ?
If so - How is it done ?

I would like to use ls.c [compiled source in reiser4progs-1.1.0/demos/] to
make a copy of the files.

But I suppose it depends on # fsck.reiser4... working correctly ?

I see:
file count:     138,364 

Thanks
--Glenn



Format super block (17): 
plugin:         format40 
description:    Disk-format plugin. 
version:        1 
magic:          ReIsEr40FoRmAt 
mkfs id:        0x1ddaf754 
flushes:        0 
blocks:         488378640 
free blocks:    292581422 
root block:     6184390 
tail policy:    0x2 (smart) 
next oid:       0xedae0 
file count:     138364 
tree height:    6 
key policy:     LARGE 


- so far  shows [still in progress]

# fsck.reiser4 --check --force  /dev/sdb -L
/tmp/fsck.reiser4-2016-08-13-check-sdb.log
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                                                                          
                                                                          
             
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
                                                                          
                                                                          
             
Will check the consistency of the Reiser4 FileSystem.                     
                                                                          
                                                                          
                                                                          
             
***** fsck.reiser4 started at Sat Aug 13 12:52:44 2016
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
free blocks:    292581422 
root block:     6184390 
tail policy:    0x2 (smart) 
next oid:       0xedae0 
file count:     138364 
tree height:    6 
key policy:     LARGE 
 
 
CHECKING THE STORAGE TREE                                                 
                                                                          
                                                                          
                                                                          
             
        Read nodes 168671065                                              
                                                                          
                                                                          
                                                                          
                        
        Nodes left in the tree 168671063                                  
                                                                          
                                                                          
                                                                          
                          
                Leaves of them 166750328, Twigs of them 1898455           
                                                                          
                                                                          
                                                                          
                          
        Nodes with wrong delimiting keys 2                                
                                                                          
                                                                          
                                                                          
                          
                Leaves of them 0, Twigs of them 0                         
                                                                          
                                                                          
                                                                          
                          
        Time interval: Sat Aug 13 12:54:41 2016 - Sat Aug 13 19:33:39 2016
                                                                          
                                                                          
                                                                          
                          
CHECKING EXTENT REGIONS.                                                  
                                                                          
                                                                          
                                                                          
                        
        Read twigs 1898455                                                
                                                                          
                                                                          
                                                                          
                        
        Time interval: Sat Aug 13 19:33:39 2016 - Sat Aug 13 20:02:01 2016

Warn : Fatal corruptions were found. Semantic pass is skipped.            
                                                                          
                                                                          
                                                                          
                        
***** fsck.reiser4 finished at Sat Aug 13 20:02:01 2016
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.



# fsck.reiser4 --build-fs --force  /dev/sdb -L
/tmp/fsck.reiser4-2016-08-13-build-fs-sdb.log
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdb block device.                                        
                                                                          
                                                                          
                                                                          
                        
Will check the consistency of the Reiser4 SuperBlock.                     
                                                                          
                                                                          
                                                                          
                        
Will build the Reiser4 FileSystem.                                        
                                                                          
                                                                          
                                                                          
                        
***** fsck.reiser4 started at Sat Aug 13 20:19:17 2016
01%
