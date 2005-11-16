From: iv <iv@zabuchy.net>
Subject: reiserfsck --rebuild-tree failure
Date: Wed, 16 Nov 2005 18:27:43 +0100
Message-ID: <437B6C0F.8040604@zabuchy.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040403010703090501040900"
Return-path: <reiserfs-list-return-26963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------040403010703090501040900
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

i'm following an advice to send a bug report about failed reiserfsck
--rebuild-tree found at http://www.namesys.com/faq.html#rebuild-tree.
i tried to compile the newest reiserfsprogs-3.6.15-pre1 but it fails
while doing "make": make.log.
so i run reiserfsck from a package (reiserfsck 3.6.13-pre1 (2003
www.namesys.com)). it also failed: fsck.log.
i've got a lot of error massages in kern.log: kern.log.
obvious, there are badblocks: badblocks.log.
i still can read from damaged partition. when i run `strings /dev/hdc3`
i get plently of text.
the question is if there is a way to mount the partition.
thanks in advance.
ivan matviyuk.


--------------040403010703090501040900
Content-Type: text/plain;
 name="make.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="make.log"

arkstar:/home/iv/installs/reiserfsprogs-3.6.15-pre1# make
Making all in include
make[1]: Entering directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/include'
make  all-am
make[2]: Entering directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/include'
make[2]: Leaving directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/include'
make[1]: Leaving directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/include'
Making all in lib
make[1]: Entering directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/lib'
if gcc -DHAVE_CONFIG_H -I. -I. -I../include     -g -Wall -O2 -fPIC -DPIC -MT misc.o -MD -MP -MF ".deps/misc.Tpo" \
-c -o misc.o `test -f 'misc.c' || echo './'`misc.c; \
then mv ".deps/misc.Tpo" ".deps/misc.Po"; \
else rm -f ".deps/misc.Tpo"; exit 1; \
fi
misc.c: In function 'get_dma_support':
misc.c:682: warning: implicit declaration of function 'IDE_DISK_MAJOR'
rm -f libmisc.a
ar cru libmisc.a io.o misc.o
ranlib libmisc.a
make[1]: Leaving directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/lib'
Making all in reiserfscore
make[1]: Entering directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/reiserfscore'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/reiserfscore'
Making all in fsck
make[1]: Entering directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/fsck'
gcc  -g -Wall -O2 -fPIC -DPIC   -o reiserfsck  main.o pass0.o pass1.o pass2.o semantic_check.o semantic_rebuild.o pass4.o lost+found.o ubitmap.o uobjectid.o ustree.o ufile.o check_tree.o info.o super.o ../lib/libmisc.a ../reiserfscore/libcore.a
../lib/libmisc.a(misc.o): In function `get_dma_support':
/home/iv/installs/reiserfsprogs-3.6.15-pre1/lib/misc.c:682: undefined reference to `IDE_DISK_MAJOR'
../reiserfscore/libcore.a(reiserfslib.o): In function `can_we_format_it':
/home/iv/installs/reiserfsprogs-3.6.15-pre1/reiserfscore/reiserfslib.c:1216: undefined reference to `IDE_DISK_MAJOR'
/home/iv/installs/reiserfsprogs-3.6.15-pre1/reiserfscore/reiserfslib.c:1216: undefined reference to `SCSI_BLK_MAJOR'
collect2: ld returned 1 exit status
make[1]: *** [reiserfsck] Error 1
make[1]: Leaving directory `/home/iv/installs/reiserfsprogs-3.6.15-pre1/fsck'
make: *** [all-recursive] Error 1
darkstar:/home/iv/installs/reiserfsprogs-3.6.15-pre1#

--------------040403010703090501040900
Content-Type: text/plain;
 name="fsck.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fsck.log"

darkstar:/home/iv/installs/reiserfsprogs-3.6.13-pre1# /usr/local/sbin/reiserfsck --rebuild-tree -S /dev/hdc3
reiserfsck 3.6.13-pre1 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem (/dev/hdc3) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Wed Nov 16 17:02:12 2005
###########

