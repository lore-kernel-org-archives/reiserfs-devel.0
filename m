From: f00bar <f00bar@sbcglobal.net>
Subject: Something is not right...
Date: Sun, 15 Aug 2004 15:00:02 -0700 (PDT)
Message-ID: <20040815220002.65404.qmail@web80806.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20305-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I am having an issue creating and mounting a new
partition with 2.6.8-rc4-mm1 & and latest snapshot.

# mkfs.reiser4 -qf /dev/sdc1
# mount -treiser4 /dev/sdc1 /var/tmp/portage

if I try:
# ls /var/tmp/portage
ls: reading directory /var/tmp/portage: Input/output
error


so... here is some more info...

I have 8K stacks and all debugging options for resier4
enabled.

# uname -a
2.6.8-rc4-mm1 #1 SMP Sun Aug 15 14:08:05 CDT 2004 i686
AMD Athlon(tm) MP 2400+ AuthenticAMD GNU/Linux

# debugfs.reiser4 /dev/sdc1
debugfs.reiser4 1.0.0
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser,
licensing governed by reiser4progs/COPYING. 

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           92934d00-0000-0000-0000-000000000000
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 1.0.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x273042db
blocks:         1110485
free blocks:    1110419
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     0
tree height:    2
key policy:     LARGE

FS status block (21):
FS marked consistent


# debugfs.reiser4 -t /dev/sdc1
debugfs.reiser4 1.0.0
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser,
licensing governed by reiser4progs/COPYING. 

NODE (23) LEVEL=2 ITEMS=1 SPACE=4022 MKFS
ID=0x273042db FLUSH=0x0
#0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8,
flags=0x0 UNITS=1
[24]
==============================================================================
NODE (24) LEVEL=1 ITEMS=2 SPACE=3808 MKFS
ID=0x273042db FLUSH=0x0
#0  SD (stat40): [29:1(SD):0:2a:0] OFF=28, LEN=82,
flags=0x0 UNITS=1
exts:           3
mask:           0x13
plugin:         sdext_lw
offset:         2
len:            14
mode:           drwxr-xr-x
nlink:          3
size:           2
plugin:         sdext_unix
offset:         16
len:            28
uid:            0
gid:            0
atime:          Sun Aug 15 16:43:34 2004
mtime:          Sun Aug 15 16:43:34 2004
ctime:          Sun Aug 15 16:43:34 2004
rdev:           100
bytes:          100
plugin:         sdext_plug
offset:         44
len:            38
Pset count:     9
    permission : id = 0
    formatting : id = 2 (smart)
          hash : id = 1 (r5_hash)
     fibration : id = 2 (ext_1_fibre)
      statdata : id = 0 (stat40)
       diritem : id = 2 (cde40)
        crypto : id = 0
        digest : id = 0
      compress : id = 0
------------------------------------------------------------------------------
#1  DIRITEM (cde40): [2a:0(NAME):0:0:0] OFF=110,
LEN=102, flags=0x0 UNITS=2
NR  NAME                                  OFFSET HASH 
                            SDKEY             
  0 .                                         54
0000000000000000:0000000000000000 0000291:000002a
  1 ..                                        78
0000000000000000:0000000000000000 0000291:000002a
==============================================================================

