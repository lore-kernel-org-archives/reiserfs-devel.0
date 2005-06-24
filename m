From: Pat Double <pat@patdouble.com>
Subject: Reiser4 corruption with 2.6.12.1
Date: Fri, 24 Jun 2005 13:46:09 -0500
Message-ID: <200506241346.09072.pat@patdouble.com>
Reply-To: pat@patdouble.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24559-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

This may be an unsupported setup, but I am experiencing reproducable errors 
with reiser4 on 2.6.12.1. I used the 2.6.12-rc5-mm2 patch set (broken.out.2) 
against a vanilla 2.6.12.1 kernel. I did not get any patch failures but a few 
offsets. I get errors whenever I add or remove a file in the root directory. 
Inside other directories seems to be fine according to fsck.

It is easy to reproduce:

1. mkfs.reiser4 -y /dev/ram1
2. mount -t reiser4 /dev/ram1 /mnt
3. cp <some file> /mnt
4. umount /mnt
5. fsck.reiser4 -y /dev/ram1

CHECKING STORAGE TREE
FSCK: Node (24), item (0), [29:1(SD):0:2a:0]: does not look like a valid SD 
plugin set extention: wrong pset member
count detected (12).
FSCK: Node (24), item (0), [29:1(SD):0:2a:0]: does not look like a valid stat 
data.
FSCK: Node (24), item (0), [29:1(SD):0:2a:0]: broken item found.
FSCK: Node (24): the node is broken. Pointed from the node (25), item (0), 
unit (0). The whole subtree is skipped.
        Read nodes 2
        Nodes left in the tree 1
                Leaves of them 0, Twigs of them 1
        Broken of them 1
                Leaves of them 1, Twigs of them 0
        Time interval: Fri Jun 24 13:44:15 2005 - Fri Jun 24 13:44:15 2005
CHECKING EXTENT REGIONS.
        Read twigs 1
        Time interval: Fri Jun 24 13:44:15 2005 - Fri Jun 24 13:44:15 2005
Warn : Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Fri Jun 24 13:44:15 2005
Closing fs...done


Running with --build-fs will fix the problem. If I create a directory, fix it 
with fsck --build-fs, then copy files into the directory I do not get errors.

I'm expecting to hear I should wait for the 2.6.12.1 patches or use the -mm 
kernel, but checking nonetheless.

Thanks.

-- 
Pat Double, pat@patdouble.com
"In the beginning God created the heaven and the earth."
