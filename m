From: Christian <evilninja@gmx.net>
Subject: vs-4080 & more corruptions
Date: Wed, 26 Jun 2002 01:33:28 +0200
Message-ID: <3D18FDC8.5040705@gmx.net>
Reply-To: evilninja@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

hello,

a few days ago i got a some vs-4080 errors message on my stderr:

vs-4080: reiserfs_free_block: free_block (0341:736255)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (0341:745214)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (0341:720895)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (0341:712573)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (0341:786297)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (0341:737149)[dev:blocknr]: bit 
already cleared

i searched the web/reiserfs list for this error and came to the 
cunclusion, that i had to reiserfsck the partition.

(it is a 4,2 GB partition, full-sized for this harddisk. i moved some 
data to/from this partition to another (?) when i got these errors.)

first i did a reiserfsck --check /dev/hdb1, i checked and gave me a log 
file with entries like this:

bad_indirect_item: block 8308: item 3 79 0x5654001 IND (1), len 4048, 
location 48 entry count 0, fsck need 0, format new has a pointer 903 to 
the block 196095 which is in tree already

there are about 20lines like this in the logfile, i cn give you more if 
you want.

but the check finished with tellng me "not all errors could be fixed, 
please run '--rebuild-tree'"

so i did the --rebuild-tree. it replayed some more transactions and then 
continued with "Pass 0":

------
Pass 0:
Loading on-disk bitmap .. ok, 924386 blocks marked used
Skipping 8242 blocks (super block, journal, bitmaps) 916144 blocks will 
be read
0%....20%....40%....60%....80%....100%                        left 0, 
1696 /sec
	"r5" hash is selected
Flushing..done
	Read blocks (but not data blocks) 916144
		Leaves among those 1109
		Objectids found 1618

Pass 1 (will try to insert 1109 leaves):
Looking for allocable blocks .. ok
0%                                                            left 1079, 
0 /sec
mark_block_used: (130815) used already


Aborted.
-------

--> Aborted !? so for now i can't mount the partition:

root@sheep:~/trash# mount -v /dev/hdb1 /mnt/disk/
mount: you didn't specify a filesystem type for /dev/hdb1
        I will try type reiserfs
mount: Not a directory

huh?

i have the logs of all my fsck runs available, i could send it to the 
list if you want to.

i am using a debian/woody system (i386), reiserfsprogs 3.x.1b from the 
woody distribution. --> should i try with other/newer progs?

please help me out of this problem, the data was not so important, but: 
i've had more hdd related / fs-related problems during the last year, 
and always after reiserfsck issues. i really want to hold reiserfs the 
faith, because i think it is a good thing to have a performant fs with 
journal too, but i can't stand the problems anymore.

thanks,
Christian.

