From: Jussi Suutari-Jaasko <energy@ee.oulu.fi>
Subject: fsck.reiser4 segfaults
Date: Wed, 9 Aug 2006 16:03:47 +0300 (EEST)
Message-ID: <Pine.GSO.4.61.0608091537430.19285@stekt2>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29556-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I'm have a little problem with my reiser4 partition...
I can't mount it anymore and I'm unable to repair it.
I have a AMD64 platform with 64-bit Gentoo installed.

Here's the short story:

1. I was using kernel 2.6.16 with reiser4-2.6.16-4 patch
and I installed new 2.6.17 kernel with reiser4-2.6.17-3
patch. (The kernel source is Gentoo-sources since I'm using
Gentoo :)

2. After rebooting with .17 kernel I ran fsck.reiser4
on my reiser4 partion (an error was reported in the
system log earlier, saying something about keys are
inconsistent..).

3. I rebooted (again) after having to do fsck.reiser4
  --build-fs and then my system refused to boot. The
screen filled with errors telling me about inconsistent
keys etc.

4. I tried to run fsck.reiser4 through two different
reiser4-capable LiveCDs but with no luck. The fsck.reiser4
always segfaults after 2% of the whole process. First
livecd had some .17 kernel and the other .14 kernel. Both
have reiser4tools-1.0.5.

Here's the output:

--- Cut ---

# fsck.reiser4 -y /dev/hda3

*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda3 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
***** fsck.reiser4 started at Wed Aug  9 12:51:43 2006
Reiser4 fs was detected on /dev/hda3.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           409056f8-a452-469f-9847-f5777eb14de6
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0xdf9f908
blocks:         19838256
free blocks:    15095656
root block:     7366
tail policy:    0x2 (smart)
next oid:       0x815411
file count:     392526
tree height:    4
key policy:     LARGE


CHECKING STORAGE TREE
FSCK: Node (7367): The left delimiting key 
[10005:1(SD):6c696263757273:5ebbe8:0] in the parent node (7366), pos (0/4294967295)
does not match the first key [29:1(SD):0:2a:0] in the node.
FSCK: Node (7366), item (0), unit (0): Points to the node [7367] with wrong 
delimiting keys. The whole subtree is skipped.
FSCK: Node (238887), item (39), unit (0): Points to the block (7366) which 
is in the tree already. The whole subtree is skipped.
Segmentation fault

#

--- Cut ---

It does the same with all option (--fix etc).
Here's the output when I try to mount the partition:

--- Cut ---

# mount /dev/hda3 /mnt/gentoo

reiser4[mount(17242)]: traverse_tree (fs/reiser4/search.c:731)[nikita-373]:
WARNING: not found on internal node: level: 3, lock_level: 1, stop_level: 1 
lock_mode: read, bias: exact
reiser4[mount(17242)]: key_warning 
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
WARNING: Error for inode 42 (-2)
mount: No such file or directory

#

--- Cut ---

The system log says nothing. I'm a bit lost what to do.
I had some important files on that partition (and yes,
I should have done a backup). Is there a way to fix the
partition?

- Jussi
