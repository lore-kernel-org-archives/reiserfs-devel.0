From: grossnik.mailinglists@hispeed.ch
Subject: reiserfsck (3.6.19) --rebuild-tree failed (the syslog)
Date: Fri, 8 Sep 2006 12:18:37 +0200
Message-ID: <200609081018.k88AIbPR026681@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Sender: Grossniklaus Mailinglists <grossnik.mailinglists@hispeed.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Dear all
Here's the syslog

Thx four any help!

Kind Regards
Bruno

-----
Sep 8 11:03:14 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:14 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941503
Sep 8 11:03:14 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:14 kim kernel: end_request: I/O error, dev hda, sector 114941503
Sep 8 11:03:15 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:15 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941511
Sep 8 11:03:15 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:15 kim kernel: end_request: I/O error, dev hda, sector 114941511
Sep 8 11:03:17 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:17 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941519
Sep 8 11:03:17 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:17 kim kernel: end_request: I/O error, dev hda, sector 114941519
Sep 8 11:03:18 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:18 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941527
Sep 8 11:03:18 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:18 kim kernel: end_request: I/O error, dev hda, sector 114941527
Sep 8 11:03:19 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:19 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941535
Sep 8 11:03:19 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:19 kim kernel: end_request: I/O error, dev hda, sector 114941535
Sep 8 11:03:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941543
Sep 8 11:03:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:21 kim kernel: end_request: I/O error, dev hda, sector 114941543
Sep 8 11:03:22 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:22 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941551
Sep 8 11:03:22 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:22 kim kernel: end_request: I/O error, dev hda, sector 114941551
Sep 8 11:03:24 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:24 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941559
Sep 8 11:03:24 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:24 kim kernel: end_request: I/O error, dev hda, sector 114941559
Sep 8 11:03:25 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:25 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941567
Sep 8 11:03:25 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:25 kim kernel: end_request: I/O error, dev hda, sector 114941567
Sep 8 11:03:27 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:27 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941575
Sep 8 11:03:27 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:27 kim kernel: end_request: I/O error, dev hda, sector 114941575
Sep 8 11:03:28 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:28 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941583
Sep 8 11:03:28 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:28 kim kernel: end_request: I/O error, dev hda, sector 114941583
Sep 8 11:03:30 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:30 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941591
Sep 8 11:03:30 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:30 kim kernel: end_request: I/O error, dev hda, sector 114941591
Sep 8 11:03:31 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:31 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941599
Sep 8 11:03:31 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:31 kim kernel: end_request: I/O error, dev hda, sector 114941599
Sep 8 11:03:33 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:33 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941607
Sep 8 11:03:33 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:33 kim kernel: end_request: I/O error, dev hda, sector 114941607
Sep 8 11:03:34 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:34 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941615
Sep 8 11:03:34 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:34 kim kernel: end_request: I/O error, dev hda, sector 114941615
Sep 8 11:03:35 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:35 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941623
Sep 8 11:03:35 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:35 kim kernel: end_request: I/O error, dev hda, sector 114941623
Sep 8 11:03:37 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:37 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941631
Sep 8 11:03:37 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:37 kim kernel: end_request: I/O error, dev hda, sector 114941631
Sep 8 11:03:38 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:38 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941639
Sep 8 11:03:38 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:38 kim kernel: end_request: I/O error, dev hda, sector 114941639
Sep 8 11:03:40 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:40 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941647
Sep 8 11:03:40 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:40 kim kernel: end_request: I/O error, dev hda, sector 114941647
Sep 8 11:03:41 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:41 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941655
Sep 8 11:03:41 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:41 kim kernel: end_request: I/O error, dev hda, sector 114941655
Sep 8 11:03:43 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:43 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941663
Sep 8 11:03:43 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:43 kim kernel: end_request: I/O error, dev hda, sector 114941663
Sep 8 11:03:44 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:44 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941671
Sep 8 11:03:44 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:44 kim kernel: end_request: I/O error, dev hda, sector 114941671
Sep 8 11:03:46 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:46 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941679
Sep 8 11:03:46 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:46 kim kernel: end_request: I/O error, dev hda, sector 114941679
Sep 8 11:03:47 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:47 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941687
Sep 8 11:03:47 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:47 kim kernel: end_request: I/O error, dev hda, sector 114941687
Sep 8 11:03:49 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:49 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941695
Sep 8 11:03:49 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:49 kim kernel: end_request: I/O error, dev hda, sector 114941695
Sep 8 11:03:50 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:50 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941703
Sep 8 11:03:50 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:50 kim kernel: end_request: I/O error, dev hda, sector 114941703
Sep 8 11:03:52 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:52 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941527
Sep 8 11:03:52 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:52 kim kernel: end_request: I/O error, dev hda, sector 114941527
Sep 8 11:03:52 kim kernel: Buffer I/O error on device hda3, logical block 4=
602179
Sep 8 11:03:53 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:53 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941535
Sep 8 11:03:53 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:53 kim kernel: end_request: I/O error, dev hda, sector 114941535
Sep 8 11:03:53 kim kernel: Buffer I/O error on device hda3, logical block 4=
602180
Sep 8 11:03:55 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:55 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941543
Sep 8 11:03:55 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:55 kim kernel: end_request: I/O error, dev hda, sector 114941543
Sep 8 11:03:55 kim kernel: Buffer I/O error on device hda3, logical block 4=
602181
Sep 8 11:03:56 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:56 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941551
Sep 8 11:03:56 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:56 kim kernel: end_request: I/O error, dev hda, sector 114941551
Sep 8 11:03:56 kim kernel: Buffer I/O error on device hda3, logical block 4=
602182
Sep 8 11:03:57 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:57 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941559
Sep 8 11:03:57 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:57 kim kernel: end_request: I/O error, dev hda, sector 114941559
Sep 8 11:03:57 kim kernel: Buffer I/O error on device hda3, logical block 4=
602183
Sep 8 11:03:59 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:03:59 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941567
Sep 8 11:03:59 kim kernel: ide: failed opcode was: unknown
Sep 8 11:03:59 kim kernel: end_request: I/O error, dev hda, sector 114941567
Sep 8 11:03:59 kim kernel: Buffer I/O error on device hda3, logical block 4=
602184
Sep 8 11:04:00 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:00 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941575
Sep 8 11:04:00 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:00 kim kernel: end_request: I/O error, dev hda, sector 114941575
Sep 8 11:04:00 kim kernel: Buffer I/O error on device hda3, logical block 4=
602185
Sep 8 11:04:02 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:02 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941583
Sep 8 11:04:02 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:02 kim kernel: end_request: I/O error, dev hda, sector 114941583
Sep 8 11:04:02 kim kernel: Buffer I/O error on device hda3, logical block 4=
602186
Sep 8 11:04:03 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:03 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941591
Sep 8 11:04:03 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:03 kim kernel: end_request: I/O error, dev hda, sector 114941591
Sep 8 11:04:03 kim kernel: Buffer I/O error on device hda3, logical block 4=
602187
Sep 8 11:04:05 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:05 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941599
Sep 8 11:04:05 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:05 kim kernel: end_request: I/O error, dev hda, sector 114941599
Sep 8 11:04:05 kim kernel: Buffer I/O error on device hda3, logical block 4=
602188
Sep 8 11:04:06 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:06 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941607
Sep 8 11:04:06 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:06 kim kernel: end_request: I/O error, dev hda, sector 114941607
Sep 8 11:04:06 kim kernel: Buffer I/O error on device hda3, logical block 4=
602189
Sep 8 11:04:08 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:08 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941615
Sep 8 11:04:08 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:08 kim kernel: end_request: I/O error, dev hda, sector 114941615
Sep 8 11:04:08 kim kernel: Buffer I/O error on device hda3, logical block 4=
602190
Sep 8 11:04:09 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:09 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941623
Sep 8 11:04:09 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:09 kim kernel: end_request: I/O error, dev hda, sector 114941623
Sep 8 11:04:09 kim kernel: Buffer I/O error on device hda3, logical block 4=
602191
Sep 8 11:04:11 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:11 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941631
Sep 8 11:04:11 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:11 kim kernel: end_request: I/O error, dev hda, sector 114941631
Sep 8 11:04:12 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:12 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941639
Sep 8 11:04:12 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:12 kim kernel: end_request: I/O error, dev hda, sector 114941639
Sep 8 11:04:12 kim kernel: printk: 1 messages suppressed.
Sep 8 11:04:12 kim kernel: Buffer I/O error on device hda3, logical block 4=
602193
Sep 8 11:04:14 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:14 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941647
Sep 8 11:04:14 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:14 kim kernel: end_request: I/O error, dev hda, sector 114941647
Sep 8 11:04:15 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:15 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941655
Sep 8 11:04:15 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:15 kim kernel: end_request: I/O error, dev hda, sector 114941655
Sep 8 11:04:16 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:16 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941663
Sep 8 11:04:16 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:16 kim kernel: end_request: I/O error, dev hda, sector 114941663
Sep 8 11:04:18 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:18 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941671
Sep 8 11:04:18 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:18 kim kernel: end_request: I/O error, dev hda, sector 114941671
Sep 8 11:04:18 kim kernel: printk: 3 messages suppressed.
Sep 8 11:04:18 kim kernel: Buffer I/O error on device hda3, logical block 4=
602197
Sep 8 11:04:19 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:19 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941679
Sep 8 11:04:19 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:19 kim kernel: end_request: I/O error, dev hda, sector 114941679
Sep 8 11:04:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941687
Sep 8 11:04:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:21 kim kernel: end_request: I/O error, dev hda, sector 114941687
Sep 8 11:04:22 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:22 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941695
Sep 8 11:04:22 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:22 kim kernel: end_request: I/O error, dev hda, sector 114941695
Sep 8 11:04:22 kim kernel: printk: 2 messages suppressed.
Sep 8 11:04:22 kim kernel: Buffer I/O error on device hda3, logical block 4=
602200
Sep 8 11:04:24 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:24 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941703
Sep 8 11:04:24 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:24 kim kernel: end_request: I/O error, dev hda, sector 114941703
Sep 8 11:04:26 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:04:26 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941703
Sep 8 11:04:26 kim kernel: ide: failed opcode was: unknown
Sep 8 11:04:26 kim kernel: end_request: I/O error, dev hda, sector 114941703
Sep 8 11:09:01 kim /USR/SBIN/CRON[8227]: (root) CMD ( [ -d /var/lib/php4 ] =
&& find /var/lib/php4/ -type f -cmin +$(/usr/lib/php4/maxlifetime) -print0 =
| xargs -r -0 rm)
Sep 8 11:15:03 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941607
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941607
Sep 8 11:15:21 kim kernel: printk: 2 messages suppressed.
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602189
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941615
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941615
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602190
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941623
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941623
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602191
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941631
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941631
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602192
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941639
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941639
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602193
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941647
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941647
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602194
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941655
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941655
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602195
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941663
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941663
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602196
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941671
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941671
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602197
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941679
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941679
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602198
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941687
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941687
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602199
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941695
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941695
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602200
Sep 8 11:15:21 kim kernel: hda: dma_intr: status=3D0x59 { DriveReady SeekCo=
mplete DataRequest Error }
Sep 8 11:15:21 kim kernel: hda: dma_intr: error=3D0x40 { UncorrectableError=
 }, LBAsect=3D114941706, high=3D6, low=3D14278410, sector=3D114941703
