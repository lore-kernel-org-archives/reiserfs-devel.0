From: Patrik Wallstrom <pawal@blipp.com>
Subject: reiserfsck --rebuild-tree is very slow
Date: Sun, 4 Aug 2002 23:21:48 +0200
Message-ID: <20020804212148.GC6570@vic20.blipp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,
I've been running "reiserfsck --rebuild-tree /dev/hdd" for 24h now on
a 40Gb drive that is 99% full. I am using reiserfsprogs 3.6.2 from
Debian unstable.

The result of reiserfsck --check and the result with --fix-fixable:
bread: Cannot read a block # 10052279.

The --rebuild-sb seemed successful:

Did you use resiser(y/n)[n]:
rebuild-sb: wrong block count occured (10052280), fixed (6193026)
rebuild-sb: wrong bitmap number occured (307), fixed (189)
rebuild-sb: no uuid found, a new uuid generated
(c30996b1-8a54-45db-8407-102bc973b42b)
rebuild-sb: wrong journal max transaction length occured (0), fixed (1024)
rebuild-sb: wrong journal max batch size occured (0), fixed (900)
rebuild-sb: wrong journal  max commit age occured (0), fixed (30)
Reiserfs super block in block 16 on 0x1640 of format 3.6 with standard
journal
Count of blocks on the device: 6193026
Number of bitmaps: 189
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 82842
Root block: 8384
Filesystem is cleanly umounted
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 20, max 972
Journal parameters:
	Device [0x0]
	Magic [0x0]
	Size 8193 blocks (including 1 for journal header) (first block 18)
	Max transaction length 1024 blocks
	Max batch size 900 blocks
	Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x1
sb_version: 2
inode generation number: 4240
UUID: c30996b1-8a54-45db-8407-102bc973b42b
LABEL:
Set flags in SB:

Is this ok ? (y/n)[n]: y

Do not forget to run reiserfsck --rebuild-tree


Here's my results so far from the --rebuild-tree session:

Replaying journal..
No transactions found
###########
reiserfsck --rebuild-tree started at Sat Aug  3 22:07:31 2002
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 6110187 blocks marked used
Skipping 8399 blocks (super block, journal, bitmaps) 6101788 blocks
will be read
0%                                                         left 5911812, 2 =
/sec

=46rom what I can see, this session can last for many years...

Any advise?

--=20
patrik_wallstrom->foodfight->pawal@blipp.com->+46-709580442
