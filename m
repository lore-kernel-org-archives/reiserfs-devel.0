From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: i/o error (lost+found) with reiser4
Date: Sun, 22 Feb 2004 23:38:23 +0100
Message-ID: <200402222338.23623.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_f9SOACBR/Jy9HtI"
Return-path: <reiserfs-list-return-16879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_f9SOACBR/Jy9HtI
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

after the regular stat data error, i try to fix the fs as usual. Today the 
fsck program complains the first time about a fatal corruption. I attached 
the output from the first fsck run.

I run fsck with option "build-fs" as recommended, and it seems to fix the 
error. But now a "ls" in the root of the reiser4 partiton complains about a 
input/ output error on the directory "lost+found". 
Output from the system log:

+++++++++
reiser4[ls(14750)]: check_open_format40 
(fs/reiser4/plugin/disk_format/disk_format40.c:551)[vpf-1360]:
WARNING: The object with the oid 3441763 greater then the max used oid 3441762 
found.
reiser4[ls(14831)]: check_open_format40 
[...the same with stat, bash...]
+++++++++

Error messages from ls, stat..:

+++++++++
# ls /var/tmp/
ls: /var/tmp/lost+found: Input/output error  
ccache  distfiles  emerge-webrsync  kdecache-party  portage  portage-pkg  sync 

# stat /var/tmp/lost+found
stat: cannot stat `/var/tmp/lost+found': Input/output error

# cd /var/tmp/lost+found
-bash: cd: /var/tmp/lost+found: Input/output error

#fsck.reiser4 /dev/hdd8 
...
No corruption found.
+++++++++

Should i rebuild the partition? Is this a know problem?


Best regards,

Henning

--Boundary-00=_f9SOACBR/Jy9HtI
Content-Type: text/plain;
  charset="us-ascii";
  name="fsck.hdd8.out"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="fsck.hdd8.out"

*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read REAMDE first.
*******************************************************************

Fscking the /dev/hdd8 block device.
Will fix minor corruptions of the Reiser4 SuperBblock.
Will fix minor corruptions of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Openning the fs.
Reiser4 fs was detected on the /dev/hdd8.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           921a81ba-f1aa-47b8-846c-71af014be94d
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x46a0ee0e
blocks:         2441872
free blocks:    1450517
root block:     510075
tail policy:    0x4 (smart)
next oid:       0x348463
file count:     214556
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
        Read nodes 116088
        Nodes left in the tree 116087
                Leaves of them 113839, Twigs of them 2205
        Nodes with wrong delimiting keys 1
                Leaves of them 1, Twigs of them 0
        Time interval: Sun Feb 22 22:50:17 2004 - Sun Feb 22 22:51:53 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 2205
        Time interval: Sun Feb 22 22:51:53 2004 - Sun Feb 22 22:51:54 2004

Error: Node (1073153): The first key [3220ba:4(FB):7374616e646172:3220d1:af] is not equal to 
the left delimiting key [347a51:4(FB):706d736f6c6964:347db5:80]. 
Error: Node (1073073), item (49), unit (0): Points to the node [1073153] with wrong delimiting
keys. The whole subtree is skipped. 

Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Sun Feb 22 22:51:54 2004
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs option
to fix them.
--Boundary-00=_f9SOACBR/Jy9HtI--