Sep 8 11:15:21 kim kernel: ide: failed opcode was: unknown
Sep 8 11:15:21 kim kernel: end_request: I/O error, dev hda, sector 114941703
Sep 8 11:15:21 kim kernel: Buffer I/O error on device hda3, logical block 4=
602201
Sep 8 11:16:48 kim kernel: ReiserFS: hda3: found reiserfs format "3.6" with=
 standard journal
Sep 8 11:16:49 kim kernel: ReiserFS: hda3: using ordered data mode
Sep 8 11:16:49 kim kernel: ReiserFS: hda3: journal params: device hda3, siz=
e 8192, journal first block 18, max trans len 1024, max batch 900, max comm=
it age 30, max trans age 30
Sep 8 11:16:49 kim kernel: ReiserFS: hda3: checking transaction log (hda3)
Sep 8 11:16:49 kim kernel: ReiserFS: warning: is_tree_node: node level 0 do=
es not match to the expected one 65534
Sep 8 11:16:49 kim kernel: ReiserFS: hda3: warning: vs-5150: search_by_key:=
 invalid format found in block 0. Fsck?
Sep 8 11:16:49 kim kernel: ReiserFS: hda3: warning: vs-13070: reiserfs_read=
_locked_inode: i/o failure occurred trying to find stat data of [1 2 0x0 SD]
Sep 8 11:16:49 kim kernel: ReiserFS: hda3: Using r5 hash to sort names
Sep 8 11:16:49 kim kernel: ReiserFS: warning: is_tree_node: node level 0 do=
es not match to the expected one 65534
Sep 8 11:16:49 kim kernel: ReiserFS: hda3: warning: vs-5150: search_by_key:=
 invalid format found in block 0. Fsck?
Sep 8 11:16:49 kim kernel: ReiserFS: hda3: warning: vs-2140: finish_unfinis=
hed: search_by_key returned -2

