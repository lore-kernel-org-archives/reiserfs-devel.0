From: Nick Burrett <nick@dsvr.net>
Subject: symlink has wrong sd_blocks count
Date: Tue, 18 Feb 2003 10:53:25 +0000
Message-ID: <3E5210A5.1030108@dsvr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I'm running a stock 2.4.20 kernel with the reiserfs quota patches applied.

Simply creating a symlink and then running reiserfsck shows errors like 
this:
    /foofile 2 4 has wrong sd_blocks 8, has to be 1

I've reproduced this 100% on 100 filesystems on two servers.


bash-2.05# lvcreate -L 100M -n test vol01
lvcreate -- doing automatic backup of "vol01"
lvcreate -- logical volume "/dev/vol01/test" successfully created

bash-2.05# mkreiserfs /dev/vol01/test

<-------------mkreiserfs, 2002------------->
reiserfsprogs 3.6.2

mkreiserfs: Guessing about desired format..
mkreiserfs: Kernel 2.4.20 is running.
Format 3.6 with standard journal
Count of blocks on the device: 25600
Number of blocks consumed by mkreiserfs formatting process: 8212
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: cae72cae-5469-4e60-9b7f-7ffd662c3967
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
	ALL DATA WILL BE LOST ON '/dev/vol01/test'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok
[...snipped...]


bash-2.05# reiserfsck --check /dev/vol01/test

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.2

Will read-only check consistency of the filesystem on /dev/vol01/test
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Tue Feb 18 10:47:22 2003
###########
Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
No corruptions found
There are on the filesystem:
	Leaves 1
	Internal nodes 0
	Directories 1
	Other files 0
	Data block pointers 0 (0 of them are zero)
	Safe links 0
###########
reiserfsck finished at Tue Feb 18 10:47:22 2003
###########

bash-2.05# mount /dev/vol01/test /mnt
bash-2.05# cd /mnt
bash-2.05# touch bar
bash-2.05# ln -s bar foo
bash-2.05# cd /
bash-2.05# umount /mnt
bash-2.05# reiserfsck --check /dev/vol01/test

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.2

Will read-only check consistency of the filesystem on /dev/vol01/test
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Tue Feb 18 10:48:04 2003
###########
Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
/foofile 2 4 has wrong sd_blocks 8, has to be 1
ok
There were found 1 corruptions which can be fixed with --fix-fixable
###########
reiserfsck finished at Tue Feb 18 10:48:04 2003
###########
bash-2.05#


-- 
Nick Burrett
Network Engineer, Designer Servers Ltd.   http://www.dsvr.co.uk