Pass 0:
####### Pass 0 #######
The whole partition (21972896 blocks) is to be scanned
Skipping 8881 blocks (super block, journal, bitmaps) 21964015 blocks will be read
0%....20%....40%....60%....80%...                      left 1619379, 14147 /sec
The problem has occurred looks like a hardware problem. If you have
bad blocks, we advise you to get a new hard drive, because once you
get one bad block  that the disk  drive internals  cannot hide from
your sight,the chances of getting more are generally said to become
much higher  (precise statistics are unknown to us), and  this disk
drive is probably not expensive enough  for you to you to risk your
time and  data on it.  If you don't want to follow that follow that
advice then  if you have just a few bad blocks,  try writing to the
bad blocks  and see if the drive remaps  the bad blocks (that means
it takes a block  it has  in reserve  and allocates  it for use for
of that block number).  If it cannot remap the block,  use badblock
option (-B) with  reiserfs utils to handle this block correctly.

bread: Cannot read the block (20359834): (Input/output error).

--------------040403010703090501040900
Content-Type: text/plain;
 name="kern.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="kern.log"

Nov 16 17:26:12 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:12 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181232
Nov 16 17:26:12 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:12 darkstar kernel: end_request: I/O error, dev hdc, sector 192181232
Nov 16 17:26:12 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439336
Nov 16 17:26:14 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:14 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181234
Nov 16 17:26:14 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:14 darkstar kernel: end_request: I/O error, dev hdc, sector 192181234
Nov 16 17:26:14 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439337
Nov 16 17:26:17 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:17 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181236
Nov 16 17:26:17 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:17 darkstar kernel: end_request: I/O error, dev hdc, sector 192181236
Nov 16 17:26:17 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439338
Nov 16 17:26:19 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:19 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181238
Nov 16 17:26:19 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:19 darkstar kernel: end_request: I/O error, dev hdc, sector 192181238
Nov 16 17:26:19 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439339
Nov 16 17:26:21 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:21 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181240
Nov 16 17:26:21 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:21 darkstar kernel: end_request: I/O error, dev hdc, sector 192181240
Nov 16 17:26:21 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439340
Nov 16 17:26:23 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:23 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181242
Nov 16 17:26:23 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:23 darkstar kernel: end_request: I/O error, dev hdc, sector 192181242
Nov 16 17:26:23 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439341
Nov 16 17:26:26 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:26 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181244
Nov 16 17:26:26 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:26 darkstar kernel: end_request: I/O error, dev hdc, sector 192181244
Nov 16 17:26:26 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439342
Nov 16 17:26:28 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:28 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181246
Nov 16 17:26:28 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:28 darkstar kernel: end_request: I/O error, dev hdc, sector 192181246
Nov 16 17:26:28 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439343
Nov 16 17:26:30 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:30 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181248
Nov 16 17:26:30 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:30 darkstar kernel: end_request: I/O error, dev hdc, sector 192181248
Nov 16 17:26:30 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439344
Nov 16 17:26:33 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:33 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181250
Nov 16 17:26:33 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:33 darkstar kernel: end_request: I/O error, dev hdc, sector 192181250
Nov 16 17:26:33 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439345
Nov 16 17:26:35 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:35 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181252
Nov 16 17:26:35 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:35 darkstar kernel: end_request: I/O error, dev hdc, sector 192181252
Nov 16 17:26:35 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439346
Nov 16 17:26:37 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:37 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181254
Nov 16 17:26:37 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:37 darkstar kernel: end_request: I/O error, dev hdc, sector 192181254
Nov 16 17:26:37 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439347
Nov 16 17:26:39 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:39 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181256
Nov 16 17:26:39 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:39 darkstar kernel: end_request: I/O error, dev hdc, sector 192181256
Nov 16 17:26:39 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439348
Nov 16 17:26:42 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:42 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181258
Nov 16 17:26:42 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:42 darkstar kernel: end_request: I/O error, dev hdc, sector 192181258
Nov 16 17:26:42 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439349
Nov 16 17:26:44 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:44 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181260
Nov 16 17:26:44 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:44 darkstar kernel: end_request: I/O error, dev hdc, sector 192181260
Nov 16 17:26:44 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439350
Nov 16 17:26:47 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:47 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181262
Nov 16 17:26:47 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:47 darkstar kernel: end_request: I/O error, dev hdc, sector 192181262
Nov 16 17:26:47 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439351
Nov 16 17:26:49 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:49 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181264
Nov 16 17:26:49 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:49 darkstar kernel: end_request: I/O error, dev hdc, sector 192181264
Nov 16 17:26:49 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439352
Nov 16 17:26:51 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:51 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181266
Nov 16 17:26:51 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:51 darkstar kernel: end_request: I/O error, dev hdc, sector 192181266
Nov 16 17:26:54 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:54 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181268
Nov 16 17:26:54 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:54 darkstar kernel: end_request: I/O error, dev hdc, sector 192181268
Nov 16 17:26:54 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:26:54 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439354
Nov 16 17:26:56 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:56 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181270
Nov 16 17:26:56 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:56 darkstar kernel: end_request: I/O error, dev hdc, sector 192181270
Nov 16 17:26:58 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:26:58 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181272
Nov 16 17:26:58 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:26:58 darkstar kernel: end_request: I/O error, dev hdc, sector 192181272
Nov 16 17:26:58 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:26:58 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439356
Nov 16 17:27:01 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:01 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181274
Nov 16 17:27:01 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:01 darkstar kernel: end_request: I/O error, dev hdc, sector 192181274
Nov 16 17:27:03 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:03 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181276
Nov 16 17:27:03 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:03 darkstar kernel: end_request: I/O error, dev hdc, sector 192181276
Nov 16 17:27:03 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:03 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439358
Nov 16 17:27:05 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:05 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181278
Nov 16 17:27:05 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:05 darkstar kernel: end_request: I/O error, dev hdc, sector 192181278
Nov 16 17:27:07 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:07 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181280
Nov 16 17:27:07 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:07 darkstar kernel: end_request: I/O error, dev hdc, sector 192181280
Nov 16 17:27:07 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:07 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439360
Nov 16 17:27:10 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:10 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181282
Nov 16 17:27:10 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:10 darkstar kernel: end_request: I/O error, dev hdc, sector 192181282
Nov 16 17:27:12 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:12 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181284
Nov 16 17:27:12 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:12 darkstar kernel: end_request: I/O error, dev hdc, sector 192181284
Nov 16 17:27:14 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:14 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181286
Nov 16 17:27:14 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:14 darkstar kernel: end_request: I/O error, dev hdc, sector 192181286
Nov 16 17:27:14 darkstar kernel: printk: 2 messages suppressed.
Nov 16 17:27:14 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439363
Nov 16 17:27:17 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:17 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181288
Nov 16 17:27:17 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:17 darkstar kernel: end_request: I/O error, dev hdc, sector 192181288
Nov 16 17:27:19 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:19 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181290
Nov 16 17:27:19 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:19 darkstar kernel: end_request: I/O error, dev hdc, sector 192181290
Nov 16 17:27:19 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:19 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439365
Nov 16 17:27:21 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:21 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181292
Nov 16 17:27:21 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:21 darkstar kernel: end_request: I/O error, dev hdc, sector 192181292
Nov 16 17:27:23 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:23 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181294
Nov 16 17:27:23 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:23 darkstar kernel: end_request: I/O error, dev hdc, sector 192181294
Nov 16 17:27:23 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:23 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439367
Nov 16 17:27:26 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:26 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181296
Nov 16 17:27:26 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:26 darkstar kernel: end_request: I/O error, dev hdc, sector 192181296
Nov 16 17:27:28 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:28 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181298
Nov 16 17:27:28 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:28 darkstar kernel: end_request: I/O error, dev hdc, sector 192181298
Nov 16 17:27:28 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:28 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439369
Nov 16 17:27:30 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:30 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181300
Nov 16 17:27:30 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:30 darkstar kernel: end_request: I/O error, dev hdc, sector 192181300
Nov 16 17:27:32 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:32 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181302
Nov 16 17:27:32 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:32 darkstar kernel: end_request: I/O error, dev hdc, sector 192181302
Nov 16 17:27:32 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:32 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439371
Nov 16 17:27:35 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:35 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181304
Nov 16 17:27:35 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:35 darkstar kernel: end_request: I/O error, dev hdc, sector 192181304
Nov 16 17:27:37 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:37 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181306
Nov 16 17:27:37 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:37 darkstar kernel: end_request: I/O error, dev hdc, sector 192181306
Nov 16 17:27:37 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:37 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439373
Nov 16 17:27:39 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:39 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181308
Nov 16 17:27:39 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:39 darkstar kernel: end_request: I/O error, dev hdc, sector 192181308
Nov 16 17:27:42 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:42 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181310
Nov 16 17:27:42 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:42 darkstar kernel: end_request: I/O error, dev hdc, sector 192181310
Nov 16 17:27:44 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:44 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181312
Nov 16 17:27:44 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:44 darkstar kernel: end_request: I/O error, dev hdc, sector 192181312
Nov 16 17:27:44 darkstar kernel: printk: 2 messages suppressed.
Nov 16 17:27:44 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439376
Nov 16 17:27:46 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:46 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181314
Nov 16 17:27:46 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:46 darkstar kernel: end_request: I/O error, dev hdc, sector 192181314
Nov 16 17:27:48 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:48 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181316
Nov 16 17:27:48 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:48 darkstar kernel: end_request: I/O error, dev hdc, sector 192181316
Nov 16 17:27:48 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:48 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439378
Nov 16 17:27:51 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:51 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181318
Nov 16 17:27:51 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:51 darkstar kernel: end_request: I/O error, dev hdc, sector 192181318
Nov 16 17:27:53 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:53 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181320
Nov 16 17:27:53 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:53 darkstar kernel: end_request: I/O error, dev hdc, sector 192181320
Nov 16 17:27:53 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:53 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439380
Nov 16 17:27:55 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:55 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181322
Nov 16 17:27:55 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:55 darkstar kernel: end_request: I/O error, dev hdc, sector 192181322
Nov 16 17:27:57 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:27:57 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181324
Nov 16 17:27:57 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:27:57 darkstar kernel: end_request: I/O error, dev hdc, sector 192181324
Nov 16 17:27:57 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:27:57 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439382
Nov 16 17:28:00 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:00 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181326
Nov 16 17:28:00 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:00 darkstar kernel: end_request: I/O error, dev hdc, sector 192181326
Nov 16 17:28:02 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:02 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181328
Nov 16 17:28:02 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:02 darkstar kernel: end_request: I/O error, dev hdc, sector 192181328
Nov 16 17:28:04 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:04 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181330
Nov 16 17:28:04 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:04 darkstar kernel: end_request: I/O error, dev hdc, sector 192181330
Nov 16 17:28:04 darkstar kernel: printk: 2 messages suppressed.
Nov 16 17:28:04 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439385
Nov 16 17:28:06 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:06 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181332
Nov 16 17:28:06 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:06 darkstar kernel: end_request: I/O error, dev hdc, sector 192181332
Nov 16 17:28:09 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:09 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181334
Nov 16 17:28:09 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:09 darkstar kernel: end_request: I/O error, dev hdc, sector 192181334
Nov 16 17:28:09 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:09 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439387
Nov 16 17:28:11 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:11 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181336
Nov 16 17:28:11 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:11 darkstar kernel: end_request: I/O error, dev hdc, sector 192181336
Nov 16 17:28:13 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:13 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181338
Nov 16 17:28:13 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:13 darkstar kernel: end_request: I/O error, dev hdc, sector 192181338
Nov 16 17:28:13 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:13 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439389
Nov 16 17:28:15 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:15 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181340
Nov 16 17:28:15 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:15 darkstar kernel: end_request: I/O error, dev hdc, sector 192181340
Nov 16 17:28:18 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:18 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181342
Nov 16 17:28:18 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:18 darkstar kernel: end_request: I/O error, dev hdc, sector 192181342
Nov 16 17:28:18 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:18 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439391
Nov 16 17:28:20 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:20 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181344
Nov 16 17:28:20 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:20 darkstar kernel: end_request: I/O error, dev hdc, sector 192181344
Nov 16 17:28:22 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:22 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181346
Nov 16 17:28:22 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:22 darkstar kernel: end_request: I/O error, dev hdc, sector 192181346
Nov 16 17:28:22 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:22 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439393
Nov 16 17:28:25 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:25 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181348
Nov 16 17:28:25 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:25 darkstar kernel: end_request: I/O error, dev hdc, sector 192181348
Nov 16 17:28:27 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:27 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181350
Nov 16 17:28:27 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:27 darkstar kernel: end_request: I/O error, dev hdc, sector 192181350
Nov 16 17:28:27 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:27 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439395
Nov 16 17:28:29 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:29 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181352
Nov 16 17:28:29 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:29 darkstar kernel: end_request: I/O error, dev hdc, sector 192181352
Nov 16 17:28:32 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:32 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181354
Nov 16 17:28:32 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:32 darkstar kernel: end_request: I/O error, dev hdc, sector 192181354
Nov 16 17:28:34 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:34 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181356
Nov 16 17:28:34 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:34 darkstar kernel: end_request: I/O error, dev hdc, sector 192181356
Nov 16 17:28:34 darkstar kernel: printk: 2 messages suppressed.
Nov 16 17:28:34 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439398
Nov 16 17:28:36 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:36 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181358
Nov 16 17:28:36 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:36 darkstar kernel: end_request: I/O error, dev hdc, sector 192181358
Nov 16 17:28:39 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:39 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181360
Nov 16 17:28:39 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:39 darkstar kernel: end_request: I/O error, dev hdc, sector 192181360
Nov 16 17:28:39 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:39 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439400
Nov 16 17:28:41 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:41 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181362
Nov 16 17:28:41 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:41 darkstar kernel: end_request: I/O error, dev hdc, sector 192181362
Nov 16 17:28:43 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:43 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181364
Nov 16 17:28:43 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:43 darkstar kernel: end_request: I/O error, dev hdc, sector 192181364
Nov 16 17:28:43 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:43 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439402
Nov 16 17:28:45 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:45 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181366
Nov 16 17:28:45 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:45 darkstar kernel: end_request: I/O error, dev hdc, sector 192181366
Nov 16 17:28:48 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:48 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181368
Nov 16 17:28:48 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:48 darkstar kernel: end_request: I/O error, dev hdc, sector 192181368
Nov 16 17:28:48 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:48 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439404
Nov 16 17:28:50 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:50 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181370
Nov 16 17:28:50 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:50 darkstar kernel: end_request: I/O error, dev hdc, sector 192181370
Nov 16 17:28:52 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:52 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181372
Nov 16 17:28:52 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:52 darkstar kernel: end_request: I/O error, dev hdc, sector 192181372
Nov 16 17:28:52 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:28:52 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439406
Nov 16 17:28:54 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:54 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181374
Nov 16 17:28:54 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:54 darkstar kernel: end_request: I/O error, dev hdc, sector 192181374
Nov 16 17:28:57 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:57 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181376
Nov 16 17:28:57 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:57 darkstar kernel: end_request: I/O error, dev hdc, sector 192181376
Nov 16 17:28:59 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:28:59 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181378
Nov 16 17:28:59 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:28:59 darkstar kernel: end_request: I/O error, dev hdc, sector 192181378
Nov 16 17:28:59 darkstar kernel: printk: 2 messages suppressed.
Nov 16 17:28:59 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439409
Nov 16 17:29:01 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:01 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181380
Nov 16 17:29:01 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:01 darkstar kernel: end_request: I/O error, dev hdc, sector 192181380
Nov 16 17:29:04 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:04 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181382
Nov 16 17:29:04 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:04 darkstar kernel: end_request: I/O error, dev hdc, sector 192181382
Nov 16 17:29:04 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:04 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439411
Nov 16 17:29:06 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:06 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181384
Nov 16 17:29:06 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:06 darkstar kernel: end_request: I/O error, dev hdc, sector 192181384
Nov 16 17:29:08 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:08 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181386
Nov 16 17:29:08 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:08 darkstar kernel: end_request: I/O error, dev hdc, sector 192181386
Nov 16 17:29:08 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:08 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439413
Nov 16 17:29:10 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:10 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181388
Nov 16 17:29:10 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:10 darkstar kernel: end_request: I/O error, dev hdc, sector 192181388
Nov 16 17:29:13 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:13 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181390
Nov 16 17:29:13 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:13 darkstar kernel: end_request: I/O error, dev hdc, sector 192181390
Nov 16 17:29:13 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:13 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439415
Nov 16 17:29:15 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:15 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181392
Nov 16 17:29:15 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:15 darkstar kernel: end_request: I/O error, dev hdc, sector 192181392
Nov 16 17:29:17 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:17 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181394
Nov 16 17:29:17 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:17 darkstar kernel: end_request: I/O error, dev hdc, sector 192181394
Nov 16 17:29:17 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:17 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439417
Nov 16 17:29:20 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:20 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181396
Nov 16 17:29:20 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:20 darkstar kernel: end_request: I/O error, dev hdc, sector 192181396
Nov 16 17:29:22 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:22 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181398
Nov 16 17:29:22 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:22 darkstar kernel: end_request: I/O error, dev hdc, sector 192181398
Nov 16 17:29:24 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:24 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181400
Nov 16 17:29:24 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:24 darkstar kernel: end_request: I/O error, dev hdc, sector 192181400
Nov 16 17:29:24 darkstar kernel: printk: 2 messages suppressed.
Nov 16 17:29:24 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439420
Nov 16 17:29:26 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:26 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181402
Nov 16 17:29:26 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:26 darkstar kernel: end_request: I/O error, dev hdc, sector 192181402
Nov 16 17:29:29 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:29 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181404
Nov 16 17:29:29 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:29 darkstar kernel: end_request: I/O error, dev hdc, sector 192181404
Nov 16 17:29:29 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:29 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439422
Nov 16 17:29:31 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:31 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181406
Nov 16 17:29:31 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:31 darkstar kernel: end_request: I/O error, dev hdc, sector 192181406
Nov 16 17:29:33 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:33 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181408
Nov 16 17:29:33 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:33 darkstar kernel: end_request: I/O error, dev hdc, sector 192181408
Nov 16 17:29:33 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:33 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439424
Nov 16 17:29:36 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:36 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181410
Nov 16 17:29:36 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:36 darkstar kernel: end_request: I/O error, dev hdc, sector 192181410
Nov 16 17:29:38 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:38 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181412
Nov 16 17:29:38 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:38 darkstar kernel: end_request: I/O error, dev hdc, sector 192181412
Nov 16 17:29:38 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:38 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439426
Nov 16 17:29:40 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:40 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181414
Nov 16 17:29:40 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:40 darkstar kernel: end_request: I/O error, dev hdc, sector 192181414
Nov 16 17:29:42 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:42 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181416
Nov 16 17:29:42 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:42 darkstar kernel: end_request: I/O error, dev hdc, sector 192181416
Nov 16 17:29:42 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:42 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439428
Nov 16 17:29:45 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:45 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181418
Nov 16 17:29:45 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:45 darkstar kernel: end_request: I/O error, dev hdc, sector 192181418
Nov 16 17:29:47 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:47 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181420
Nov 16 17:29:47 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:47 darkstar kernel: end_request: I/O error, dev hdc, sector 192181420
Nov 16 17:29:49 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:49 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181422
Nov 16 17:29:49 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:49 darkstar kernel: end_request: I/O error, dev hdc, sector 192181422
Nov 16 17:29:49 darkstar kernel: printk: 2 messages suppressed.
Nov 16 17:29:49 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439431
Nov 16 17:29:52 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:52 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181424
Nov 16 17:29:52 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:52 darkstar kernel: end_request: I/O error, dev hdc, sector 192181424
Nov 16 17:29:54 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:54 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181426
Nov 16 17:29:54 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:54 darkstar kernel: end_request: I/O error, dev hdc, sector 192181426
Nov 16 17:29:54 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:54 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439433
Nov 16 17:29:56 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:56 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181428
Nov 16 17:29:56 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:56 darkstar kernel: end_request: I/O error, dev hdc, sector 192181428
Nov 16 17:29:59 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:29:59 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181430
Nov 16 17:29:59 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:29:59 darkstar kernel: end_request: I/O error, dev hdc, sector 192181430
Nov 16 17:29:59 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:29:59 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439435
Nov 16 17:30:01 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:30:01 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181432
Nov 16 17:30:01 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:30:01 darkstar kernel: end_request: I/O error, dev hdc, sector 192181432
Nov 16 17:30:03 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:30:03 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181434
Nov 16 17:30:03 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:30:03 darkstar kernel: end_request: I/O error, dev hdc, sector 192181434
Nov 16 17:30:03 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:30:03 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439437
Nov 16 17:30:06 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:30:06 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181436
Nov 16 17:30:06 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:30:06 darkstar kernel: end_request: I/O error, dev hdc, sector 192181436
Nov 16 17:30:08 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:30:08 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181439, high=11, low=7632063, sector=192181438
Nov 16 17:30:08 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:30:08 darkstar kernel: end_request: I/O error, dev hdc, sector 192181438
Nov 16 17:30:08 darkstar kernel: printk: 1 messages suppressed.
Nov 16 17:30:08 darkstar kernel: Buffer I/O error on device hdc3, logical block 81439439
Nov 16 17:30:10 darkstar kernel: hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
Nov 16 17:30:10 darkstar kernel: hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=192181440, high=11, low=7632064, sector=192181440
Nov 16 17:30:10 darkstar kernel: ide: failed opcode was: unknown
Nov 16 17:30:10 darkstar kernel: end_request: I/O error, dev hdc, sector 192181440

--------------040403010703090501040900
Content-Type: text/plain;
 name="badblocks.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="badblocks.log"

81439424
81439428
81439429
81439430
81439431
81439432
81439433
81439434
81439435
81439436
81439437
81439438
81439439
81439440
81439441
81439442
81439443

--------------040403010703090501040900--
