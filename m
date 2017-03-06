From: <doiggl@velocitynet.com.au>
Subject: Would it be possible for someone to port source code of resize_reiserfs to handle reiser4 partitions ? [sdbX]
Date: Tue, 07 Mar 2017 00:30:46 +1100
Message-ID: <b42a51171d3f7a89e442fec23fb4d781@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello,
Would it be possible for someone to port source code of resize_reiserfs to
handle reiser4 partitions ? [sdbX]

reiserfsprogs-3.6.25.tar.xz


I can assist with reiser4 testing on a r4 volume , their are some files on
it [with some spare space on volume] to help verify  results/syntax.
I know there are meta metadata differences r3 vs r4


Cheers
--Glenn 



## reiserfsprogs resize_reiserfs content.

http://www.linuxfromscratch.org/blfs/view/svn/postlfs/reiserfs.html
https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v3.6.25/reiserfsprogs-3.6.25.tar.xz

# ll reiserfsprogs-3.6.25/resize_reiserfs/
total 64
-rw-r--r-- 1 root root   215 Sep 17  2013 Makefile.am
-rw-r--r-- 1 root root 22976 Jun  7  2016 Makefile.in
-rw-r--r-- 1 root root  7936 Sep 17  2013 do_shrink.c
-rw-r--r-- 1 root root   621 Aug 27  2013 fe.c
-rw-r--r-- 1 root root   909 Sep 17  2013 resize.h
-rw-r--r-- 1 root root  2988 Jun  7  2016 resize_reiserfs.8
-rw-r--r-- 1 root root  2999 Jun  7  2016 resize_reiserfs.8.in
-rw-r--r-- 1 root root  8584 Jun  7  2016 resize_reiserfs.c


resize_reiserfs output example runs against reiser v3 volume:

resize_reiserfs v3 outout 
#########################

#  resize_reiserfs
Usage: resize_reiserfs  [-s[+|-]#[G|M|K]] [-fqvV] device

# resize_reiserfs ?
resize_reiserfs 3.6.25

cannot open '?': No such file or directory


# resize_reiserfs --help
resize_reiserfs: invalid option -- '-'
Usage: resize_reiserfs  [-s[+|-]#[G|M|K]] [-fqvV] device

# resize_reiserfs /dev/sdb2
resize_reiserfs 3.6.25

- no r3 on /dev/sdb2

# resize_reiserfs /dev/sdb2
resize_reiserfs 3.6.25

cannot open '/dev/sdb2': No such file or directory

# resize_reiserfs /dev/sdb2
resize_reiserfs 3.6.25


reiserfs_open: the reiserfs superblock cannot be found on /dev/sdb2.

## reiser v3 on /dev/sdb1

# resize_reiserfs --help
resize_reiserfs: invalid option -- '-'
Usage: resize_reiserfs  [-s[+|-]#[G|M|K]] [-fqvV] device

# mount /dev/sdb1 /media/disk

# df -h
Filesystem      Size  Used Avail Use% Mounted on
       1.5T  253G  1.3T  17% /media/disk

# cd /tmp
# umount /dev/sdb1

# resize_reiserfs -s -1G /dev/sdb1
resize_reiserfs 3.6.25

You are running BETA version of reiserfs shrinker.
This version is only for testing or VERY CAREFUL use.
Backup of you data is recommended.

Do you want to continue? [y/N]:y
Processing the tree: 0%....20%....40%....60%....80%....100%               
     left 0, 226936 /sec

nodes processed (moved):
int        413 (0),
leaves     68189 (0),
unfm       66196804 (338),
total      66265406 (338).

check for used blocks in truncated region

ReiserFS report:
blocksize             4096
block count           402390784 (402652928)
free blocks           336104888 (336367024)
bitmap block count    12280 (12288)

Syncing..done

#

resize_reiserfs: Resizing finished successfully.

 # resize_reiserfs -s -1M -v  /dev/sdb1
resize_reiserfs 3.6.25

You are running BETA version of reiserfs shrinker.
This version is only for testing or VERY CAREFUL use.
Backup of you data is recommended.

Do you want to continue? [y/N]:y
processind the tree 0%..20%...40..   

#
# resize_reiserfs -s -1M -v  /dev/sdb1
resize_reiserfs 3.6.25

You are running BETA version of reiserfs shrinker.
This version is only for testing or VERY CAREFUL use.
Backup of you data is recommended.

Do you want to continue? [y/N]:y
Processing the tree: 0%....20%....40%....60%....80%....100%               
     left 0, 226161 /sec

nodes processed (moved):
int        413 (0),
leaves     68189 (0),
unfm       66196804 (0),
total      66265406 (0).

check for used blocks in truncated region

ReiserFS report:
blocksize             4096
block count           402390528 (402390784)
free blocks           336104632 (336104888)
bitmap block count    12280 (12280)

Syncing..done


resize_reiserfs: Resizing finished successfully.

#
# resize_reiserfs -s +100M -v  /dev/sdb1
resize_reiserfs 3.6.25

ReiserFS report:
blocksize             4096
block count           402416128 (402390528)
free blocks           336130231 (336104632)
bitmap block count    12281 (12280)

Syncing..done


resize_reiserfs: Resizing finished successfully.
#

# resize_reiserfs -s +1G /dev/sdb1
resize_reiserfs 3.6.25

/dev/sdb1 is of 402652928 blocks size only with reiserfs of 402544128
blocks
size on it. You are trying to expand reiserfs up to 402806272 blocks size.
You probably forgot to expand your partition size.

# resize_reiserfs -s 10 /dev/sdb1
resize_reiserfs 3.6.25

Can't shrink filesystem on-line.


# resize_reiserfs -s +100M /dev/sdb1
resize_reiserfs 3.6.25

ReiserFS report:
blocksize             4096
block count           402595328 (402569728)
free blocks           336309425 (336283826)
bitmap block count    12287 (12286)

Syncing..done


resize_reiserfs: Resizing finished successfully.

# resize_reiserfs -s +100M /dev/sdb1
resize_reiserfs 3.6.25

ReiserFS report:
blocksize             4096
block count           402620928 (402595328)
free blocks           336335024 (336309425)
bitmap block count    12288 (12287)

Syncing..done


resize_reiserfs: Resizing finished successfully.

# resize_reiserfs -s +20M /dev/sdb1
resize_reiserfs 3.6.25

ReiserFS report:
blocksize             4096
block count           402651648 (402646528)
free blocks           336365744 (336360624)
bitmap block count    12288 (12288)

Syncing..done


resize_reiserfs: Resizing finished successfully.

# resize_reiserfs -s +10M /dev/sdb1
resize_reiserfs 3.6.25

/dev/sdb1 is of 402652928 blocks size only with reiserfs of 402651648
blocks
size on it. You are trying to expand reiserfs up to 402654208 blocks size.
You probably forgot to expand your partition size.

 # resize_reiserfs -s +10M /dev/sdb1
resize_reiserfs 3.6.25

/dev/sdb1 is of 402652928 blocks size only with reiserfs of 402651648
blocks
size on it. You are trying to expand reiserfs up to 402654208 blocks size.
You probably forgot to expand your partition size.


# resize_reiserfs -s +5M /dev/sdb1
resize_reiserfs 3.6.25

ReiserFS report:
blocksize             4096
block count           402652928 (402651648)
free blocks           336367024 (336365744)
bitmap block count    12288 (12288)

Syncing..done


resize_reiserfs: Resizing finished successfully

# time mount /dev/sdb1 /media/disk

real    0m0.236s
user    0m0.004s
sys     0m0.008s


# df -h
Filesystem           Size  Used Avail Use% Mounted on
r3 vol> /dev/sdb1    1.5T  253G  1.3T  17% /media/disk
r4 vol> /dev/sdb2    311G  109G  203G  35% /media/disk2


# time umount /dev/sdb1

real    0m0.050s
user    0m0.004s
sys     0m0.008s


