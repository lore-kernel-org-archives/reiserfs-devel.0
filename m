From: Laurent Riffard <laurent.riffard@free.fr>
Subject: fixable corruption when re-creating file on reiser4 FS
Date: Sun, 18 Jan 2004 23:58:25 +0100
Message-ID: <400B0F91.4040607@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010406070800080804060005"
Return-path: <reiserfs-list-return-16562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs-List@namesys.com

--------------010406070800080804060005
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

When a file is re-created (ovrerwritten) on a reiser4 FS, its size 
seems to be handled uncorrectly.

Steps to reproduce the problem :
o create a reiser4 FS and mount it.
o create a file on it
o unmount the fs, remount it
o recreate the file (do not erase it, just overwrite it with new data)
o unmount the fs and fsck

System :
kernel 2.6.1 + supermount + resiser4 (23-Dec-2003)
reiser4progs 0.4.20

Attachments:
o output of debugfs -t
o detailed steps and outputs

-- 
laurent
(please CC me for any reply)


--------------010406070800080804060005
Content-Type: text/plain;
 name="debugfs.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="debugfs.log"

NODE (22) LEVEL=2 ITEMS=2 SPACE=3976 MKFS ID=0x32cfc610 FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF 28, LEN=8, flags=0x0 UNITS=1
[23]
------------------------------------------------------------------------------
#1  NPTR (nodeptr40): [2a:4(FB):74657374000000:10000:e50] OFF 36, LEN=8, flags=0x0 UNITS=1
[26]
==============================================================================
NODE (23) LEVEL=1 ITEMS=4 SPACE=0 MKFS ID=0x32cfc610 FLUSH=0x0
#0  SD (stat40): [29:1(SD):0:2a:0] OFF 28, LEN=44, flags=0x0 UNITS=1
exts:		2
mask:		0x3
plugin:		sdext_lw
offset:		2
len:		14
mode:		drwxr-xr-x
nlink:		3
size:		3
plugin:		sdext_unix
offset:		16
len:		28
uid:		0
gid:		0
atime:		Sun Jan 18 23:08:41 2004
mtime:		Sun Jan 18 23:09:34 2004
ctime:		Sun Jan 18 23:09:34 2004
rdev:		150
bytes:		150
------------------------------------------------------------------------------
#1  DENTRY (cde40): [2a:0(NAME):0:0:0] OFF 72, LEN=152, flags=0x0 UNITS=3
NR  NAME              OFFSET HASH                              SDKEY             
  0 .                     80 0000000000000000:0000000000000000 0000291:000002a
  1 ..                   104 0000000000000000:0000000000000000 0000291:000002a
  2 test                 128 0000000000000000:0000000000000000 00002a1:0010000
------------------------------------------------------------------------------
#2  SD (stat40): [2a:1(SD):74657374000000:10000:0] OFF 224, LEN=56, flags=0x0 UNITS=1
exts:		3
mask:		0x7
plugin:		sdext_lw
offset:		2
len:		14
mode:		-rw-r--r--
nlink:		1
size:		6120
plugin:		sdext_unix
offset:		16
len:		28
uid:		0
gid:		0
atime:		Sun Jan 18 23:09:34 2004
mtime:		Sun Jan 18 23:10:35 2004
ctime:		Sun Jan 18 23:10:35 2004
rdev:		12240
bytes:		12240
plugin:		sdext_lt
offset:		44
len:		12
atime:		461999488
mtime:		253757736
ctime:		253757736
------------------------------------------------------------------------------
#3  TAIL (tail40): [2a:4(FB):74657374000000:10000:0] OFF 280, LEN=3664, flags=0x0 
==============================================================================
NODE (26) LEVEL=1 ITEMS=1 SPACE=1574 MKFS ID=0x32cfc610 FLUSH=0x0
#0  TAIL (tail40): [2a:4(FB):74657374000000:10000:e50] OFF 28, LEN=2456, flags=0x0 
==============================================================================


--------------010406070800080804060005
Content-Type: text/plain;
 name="steps.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="steps.txt"

root# mkfs.reiser4 /dev/hda8
mkfs.reiser4 0.4.20
Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by 
reiser4progs/COPYING. 

Block size 4096 will be used.                                                 
Linux 2.6.1 is detected.                                                      
Uuid 0d637d6a-d8fb-4250-a2cc-22c9daf87bec will be used.                       
Reiser4 is going to be created on /dev/hda8.                                  
(Yes/No): y
Creating reiser4 on /dev/hda8...done

root# fsck.reiser4 /dev/hda8
[..]
No corruption found.

root# mount -treiser4 /dev/hda8 /mnt/disk
root# ps aux > /mnt/disk/test
root# ls -l /mnt/disk
total 6
-rw-r--r--    1 root     root         6120 jan 18 23:09 test
root# umount /dev/hda8
root# fsck.reiser4 /dev/hda8
[..]
No corruption found.

root# # Ok, once again :
root# mount -treiser4 /dev/hda8 /mnt/disk
root# ps aux > /mnt/disk/test
root# ls -l /mnt/disk
total 12
-rw-r--r--    1 root     root         6120 jan 18 23:10 test
root# umount /dev/hda8
root# fsck.reiser4 /dev/hda8
  *************************************************************
  ** If you are using the latest reiser4progs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
  ** messages  (including version), the reiser4fsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

Fscking the /dev/hda8 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue? 

(Yes/No): y
***** Openning the fs.
Reiser4 fs was detected on the /dev/hda8.
Master super block (16):
magic:          R4Sb
blksize:        4096
format:         0x0 (format40)
uuid:           0d637d6a-d8fb-4250-a2cc-22c9daf87bec
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.4.20
magic:          R4Sb-Default
flushes:        0
mkfs id:        0x32cfc610
blocks:         248999
free blocks:    248950
root block:     22
tail policy:    0x4 (smart)
next oid:       0x10001
file count:     1
tree height:    2
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.                 
        Read nodes 3                                                          
        Nodes left in the tree 3
                Leaves of them 2, Twigs of them 1
        Time interval: Sun Jan 18 23:12:07 2004 - Sun Jan 18 23:12:07 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 1                                                          
        Time interval: Sun Jan 18 23:12:07 2004 - Sun Jan 18 23:12:07 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.                 
Error: Node (23), item (2): StatData of the file [2a:74657374000000:10000] has 
the wrong bytes (12240), Should be (6120). Plugin (stat40). 
        Time interval: Sun Jan 18 23:12:07 2004 - Sun Jan 18 23:12:07 2004    
***** fsck.reiser4 finished at Sun Jan 18 23:12:07 2004
Closing fs...done

1 fixable corruptions were detected in the FileSystem. Run with --fix option to fix them.



--------------010406070800080804060005--

