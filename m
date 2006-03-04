From: Hannes Krueger <Hannes.Krueger@uibk.ac.at>
Subject: deleting file crashes kernel 2.6.8 / reiserfs 3.6
Date: Sat, 4 Mar 2006 13:39:14 +0100
Message-ID: <200603041339.14922.Hannes.Krueger@uibk.ac.at>
Reply-To: Hannes.Krueger@uibk.ac.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I have two files on my reiserfs, which I cannot delete. "rm" these files 
immidiately locks the kernel, no messages. I already tried reiserfsck 
--fix-fixable, but it doesn't help.

I can move these files, and copy them. I can also remove the copies. But 
overwriting or deleting results in the kernel lockup, the machine freezes.

I think these files were written during  a system crash. But how to get rid of 
them? Is the filesystem still OK? 

Any suggestions?

Its a SuSE 9.2  (2.6.8-24.20-default)



Below I inserted the output of debgreiserfs:


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x303 of format 3.6 with standard journal
Count of blocks on the device: 5893776
Number of bitmaps: 180
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 1570082
Root block: 533794
Filesystem is NOT clean
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 294, max 972
Journal parameters:
        Device [0x0]
        Magic [0x1765aa13]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 1438830
UUID: d7713a05-8e46-444a-a4a3-4606023f3e01
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN
