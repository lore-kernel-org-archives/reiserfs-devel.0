From: Adam Megacz <adam@megacz.com>
Subject: fsck.reiserfs crashes trying to fix my fs
Date: Mon, 09 Aug 2004 11:15:51 -0700
Message-ID: <x1k6w8mb3c.fsf@nowhere.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com



Please help!  I'm running reiserfs (linux 2.6.7) on a RAID-5 md
device:

  megacz@goliath:~$fsck.reiserfs -V    
  reiserfsck 3.6.18 (2003 www.namesys.com)

  megacz@goliath:~$sudo fsck.reiserfs /dev/md0 --fix-fixable -a -y
  Reiserfs super block in block 16 on 0x900 of format 3.6 with standard journal
  Blocks (total/free): 199141376/199141376 by 4096 bytes
  Filesystem marked as cleanly umounted
  Replaying journal..
  Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
  Wrong amount of used blocks. Switching to the --fix-fixable mode.
  ###########
  reiserfsck --fix-fixable started at Mon Aug  9 10:07:47 2004
  ###########
  Checking internal tree..
  
  Bad root block 0. (--rebuild-tree did not complete)
  
  Aborted
  [fsck.reiserfs crashes]

I tried --rebuild-sb but it didn't help:

  megacz@goliath:/usr/src/reiserfsprogs-3.6.17$sudo /usr/local/sbin/reiserfsck --rebuild-sb /dev/md0
  reiserfsck 3.6.17 (2003 www.namesys.com)
  
  *************************************************************
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all reiserfsck **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************
  
  Will check superblock and rebuild it if needed
  Will put log info to 'stdout'
  
  Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
  rebuild-sb: wrong tree height occured (65535), zeroed
  Reiserfs super block in block 16 on 0x900 of format 3.6 with standard journal
  Count of blocks on the device: 199141376
  Number of bitmaps: 6078
  Blocksize: 4096
  Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 199141376
  Root block: 0
  Filesystem marked as cleanly umounted
  Tree height: 0
  Hash function used to sort names: "r5"
  Objectid map size 8, max 972
  Journal parameters:
          Device [0x0]
          Magic [0x5181158d]
          Size 8193 blocks (including 1 for journal header) (first block 18)
          Max transaction length 1024 blocks
          Max batch size 900 blocks
          Max commit age 30
  Blocks reserved by journal: 0
  Fs state field: 0x1:
           some corruptions exist.
  sb_version: 2
  inode generation number: 3956629
  UUID: <no libuuid installed>
  LABEL: 
  Set flags in SB:
          ATTRIBUTES CLEAN
  Is this ok ? (y/n)[n]: y
  The fs may still be unconsistent. Run reiserfsck --check.
  
Here's the dmesg output:

  RAID5 conf printout:
   --- rd:5 wd:5 fd:0
   disk 0, o:1, dev:hdc1
   disk 1, o:1, dev:hde1
   disk 2, o:1, dev:hdg1
   disk 3, o:1, dev:hdk1
   disk 4, o:1, dev:hda1
  md: ... autorun DONE.
  kjournald starting.  Commit interval 5 seconds
  EXT3-fs: mounted filesystem with ordered data mode.
  VFS: Mounted root (ext3 filesystem) readonly.
  Mounted devfs on /dev
  Freeing unused kernel memory: 320k freed
  EXT3 FS on hdi1, internal journal
  found reiserfs format "3.6" with standard journal
  Reiserfs journal params: device md0, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
  reiserfs: checking transaction log (md0) for (md0)
  is_tree_node: node level 0 does not match to the expected one 65534
  vs-5150: search_by_key: invalid format found in block 0. Fsck?
  vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [1 2 0x0 SD]
  Using r5 hash to sort names
  is_tree_node: node level 0 does not match to the expected one 65534
  vs-5150: search_by_key: invalid format found in block 0. Fsck?
  vs-2140: finish_unfinished: search_by_key returned -2
  eth0: Setting full-duplex based on MII #1 link partner capability of 45e1.
  found reiserfs format "3.6" with standard journal
  Reiserfs journal params: device md0, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
  reiserfs: checking transaction log (md0) for (md0)
  is_tree_node: node level 0 does not match to the expected one 65534
  vs-5150: search_by_key: invalid format found in block 0. Fsck?
  vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to find stat data of [1 2 0x0 SD]
  Using r5 hash to sort names
  is_tree_node: node level 0 does not match to the expected one 65534
  vs-5150: search_by_key: invalid format found in block 0. Fsck?
  vs-2140: finish_unfinished: search_by_key returned -2
  

  - a


