From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Thu, 3 Jun 2004 14:07:31 +0300
Message-ID: <200406031407.32025.rmeijer@internet.gr>
References: <200406021554.11690.rmeijer@internet.gr> <20040602162348.GH4990@nysv.org> <20040602163444.GG8091@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040602163444.GG8091@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed 2 June 2004 19:34, Alex Zarochentsev wrote:

> > >> But there was a kernel Oops and something like:
> > >> "page_extent: trying to read past end of device. Want=23252123
> > >> Limit=83380"

> > >It would be fine to see a (decoded) stack trace.

I mounted the partition that causes the Oops (/dev/sys/usr on /usr) and tried
to run gcc from it. This was the result:

# /usr/bin/gcc
attempt to access beyond end of device
dm-3: rw=0, want=16777224, limit=8388608
attempt to access beyond end of device
dm-3: rw=0, want=16777224, limit=8388608
reiser4[bash(80)]: read_extent (fs)reiser4/plugin/item/extent_file_ops.c:993)[jmacd-97178]:
WARNING: extent_read: page is not up to date
bash: /usr/bin/gcc: cannot execute binary file
#

After that the kernel basically hangs...both 2.6.6-mm2 and 2.6.7-rc1. Exactly
the same message. So maybe there is something wrong with the filesystem after
all.

> Do you use RAID or LVM ?

I use LVM2:

  --- Logical volume ---
  LV Name                /dev/sys/usr
  VG Name                sys
  LV UUID                IskqlG-zNsy-4qIB-1Y6O-dlbQ-ciDT-OT4svJ
  LV Write Access        read/write
  LV Status              available
  # open                 4
  LV Size                4.00 GB
  Current LE             128
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:3

The weird thing is, though, that I cannot fsck this partition properly:

# fsck.reiser4 /dev/sys/usr
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sys/usr block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Opening the fs.
Reiser4 journal (journal40) on /dev/sys/usr: 0 transactions replayed of the total 0 blocks.
Reiser4 fs was detected on /dev/sys/usr.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           0a8cc420-fbe3-4e91-97f4-f6748e0bc243
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.4
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x1b371ddb
blocks:         1048576
free blocks:    511894
root block:     47189
tail policy:    0x4 (smart)
next oid:       0x64322
file count:     127474
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
        Read nodes 87921
        Nodes left in the tree 87921
                Leaves of them 86219, Twigs of them 1673
        Time interval: Thu Jun  3 13:58:24 2004 - Thu Jun  3 13:59:30 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 1673
        Time interval: Thu Jun  3 13:59:30 2004 - Thu Jun  3 13:59:30 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Segmentation fault

I will try the reiser4progs-0.5.4_convertion.patch that Vitaly posted to see
if that makes any difference...


Ray
