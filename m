From: Fabian Sturm <f@rtfs.org>
Subject: No space left on device error
Date: Wed, 16 Jun 2004 13:30:42 +0200
Message-ID: <1087385442.32601.20.camel@krypton.home.rtfs.org>
References: <1087384311.24501.ezmlm@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1087384311.24501.ezmlm@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi!

There seems to be a bug in reiserfs as it is shipped with 
the linux 2.6.6 kernel.

The problem is that if I copy a file the reiser filesystem I get

  cat: write error: No space left on device 

(was cat /dev/zero >file). Even so the partition is far from 
being full. 

df:
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda6             40482528  30933852   9548676  77% /data

This sounded exactly as this mail report (funny it is also at 77%)

Anyway, none of the logs shows any output about reiser (e.g. dmesg)
so I did a reiserfsck /dev/hda6 but it exited without output.
And now the dmesg showed this messages:

vs-4080: reiserfs_free_block: free_block (hda6:5799939)[dev:blocknr]:
bit already cleared
vs-4080: reiserfs_free_block: free_block (hda6:5799938)[dev:blocknr]:
bit already cleared
[...]

I can't say for sure that reiserfsck created these messages since it
could also be from the mount/unmount or debugreiserfs/reiserfstune.
Even so I only called them for some verbose output.

Anyway now I can create a little bit bigger files and I get the no space
left when the usage reaches:

  /dev/hda6             40482528  33349560   7132968  83% /data

So I guess I run out of some structures to hold new data? And the
reiserfsck might have freed some more so I now can hold a little bit
more data.

So any help would be appreciated.

My system:
Linux 2.6.6 #1 i686 AMD Athlon(tm) XP 2800+ AuthenticAMD 

debugreiserfs:
Reiserfs super block in block 16 on 0x306 of format 3.6 with standard
journal
Count of blocks on the device: 10120942
Number of bitmaps: 309
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 1783242
Root block: 62628
Filesystem is cleanly umounted
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 90, max 972
Journal parameters:
        Device [0x0]
        Magic [0x4fbe6309]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 28165
UUID: 3c25e89d-040c-4b75-a88b-ec05ba20b72d
LABEL:
Set flags in SB:


