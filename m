From: "Matt Roberts" <matt@dworkin.org>
Subject: Segmentation fault in reiserfsck --rebuild-tree
Date: Sat, 1 Nov 2003 11:09:20 +0000
Message-ID: <20031101105809.M73812@dworkin.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

File system went a little fooey, and rebuild-tree was the suggested fix.

On running it the first time it went through around 40% before falling over.  
Further runs don't make it past the 0% marker.

This is running SuSE 8.2 from the CD (rescue mode), which I think is Kernel 
2.4.20.  The machine is an AMD Duron 1.3Ghz, 512MB RAM.

I compiled (on another system) the latest version of the utility programs and 
tried those, but the same result occurs.

Below is the details of what I've run/received thus far:

NB:  Yes I can rebuild the fs and have backups /but/ I don't think thats a 
good reason to ignore a crash!  If this utility worked correctly it would have 
saved me (and probably others) a whole lotta time.  So in the attempt at 
making the world a better place, I present this bug report! ;)

----------------------------

debugreiserfs /dev/hda1

Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x301 of format 3.6 with standard journal
Count of blocks on the device: 4719085
Number of bitmaps: 145
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 4719085
Root block: 0
Filesystem is cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 104, max 972
Journal parameters:
	Device [0x0]
	Magic [0x0]
	Size 8193 blocks (including 1 for journal header) (first block 18)
	Max transaction length 1024 blocks
	Max batch size 900 blocks
	Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x3:
	FATAL corruptions exist.
	 some corruptions exist.
sb_version: 2
inode generation number: 1002179
UUID: e297274f-5544-44ca-a114-1aa6c6d6c922
LABEL: 
Set flags in SB:
	ATTRIBUTES CLEAN


-----

reiserfsck --rebuild-tree /dev/hda1

Will rebuild the filesystem (/dev/hda1) tree

Replaying journal..
0 transactions replayed

#####
reiserfsck --rebuild-tree started at Nov  1 10:45:16
#####

Pass 0:
Loading on-disk bitmap.. ok, 3596247 blocks marked used
Skipping 8355 (super block, journal, bitmaps) 3587892 blocks will be read
0%Segmentation fault                             left 3518484, 13881 /sec

Nov  1 10:45:21 Rescue kernel:  <1>Unable to handle kernel NULL pointer 
dereference at virtual address 00000808
Nov  1 10:45:21 Rescue kernel:  printing eip:
Nov  1 10:45:21 Rescue kernel: c013437b
Nov  1 10:45:21 Rescue kernel: *pde = 00000000
Nov  1 10:45:21 Rescue kernel: Oops: 0000 2.4.20-4GB #1 Mon Mar 17 17:54:44 
UTC 2003
Nov  1 10:45:21 Rescue kernel: CPU:    0
Nov  1 10:45:21 Rescue kernel: EIP:    0010:[<c013437b>]    Not tainted
Nov  1 10:45:21 Rescue kernel: EFLAGS: 00010206
Nov  1 10:45:21 Rescue kernel: eax: 00000800   ebx: 00000004   ecx: 00000011   
edx: 00007b56
Nov  1 10:45:21 Rescue kernel: esi: c288fcc8   edi: c179ed58   ebp: 00014f94   
esp: c05b9f28
Nov  1 10:45:21 Rescue kernel: ds: 0018   es: 0018   ss: 0018
Nov  1 10:45:21 Rescue kernel: Process reiserfsck (pid: 523, 
stackpage=c05b9000)
Nov  1 10:45:21 Rescue kernel: Stack: 00001000 00000000 00000000 00000000 
c288fc20 00000000 c0134910 c05b9f7c 
Nov  1 10:45:21 Rescue kernel:        c40c9ec0 c40c9ea0 00000000 080dc4c8 
00000000 080dc4c8 c0134b05 c40c9ea0 
Nov  1 10:45:21 Rescue kernel:        c40c9ec0 c05b9f7c c0134910 00000000 
c0346f40 00000000 00001000 080dc4c8 
Nov  1 10:45:21 Rescue kernel: Call Trace:    [<c0134910>] [<c0134b05>] 
[<c0134910>] [<c0144a18>] [<c0108c33>]
Nov  1 10:45:21 Rescue kernel: Code: 39 70 08 75 f4 39 68 0c 75 ef 89 c3 85 c0 
0f 84 4e 02 00 00 
