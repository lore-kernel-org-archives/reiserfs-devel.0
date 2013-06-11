From: tomnm <tomm@lime-technology.com>
Subject: (reiserfs 3.6) sync command causes continuous writes
Date: Tue, 11 Jun 2013 08:57:16 +0000 (UTC)
Message-ID: <loom.20130611T104322-574@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

After typing the 'sync' command all reiserfs 3.6 mounted volumes will be
continuously written.  For example, suppose 'sdb1' contains a reiserfs
partition.

mount /dev/sdb1 /mnt/data

Now type:
cat /sys/block/sdb/stat
and note the number of I/O's to the partition.
wait a couple seconds, look at I/O statistics and see they don't change.

Now type:
sync

Subsequently typing 'cat /sys/block/sdb/stat' every few seconds shows
increasing I/O.

This can be confirmed by trying to spin the drive down:
hdparm -y /dev/sdb

The device spins down but then immediately spins back up due to above I/O
taking place.

If you umount the drive and mount again, the continuous I/O stops, only to
resume again as soon as you type 'sync'.

This behavior started with 3.5 kernel.  All 3.4.x kernels are ok.  All 3.5.x
and newer kernels exhibit this behavior.

This does not seem to occur with ext3 or FAT.

