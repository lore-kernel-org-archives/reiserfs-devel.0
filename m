From: f00bar <f00bar@sbcglobal.net>
Subject: I/O Errors
Date: Thu, 23 Sep 2004 17:38:01 -0700 (PDT)
Message-ID: <20040924003801.24702.qmail@web80801.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I have been having problems with my reiser4
partitions. I believed it was how I had my machine
configured but I doubt this assumption now.

I sucessfully created a resier4 fs on a LVM2 volume
group. After mounting it and executing a few basic i/o
things (like cp, mv, cat, ls, rm) all is okay.

After some emerging (I use Gentoo), I "lose" the fs. I
have even tried mkfs.resier4 and I still can not use
the fs.

# ls -l /var/tmp/portage
ls: reading directory /var/tmp/portage: Input/output
error

If I try to cp a file, no error, no file, but the
superblock does become corrupt.

I have 2 volume groups on one LVM partition spanning
the entire scsi drive. Half is an ext3 fs and the
other half is reiser4 fs. I mount one or the other as
/var/tmp/portage (where source code is compiled using
Gentoo) for testing purposes.

I am using reiser4progs and libaal 1.0.2_pre1.

# uname -a
Linux yin-yang 2.6.9-rc2-mm1-tao #1 SMP Sun Sep 19
03:14:18 CDT 2004 i686 AMD Athlon(tm) MP 2400+
AuthenticAMD GNU/Linux


# debugfs.reiser4 -p /dev/vgsdc1/reiser4
debugfs.reiser4 1.0.2-pre1
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser,
licensing governed by reiser4progs/COPYING.

Default profiles:
format:     "format40" (id:0x0 type:0x8)
journal:    "journal40" (id:0x0 type:0xf)
oid:        "oid40" (id:0x0 type:0x9)
alloc:      "alloc40" (id:0x0 type:0xe)
key:        "key_large" (id:0x1 type:0x10)
node:       "node40" (id:0x0 type:0x2)
statdata:   "stat40" (id:0x0 type:0x1)
nodeptr:    "nodeptr40" (id:0x3 type:0x1)
direntry:   "cde40" (id:0x2 type:0x1)
tail:       "tail40" (id:0x6 type:0x1)
extent:     "extent40" (id:0x5 type:0x1)
acl:        "absent (id:0x4 type:0x1)"
permission: "absent (id:0x0 type:0x6)"
regular:    "reg40" (id:0x0 type:0x0)
directory:  "dir40" (id:0x1 type:0x0)
symlink:    "sym40" (id:0x2 type:0x0)
special:    "spl40" (id:0x3 type:0x0)
hash:       "r5_hash" (id:0x1 type:0x3)
fibration:  "ext_1_fibre" (id:0x2 type:0x4)
formatting: "smart" (id:0x2 type:0x5)


# debugfs.reiser4 -s /dev/vgsdc1/reiser4
debugfs.reiser4 1.0.2-pre1
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser,
licensing governed by reiser4progs/COPYING.

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           a529df4c-09bb-4803-b5c1-33938d5bbc68
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver.
1.0.2-pre1
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x3bd87cf1
blocks:         553984
free blocks:    553937
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     0
tree height:    2
key policy:     LARGE

FS status block (21):
FS marked consistent

