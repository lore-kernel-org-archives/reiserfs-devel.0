From: Marcus Fleige <marcus@detux.de>
Subject: ReiserFS Recovery
Date: Sun, 04 Dec 2005 23:27:16 +0100
Message-ID: <43936D44.3090902@detux.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi list,

i got a problem i need to get solved really badly. Maybe you can help?
It is extremly important to me to get that data back.

For the situation:

I got a linux server here with a data disk and a backup disk, both
encrypted using loop-aes (mount options loop=/dev/loopX,
encryption=aes-256) with the data disk based on reiserfs, the backup
disk with the most important data on ext3. Everything was fine up to
last sunday, when after a reboot _both_ disks rendered unmountable.

A first diagnosis showed a defective partition table. Dumping the first
MBs of the Disk, it seemed like the beginning of my disk had been
overwritten, killing my partition table and my reiserfs headers with
superblocks etc. Before anything else, i made a total backup of the
encrypted disk to another machine.

Mounting the drive died with the following:

homer ~ # mount /exports
mount: 	wrong fs type, bad option, bad superblock on /dev/loop0
	missing codepage or other error
	In some cases useful info is found in syslog - try
        dmesg | tail  or so

dmesg says:

VFS: Can't find reiserfs filesystem on dev loop0

After that, i tried to fsck the partition:

	homer ~ # losetup -e aes-256 /dev/loop0 /dev/hdb5
	Password:
	homer ~ # reiserfsck /dev/loop0
	reiserfsck 3.6.19 (2003 www.namesys.com)
	
	Will read-only check consistency of the filesystem on /dev/loop0
	Will put log info to 'stdout'
	
	Do you want to run this program?[N/Yes] (note need to type Yes 	
	if you do):Yes

	reiserfs_open: the reiserfs superblock cannot be found on 		
	/dev/loop0. Failed to open the filesystem.

	If the partition table has not been changed, and the partition
	is valid  and  it really  contains  a reiserfs  partition,  then
	the superblock  is corrupted and you need to run this utility
	with --rebuild-sb.

Do'h!

	homer ~ # reiserfsck --rebuild-sb /dev/loop0
	reiserfsck 3.6.19 (2003 www.namesys.com)

	Will check superblock and rebuild it if needed
	Will put log info to 'stdout'

	Do you want to run this program?[N/Yes] (note need to type Yes
	if you do):Yes

	reiserfs_open: the reiserfs superblock cannot be found on
	/dev/loop0.

	what the version of ReiserFS do you use[1-4]
        	(1)   3.6.x
		(2) >=3.5.9 (introduced in the middle of 1999) (if you
		use linux 2.2, choose this one)
		(3) < 3.5.9 converted to new format (don't choose if
		unsure)
	        (4) < 3.5.9 (this is very old format, don't choose if
		unsure)
	        (X)   exit
	1

	Enter block size [4096]:
	
	
	No journal device was specified. (If journal is not available,
	re-run with --no-journal-available option specified).

	Is journal default? (y/n)[y]:

	Did you use resizer(y/n)[n]:

	rebuild-sb: no uuid found, a new uuid was generated 		
	(cd9f7433-6d06-4bc8-8816-22269692eb9c)

	rebuild-sb: You either have a corrupted journal or have just
	changed the start of the partition with some partition table
	editor. If you are sure that the start of the partition is ok,
	rebuild the journal header.
	Do you want to rebuild the journal header? (y/n)[n]:


So, what now?

I read this: http://marc.theaimsgroup.com/?l=reiserfs&m=104861318421306&w=2

and tried:

homer ~ # mkreiserfs /dev/loop0
homer ~ # reiserfsck --rebuild-tree --scan-whole-partition /dev/loop0

Again, without any result.

Lately, i joined #reiser4 on IRC, finding 'vs' (Vladimir Saveliev?)
willing to help (thanks again!). We ran the 'scan-reiserfs'-utility,
trying to find reiser leaf nodes on the loop device. The scan found 4
nodes, but to make sure not to miss anything, i decided to restore the
backup to the original data disk.

After restore, i ran decrypted the whole disk with
homer ~ # losetup -e aes-256 /dev/loop0 /dev/hdb

and tried to find any reiserfs related info with scan-reiserfs again.
Result:

homer ~ # ./scan-reiserfs /dev/loop0 1 151324236
main: 485
read failed
errno: Success

Has anyone an idea how to recover the data on that disk?

Thanks in advance,

Marcus
