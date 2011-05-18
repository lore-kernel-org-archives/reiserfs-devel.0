From: <doiggl@velocitynet.com.au>
Subject: /fs/reiser4/plugin/file_plugin_common.c:511     WARNING: Error for inode nnnnnn (-2)
Date: Wed, 18 May 2011 20:59:26 +1000
Message-ID: <53ab1e6440516797fee6a672793cb051@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Is there anything to fix these messages ?
Thanks Glenn

Disk info
# fdisk -l 
Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes
255 heads, 63 sectors/track, 243201 cylinders, total 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000


#dmesg
.
.
.
[ 5941.902580] USB Mass Storage support registered.
[ 5942.904823] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[ 5942.905370] sd 4:0:0:0: Attached scsi generic sg2 type 0
[ 5942.907046] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[ 5942.911375] sd 4:0:0:0: [sdb] Write Protect is off
[ 5942.911387] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[ 5942.913630] sd 4:0:0:0: [sdb] Incomplete mode parameter data
[ 5942.913635] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 5942.918380] sd 4:0:0:0: [sdb] Incomplete mode parameter data
[ 5942.918389] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 5942.979037]  sdb: unknown partition table
[ 5942.984916] sd 4:0:0:0: [sdb] Incomplete mode parameter data
[ 5942.984927] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 5942.984935] sd 4:0:0:0: [sdb] Attached SCSI disk
[ 6026.487787] Loading Reiser4. See www.namesys.com for a description of
Reiser4.
[ 6026.493708] reiser4: sdb: found disk format 4.0.0.
[ 6196.181144] reiser4[ls(4013)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 6196.181150] WARNING: Error for inode 950596 (-2)
[ 6216.888493] reiser4[ls(4024)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 6216.888498] WARNING: Error for inode 950596 (-2)
[ 6280.683671] reiser4[mv(4048)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 6280.683673] WARNING: Error for inode 950596 (-2)
[ 6289.737491] reiser4[ls(4055)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 6289.737497] WARNING: Error for inode 950596 (-2)
[ 6458.661013] reiser4[mv(4377)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 6458.661018] WARNING: Error for inode 950596 (-2)
[ 6463.353492] reiser4[ls(4379)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 6463.353498] WARNING: Error for inode 950596 (-2)
[ 6623.537529] reiser4[ls(4445)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 6623.537534] WARNING: Error for inode 950596 (-2)
[ 6969.753686] reiser4[ls(4601)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[ 6969.753692] WARNING: Error for inode 950596 (-2)


