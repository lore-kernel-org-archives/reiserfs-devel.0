From: Ragnar Hojland Espinosa <ragnar@linalco.com>
Subject: problem with a bad block in bitmap table
Date: Wed, 27 Aug 2003 15:20:52 +0200
Message-ID: <20030827132052.GA13552@linalco.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15458-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

One of my HDs at home is dying, bad blocks (and other nastiness)
appeared, and I can't mount it to recover whatever I might, as it
complains on a bad block (32768) on a rather unfriendly place:

Reiserfs super block in block 16 on 0x342 of format 3.6 with standard
journal
Count of blocks on the device: 29758176
Number of bitmaps: 909
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 10387673
Root block: 29563
Filesystem is cleanly umounted
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
        Device [0x0]
        Magic [0x4717a945]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 249455
UUID: 00c2f3c4-a19c-4bc7-9efc-6a750c69bcd5
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN

The problem has occurred looks like a hardware problem.
If you have bad blocks, we advise you to get a new hard
drive, because once you get one bad block that the disk
drive internals cannot hide from your sight, the chances
of getting more are generally said to become much higher
(precise statistics are unknown to us), and this disk drive
is probably not expensive enough for you to risk your time
and data on it. If you don't want to follow that advice,
then if you have just a few bad blocks, try writing to the
bad blocks and see if the drive remaps the bad blocks (that
means it takes a block it has in reserve and allocates it
for use for requests of that block number).  If it cannot
remap the block, this could be quite bad, as it may mean
that so many blocks have gone bad that none remain in
reserve to allocate.

bread: Cannot read the block (32768): (Input/output error).


Aug 27 14:36:09 lightside kernel: reiserfs: found format "3.6" with standard journal
Aug 27 14:36:10 lightside kernel: hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
Aug 27 14:36:10 lightside kernel: hdb: read_intr: error=0x40 { UncorrectableError }, LBAsect=302464, sector=262144
Aug 27 14:36:10 lightside kernel: end_request: I/O error, dev 03:42 (hdb), sector 262144
Aug 27 14:36:10 lightside kernel: ide0(3,66):sh-2029: reiserfs read_bitmaps: bitmap block (#32768) reading failed
Aug 27 14:36:10 lightside kernel: ide0(3,66):sh-2014: reiserfs_read_super: unable to read bitmap
Aug 27 14:36:12 lightside kernel: hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
Aug 27 14:36:12 lightside kernel: hdb: read_intr: error=0x40 { UncorrectableError }, LBAsect=52993408, sector=52953088
Aug 27 14:36:12 lightside kernel: end_request: I/O error, dev 03:42 (hdb), sector 52953088


Unfortunately I dont have enough space to do a dd of 120 GB and make a
backup of the beast, so I'm not feelink very adventureous.  First I
would run a badblocks -n, and then another badblocks with an
add-bad-block to mark the block as used.. but unfortunantely it seems
that it requires a file in the command line?  Or should I run a
--check-tree..    I'm a bit lost without debugfs and dump.

I managed to get a debugreiserfs -d  and get some dir entries im
interested in (then it got to a bad block and it aborted)  How could I
dump the content of one of the files referenced here to, say, stdout?


| 28|55231 55232 0x0 SD (0), len 44, location 3188 entry count 65535, fsck need 0, format new|
(NEW SD), mode drwxr-xr-x, size 168, nlink 2, mtime 22/2003 23:08:02 blocks 1, uid 0
-------------------------------------------------------------------------------
| 29|55231 55232 0x1 DIR (3), len 168, location 3020 entry count 5, fsck need 0, format old|
###: Name                     length    Object key           Hash Gen number
  0: ".                        "(  1)       [55231 55232] 0 1, loc 160, state 4 not set
  1: "..                       "(  2)       [55129 55231] 0 2, loc 152, state 4 not set
  2: "digest-zapping-0.6.4-r1  "( 23)       [55232 55233] 135843456 0, loc 128, state 4 "r5"
  3: "digest-zapping-0.6.6     "( 20)       [55232 55234] 839088256 0, loc 104, state 4 "r5"
  4: "digest-zapping-0.6.7     "( 20)       [55232 55237] 839088512 0, loc 80, state 4 "r5"


Please Cc: as I'm not subscribed.
-- 
Ragnar Hojland - Project Manager
Linalco "Specialists in Linux and Free Software"
http://www.linalco.com Tel: +34-91-5970074 Fax: +34-91-5970083
