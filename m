From: Molchanov Alexander <a.molchanov@transtelecom-nn.ru>
Subject: reiserfsck --rebuild-tree Aborted
Date: Thu, 30 Sep 2004 09:24:42 +0400
Message-ID: <20040930092442.40ee8189@xor.ttknn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21962-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: noc@ttknn.net

Hello.

I have a big trouble.


Yesterday diskspace on a server of my company the place was terminated. After reboot and reiserfsck --fix-fixable has corrected not all mistakes. After that the server has worked a little more (I have removed some files for clearing a place) and I have noticed, that it is impossible to get access to some files and even to remove. After reloading with LiveCD and attempts --rebuild-tree it has turned out log:

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# reiserfsck --rebuild-tree /dev/sda2
reiserfsck 3.6.17 (2003 www.namesys.com)

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

Will rebuild the filesystem (/dev/sda2) tree
Will put log info to 'rebuild.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/sda2' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Wed Sep 29 20:47:21 2004
###########

Pass 0:
Loading on-disk bitmap .. ok, 2199141 blocks marked used
Skipping 8287 blocks (super block, journal, bitmaps) 2190854 blocks will be read
0%....20%....40%....60%....80%....100%                        left 0, 5477 /sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 2190854
                Leaves among those 846943
                Objectids found 475091

Pass 1 (will try to insert 846943 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                        left 0, 2785 /sec
Flushing..finished
        846943 leaves read
                33146 inserted
                813797 not inserted

Pass 2:
0%....20%....40%..                                       left 818621, 4280 /sec
Not enough allocable blocks, checking bitmap...there are 0 allocable blocks, btw
      
out of disk space
Aborted





# debugreiserfs -J /dev/sda2
debugreiserfs 3.6.17 (2003 www.namesys.com)


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x802 of format 3.6 with standard journal
Count of blocks on the device: 2502304
Number of bitmaps: 77
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 2502304
Root block: 0
Filesystem marked as cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
        Device [0x0]
        Magic [0x440b59d2]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa02:
        FATAL corruptions exist.
sb_version: 2
inode generation number: 11945888
UUID: 9f650000-0000-0000-0000-000000000000
LABEL: /
Set flags in SB:
Journal header (block #8210 of /dev/sda2):
        j_last_flush_trans_id 2908803
        j_first_unflushed_offset 6526
        j_mount_id 14
        Device [0x0]
        Magic [0x440b59d2]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

I have undertaken some attempts and received the same result. On a hard disk of badblocks is not present (I has checked up the utility dd and dd_rescue - on other partition the image of a disk was copied). Here has laid out result of work "debugreiserfs -p /dev/sda2 > sda2.1.dump; bzip2 -9 sda2.1.dump":
http://public.nnov.net/tmp/ibm2/sda2.1.dump.bz2

Kernel is	2.4.25-gentoo-r2 on Hard drive
and		2.4.26-gentoo-r6 on LiveCD

	on Hard drive
# reiserfsck -V
reiserfsck 3.6.17 (2003 www.namesys.com)

	on LiveCD
# reiserfsck -V
reiserfsck 3.6.17 (2003 www.namesys.com)

/dev/sda - is SCSI hardware Raid5 massive

Can you help me rebuild partition ? :(
If it is required it is possible to remove (for clearing a diskspace):
/var/lib/oops/ - here there is a file in 512Mb
	and directories:
/bin
/lib
/sbin
/opt
/usr, excluding "/usr/local" !


-- 
Molchanov Alexander
TransTeleCom-NN company
Network Operation Center: noc@ttknn.net
phone.: +7 8312 728827 (1424)
        +7 8312 482733 (1424)
a.molchanov@transtelecom-nn.ru
PGP Fingerprint = 50C7 8479 59E4 8228 F27C 5E8C EDF5 FECC 6CA2 B1E2

