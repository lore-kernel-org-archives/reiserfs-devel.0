From: Christian Placzek <kris@cp-data.de>
Subject: Re: reiserfs3 rebuild-tree successful but no files
Date: Thu, 10 Feb 2005 16:02:59 +0100
Message-ID: <200502101603.00268.kris@cp-data.de>
References: <200502082321.07706.kris@cp-data.de> <200502100754.56823.kris@cp-data.de> <420B6B35.2000607@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <420B6B35.2000607@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "E.Gryaznova" <grev@namesys.com>
Cc: reiserfs-list@namesys.com

On Thursday 10 February 2005 15:09, you wrote:
> Hello.
>
> Christian Placzek wrote:
> >On Wednesday 09 February 2005 13:01, Vladimir Saveliev wrote:
> >>Hello
> >>
> >>On Wed, 2005-02-09 at 12:04, Christian Placzek wrote:
> >>>On Wednesday 09 February 2005 09:47, you wrote:
> >>>>Hello
> >>>>
> >>>>On Wed, 2005-02-09 at 01:21, Christian Placzek wrote:
> >>>>>Hello,
> >>>>>
> >>>>>a friend of mine shredded his data (70GB) when he tried to undelete
> >>>>>an accidentally deleted file. He normally works with windoze.
> >>>>>Therefore he didn't know he couldn't undelete a file on a reiserfs
> >>>>>partition with ext2 undelete tool %-(
> >>>>>When he called me it was already too late. He had overwritten the
> >>>>>superblock :-(
> >>>>>
> >>>>>I'm still trying to rescue the data. I can see them in the image
> >>>>>using grep or hexedit. But nothing I tried has been successful. My
> >>>>>first steps were unmounting the partition, taking an image and
> >>>>>working with a copy of this image using a loop back device.
> >>>>>
> >>>>>All files have been retrieved but were removed by reiserfsck --check
> >>>>>although the last output says that directories and files have been
> >>>>>linked (see below). I tried with many combinations nearly all
> >>>>>parameters of reiserfsck: --fix-fixable --no-journal-available -S ...
> >>>>
> >>>>have you tried
> >>>>reiserfsck --rebuild-tree -S
> >>>>?
> >>>>If not, run it on newly created copy of shredded device.
> >>>
> >>>Yes, I did. The output of reiserfsck --rebuild-tree gave other numbers
> >>> of linked directories/files. But I can't see them.
> >>>
> >>>>Did you look at lost+found?
> >>>
> >>>Shure, see below.
> >>
> >>can you do
> >>debugreiserfs -p -S /dev/shredded | bzip2 -c > meta.bz2
> >
> >Okay, I've done two versions, one with and one without '-S'. I applied the
> >following commands to the image copy (the image itself is untouched, I
> > always worked with fresh copies):
> >
> ># reiserfsck -y /dev/loop/0 --rebuild-sb
> ># reiserfsck -y /dev/loop/0 --check
> ># reiserfsck -y /dev/loop/0 --rebuild-tree
>
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Sorry, do I understand correctly that you tried to mount  /dev/loop/0
> with  -t reiserfs option  after __this__ reiserfsck --rebuild-tree? Not
> after the following ones?
Let me explain my mode of operation: I make a copy of the original image taken 
of the harddrive. Then I use 'losetup' or 'mount -o loop' in order to mount 
the image as device. Next I perform different operations using 'reiserfsck'. 
Above you see _one_ possiblity. Then I mount the image as filesystem using 
'mount -o ro /dev/loop/0 /mnt/temp1/', and, as I described below, I get no 
directories or files. Mounting with '-t reiserfs' always result in following 
output:

mount: wrong fs type, bad option, bad superblock on /dev/loop/0,
       or too many mounted file systems


> What kernel do you use?
2.6.10-gentoo-r6


>
> Thanks,
> Lena.
>
> ># debugreiserfs -p /dev/loop/0 | bzip2 -c > meta.bz2
> ># reiserfsck -y /dev/loop/0 --rebuild-tree -S
> ># debugreiserfs -p /dev/loop/0 | bzip2 -c > meta-S.bz2
> >
> >Use ftp://80.133.138.104:12121 user: marc pw: tukli
> >
> >Lena gave me another hint:
> >>>Sorry, but what does df  -T say?
> >>>Does it say that  reiserfs filesystem is mounted on /mnt/temp1?
> >>>
> >>>Thanks,
> >>>Lena.
> >>
> >>No, it replied:
> >># /dev/loop/0   ext2    69529276        20  65997368   1% /mnt/temp1
> >>
> >>If I force mount with -t reiserfs it says:
> >>root@marvin:/home/kris 0$ # mount -o ro -t reiserfs /dev/loop/0
> >> /mnt/temp1/ mount: wrong fs type, bad option, bad superblock on
> >> /dev/loop/0, or too many mounted file systems
> >>
> >>
> >>
> >>Thanks, this is a good hint, but I don't know how to change the
> >> identifier
> >
> >of
> >
> >>the filesystem. I know that normally mkfs.* does this task, but my
> >> friend's overwriting of the superblock probably has changed the
> >> identifier of the filesystem. Is it possible to apply mkreiserfs on the
> >> image whithout running the risk to lose any data?
> >
> >Thanks
> >  Kris
> >
> >>and let us to download meta.bz2 so that we can take a look why
> >>lost+found gets emptied.
> >>
> >>>>>I mounted the image after each operation, but all I can see is:
> >>>>>
> >>>>>root@marvin:/home/kris 0$ # mount -o ro /dev/loop/0 /mnt/temp1/
> >>>>>root@marvin:/home/kris 0$ # ls -la /mnt/temp1/
> >>>>>total 21
> >>>>>drwxr-xr-x   3 root root  4096 Jan 20 11:36 .
> >>>>>drwxr-xr-x  39 root root   968 Feb  6 14:12 ..
> >>>>>drwx------   2 root root 16384 Jan 20 11:36 lost+found
> >>>>>root@marvin:/home/kris 0$ # ls -la /mnt/temp1/lost+found/
> >>>>>total 20
> >>>>>drwx------  2 root root 16384 Jan 20 11:36 .
> >>>>>drwxr-xr-x  3 root root  4096 Jan 20 11:36 ..
> >>>>>root@marvin:/home/kris 0$ #
> >>>>>
> >>>>>
> >>>>>Do you have any suggestions how to rescue the data?
> >>>>>
> >>>>>Regards
> >>>>>  Kris
> >>>>>
> >>>>>
> >>>>>
> >>>>>Here you see a typical output:
> >>>>>
> >>>>>root@marvin:/home/kris 0$ # losetup /dev/loop/0 /mnt/temp/data.x.dd
> >>>>>root@marvin:/home/kris 0$ # reiserfsck /dev/loop/0 --rebuild-tree
> >>>>>reiserfsck 3.6.19 (2003 www.namesys.com)
> >>>>>
> >>>>><snip>
> >>>>>
> >>>>>Will rebuild the filesystem (/dev/loop/0) tree
> >>>>>Will put log info to 'stdout'
> >>>>>
> >>>>>Do you want to run this program?[N/Yes] (note need to type Yes if you
> >>>>>do):Yes
> >>>>>
> >>>>>reiserfs_open: the reiserfs superblock cannot be found on
> >>>>>/dev/loop/0. Failed to open the filesystem.
> >>>>>
> >>>>>If the partition table has not been changed, and the partition is
> >>>>>valid  and  it really  contains  a reiserfs  partition,  then the
> >>>>>superblock  is corrupted and you need to run this utility with
> >>>>>--rebuild-sb.
> >>>>>
> >>>>>root@marvin:/home/kris 8$ # reiserfsck /dev/loop/0 --rebuild-sb
> >>>>>reiserfsck 3.6.19 (2003 www.namesys.com)
> >>>>>
> >>>>><snip>
> >>>>>
> >>>>>Will check superblock and rebuild it if needed
> >>>>>Will put log info to 'stdout'
> >>>>>
> >>>>>reiserfs_open: the reiserfs superblock cannot be found on
> >>>>>/dev/loop/0.
> >>>>>
> >>>>>what the version of ReiserFS do you use[1-4]
> >>>>>        (1)   3.6.x
> >>>>>        (2) >=3.5.9 (introduced in the middle of 1999) (if you use
> >>>>>linux 2.2, choose this one)
> >>>>>        (3) < 3.5.9 converted to new format (don't choose if unsure)
> >>>>>        (4) < 3.5.9 (this is very old format, don't choose if unsure)
> >>>>>        (X)   exit
> >>>>>1
> >>>>>
> >>>>>Enter block size [4096]:
> >>>>>
> >>>>>
> >>>>>No journal device was specified. (If journal is not available, re-run
> >>>>>with --no-journal-available option specified).
> >>>>>Is journal default? (y/n)[y]:
> >>>>>
> >>>>>Did you use resizer(y/n)[n]:
> >>>>>rebuild-sb: no uuid found, a new uuid was generated
> >>>>>(7e253707-4fef-42aa-9785-b1cd079851af)
> >>>>>
> >>>>>rebuild-sb: You either have a corrupted journal or have just changed
> >>>>>the start of the partition with some partition table editor. If you
> >>>>>are sure that the start of the partition is ok, rebuild the journal
> >>>>>header. Do you want to rebuild the journal header? (y/n)[n]: y
> >>>>>Reiserfs super block in block 16 on 0x700 of format 3.6 with standard
> >>>>>journal Count of blocks on the device: 17659440
> >>>>>Number of bitmaps: 539
> >>>>>Blocksize: 4096
> >>>>>Free blocks (count of blocks - used [journal, bitmaps, data,
> >>>>>reserved] blocks): 0
> >>>>>Root block: 0
> >>>>>Filesystem is NOT clean
> >>>>>Tree height: 0
> >>>>>Hash function used to sort names: not set
> >>>>>Objectid map size 0, max 972
> >>>>>Journal parameters:
> >>>>>        Device [0x0]
> >>>>>        Magic [0x0]
> >>>>>        Size 8193 blocks (including 1 for journal header) (first
> >>>>>block 18) Max transaction length 1024 blocks
> >>>>>        Max batch size 900 blocks
> >>>>>        Max commit age 30
> >>>>>Blocks reserved by journal: 0
> >>>>>Fs state field: 0x1:
> >>>>>         some corruptions exist.
> >>>>>sb_version: 2
> >>>>>inode generation number: 0
> >>>>>UUID: 7e253707-4fef-42aa-9785-b1cd079851af
> >>>>>LABEL:
> >>>>>Set flags in SB:
> >>>>>Is this ok ? (y/n)[n]: y
> >>>>>The fs may still be unconsistent. Run reiserfsck --check.
> >>>>>
> >>>>>root@marvin:/home/kris 1$ # reiserfsck /dev/loop/0 --check
> >>>>>reiserfsck 3.6.19 (2003 www.namesys.com)
> >>>>>
> >>>>><snip>
> >>>>>
> >>>>>Will read-only check consistency of the filesystem on /dev/loop/0
> >>>>>Will put log info to 'stdout'
> >>>>>###########
> >>>>>reiserfsck --check started at Tue Feb  8 17:17:31 2005
> >>>>>###########
> >>>>>Replaying journal..
> >>>>>Reiserfs journal '/dev/loop/0' in blocks [18..8211]: 0 transactions
> >>>>>replayed Zero bit found in on-disk bitmap after the last valid bit.
> >>>>>Checking internal tree..
> >>>>>
> >>>>>Bad root block 0. (--rebuild-tree did not complete)
> >>>>>
> >>>>>Aborted
> >>>>>root@marvin:/home/kris 134$ # reiserfsck /dev/loop/0 -y
> >>>>>--rebuild-tree reiserfsck 3.6.19 (2003 www.namesys.com)
> >>>>>
> >>>>><snip>
> >>>>>
> >>>>>Will rebuild the filesystem (/dev/loop/0) tree
> >>>>>Will put log info to 'stdout'
> >>>>>
> >>>>>Do you want to run this program?[N/Yes] (note need to type Yes if you
> >>>>>do):Yes Replaying journal..
> >>>>>Reiserfs journal '/dev/loop/0' in blocks [18..8211]: 0 transactions
> >>>>>replayed Zero bit found in on-disk bitmap after the last valid bit.
> >>>>>Fixed. ###########
> >>>>>reiserfsck --rebuild-tree started at Tue Feb  8 17:37:56 2005
> >>>>>###########
> >>>>>
> >>>>>Pass 0:
> >>>>>####### Pass 0 #######
> >>>>>Loading on-disk bitmap .. ok, 559628 blocks marked used
> >>>>>init_source_bitmap: Bitmap 0 (of 32768 bits) is wrong - mark all
> >>>>>blocks [0 - 32768] as used
> >>>>>init_source_bitmap: Bitmap 1 (of 32768 bits) is wrong - mark all
> >>>>>blocks [32768 - 65536] as used
> >>>>>init_source_bitmap: Bitmap 3 (of 32768 bits) is wrong - mark all
> >>>>>blocks [98304 - 131072] as used
> >>>>>init_source_bitmap: Bitmap 5 (of 32768 bits) is wrong - mark all
> >>>>>blocks [163840 - 196608] as used
> >>>>>init_source_bitmap: Bitmap 7 (of 32768 bits) is wrong - mark all
> >>>>>blocks [229376 - 262144] as used
> >>>>>init_source_bitmap: Bitmap 9 (of 32768 bits) is wrong - mark all
> >>>>>blocks [294912 - 327680] as used
> >>>>>init_source_bitmap: Bitmap 25 (of 32768 bits) is wrong - mark all
> >>>>>blocks [819200 - 851968] as used
> >>>>>init_source_bitmap: Bitmap 27 (of 32768 bits) is wrong - mark all
> >>>>>blocks [884736 - 917504] as used
> >>>>>init_source_bitmap: Bitmap 49 (of 32768 bits) is wrong - mark all
> >>>>>blocks [1605632 - 1638400] as used
> >>>>>init_source_bitmap: Bitmap 81 (of 32768 bits) is wrong - mark all
> >>>>>blocks [2654208 - 2686976] as used
> >>>>>init_source_bitmap: Bitmap 125 (of 32768 bits) is wrong - mark all
> >>>>>blocks [4096000 - 4128768] as used
> >>>>>init_source_bitmap: Bitmap 243 (of 32768 bits) is wrong - mark all
> >>>>>blocks [7962624 - 7995392] as used
> >>>>>init_source_bitmap: Bitmap 343 (of 32768 bits) is wrong - mark all
> >>>>>blocks [11239424 - 11272192] as used
> >>>>>Skipping 8749 blocks (super block, journal, bitmaps) 687599 blocks
> >>>>>will be read
> >>>>>0%....20%....40%....60%....80%....100%                        left 0,
> >>>>>9549 /sec
> >>>>>103101 directory entries were hashed with "r5" hash.
> >>>>>Selected hash ("r5") does not match to the hash set in the super
> >>>>>block (not set).
> >>>>>        "r5" hash is selected
> >>>>>Flushing..finished
> >>>>>        Read blocks (but not data blocks) 687599
> >>>>>                Leaves among those 20621
> >>>>>                Objectids found 114185
> >>>>>
> >>>>>Pass 1 (will try to insert 20621 leaves):
> >>>>>####### Pass 1 #######
> >>>>>Looking for allocable blocks .. finished
> >>>>>0%....20%....40%....60%....80%....100%                        left 0,
> >>>>>1718 /sec
> >>>>>Flushing..finished
> >>>>>        20621 leaves read
> >>>>>                20524 inserted
> >>>>>                        - pointers in indirect items pointing to
> >>>>>metadata 3 (zeroed)
> >>>>>                97 not inserted
> >>>>>        non-unique pointers in indirect items (zeroed) 1075
> >>>>>####### Pass 2 #######
> >>>>>
> >>>>>Pass 2:
> >>>>>0%....20%....40%....60%vpf-10260: The file we are inserting the new
> >>>>>item (69291 69327 0x1 DRCT (2), len 216, location 3880 entry count
> >>>>>65535, fsck need 0, format new) into has no StatData, insertion was
> >>>>>skipped ....vpf-10260: The file we are inserting the new item (240148
> >>>>>240150 0x1 IND (1), len 1844, location 2252 entry count 0, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (241304 319211
> >>>>>0x43001 IND (1), len 492, location 3604 entry count 0, fsck need 0,
> >>>>>format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (737518 739813
> >>>>>0xe6001 IND (1), len 688, location 3408 entry count 0, fsck need 0,
> >>>>>format new) into has no StatData, insertion was skipped
> >>>>>80%vpf-10260: The file we are inserting the new item (737518 739813
> >>>>>0xe6001 IND (1), len 688, location 3408 entry count 0, fsck need 0,
> >>>>>format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (25 93014 0x1e1
> >>>>>DRCT (2), len 1408, location 2688 entry count 65535, fsck need 0,
> >>>>>format new) intohas no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (238343 319306
> >>>>>0x3f4001 IND (1), len 136, location 3960 entry count 0, fsck need 0,
> >>>>>format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (94077 119920 0x1
> >>>>>DRCT (2), len 456, location 3640 entry count 65535, fsck need 0,
> >>>>>format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (102491 220397
> >>>>>0x179 DRCT (2), len 1264, location 2832 entry count 65535, fsck need
> >>>>>0, format new)into has no StatData, insertion was skipped
> >>>>>.vpf-10260: The file we are inserting the new item (642448 771721
> >>>>>0xcc1 DRCT (2), len 520, location 3576 entry count 65535, fsck need
> >>>>>0, format new)into has no StatData, insertion was skipped
> >>>>>.vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new)into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>.vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new)into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>.vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new)into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>vpf-10260: The file we are inserting the new item (294390 692752
> >>>>>0x129 DRCT (2), len 296, location 3800 entry count 65535, fsck need
> >>>>>0, format new) into has no StatData, insertion was skipped
> >>>>>100%                           left 0, 0 /sec
> >>>>>Flushing..finished
> >>>>>        Leaves inserted item by item 97
> >>>>>Pass 3 (semantic):
> >>>>>####### Pass 3 #########
> >>>>>/binrebuild_semantic_pass: The entry [3636 189939] ("ls") in
> >>>>>directory [2 3636] points to nowhere - is removed
> >>>>>/javarebuild_semantic_pass: The entry [107571 597512] ("jre") in
> >>>>>directory [3636 107571] points to nowhere - is removed
> >>>>>vpf-10650: The directory [3636 107571] has the wrong size in the
> >>>>>StatData (72) - corrected to (48)
> >>>>>vpf-10650: The directory [2 3636] has the wrong size in the StatData
> >>>>>(2920) - corrected to (2896)
> >>>>>/devrebuild_semantic_pass: The entry [6 554632] ("lvm") in directory
> >>>>>[2 6] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [6 52003] ("lirc") in directory [2
> >>>>>6] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [6 72207] ("scsi") in directory [2
> >>>>>6] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [6 50738] ("xdb5") in directory [2
> >>>>>6] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [6 50739] ("xdb6") in directory [2
> >>>>>6] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [6 50740] ("xdb7") in directory [2
> >>>>>6] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [6 50741] ("xdb8") in directory [2
> >>>>>6] points to nowhere - is removed
> >>>>>...
> >>>>>... (here follow hundreds of directories and thousends of files, too,
> >>>>>...  which I removed)
> >>>>>...
> >>>>>The entry [994339 994340] ("Entries") in directory [994335 19]
> >>>>>updated to point to [994339 49]
> >>>>>/Entries.Extra.Oldrewrite_file: 1 items of file [994339 994343] moved
> >>>>>to [994339 50]
> >>>>>The entry [994339 994343] ("Entries.Extra.Old") in directory [994335
> >>>>>19] updated to point to [994339 50]
> >>>>>relocate_dir: Moving [994350 994773 0x0 SD (0)] to [994350 51 0x0 SD
> >>>>>(0)] relocate_dir: Moving [994350 994773 0x1 DIR (3)] to [994350 51
> >>>>>0x1 DIR (3)] /994350_51get_next_directory_item: The entry ".." of the
> >>>>>directory [994350 51] pointes to [285394 994350], instead of [2 18] -
> >>>>>corrected rebuild_semantic_pass: The entry [994773 994783] ("Root")
> >>>>>in directory [994350 51] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [994773 994776] ("Entries.Extra") in
> >>>>>directory [994350 51] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [994773 994782] ("Repository") in
> >>>>>directory [994350 51] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [994773 994779]
> >>>>>("Entries.Extra.Old.bak") in directory [994350 51] points to nowhere
> >>>>>- is removed
> >>>>>rebuild_semantic_pass: The entry [994773 994784] ("Root.bak") in
> >>>>>directory [994350 51] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [994773 994780] ("Entries.Old") in
> >>>>>directory [994350 51] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [994773 994775] ("Entries.bak") in
> >>>>>directory [994350 51] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [994773 994781] ("Entries.Old.bak")
> >>>>>in directory [994350 51] points to nowhere - is removed
> >>>>>rebuild_semantic_pass: The entry [994773 994778]
> >>>>>("Entries.Extra.Old") in directory [994350 51] points to nowhere - is
> >>>>>removed
> >>>>>rebuild_semantic_pass: The entry [994773 994777]
> >>>>>("Entries.Extra.bak") in directory [994350 51] points to nowhere - is
> >>>>>removed
> >>>>>vpf-10650: The directory [994350 51] has the wrong size in the
> >>>>>StatData (400) - corrected to (72)
> >>>>>/994395_994396get_next_directory_item: The entry ".." of the
> >>>>>directory [994395 994396] pointes to [684030 994395], instead of [2
> >>>>>18] - corrected /994415_994416get_next_directory_item: The entry ".."
> >>>>>of the directory [994415 994416] pointes to [684030 994415], instead
> >>>>>of [2 18] - corrected /994529_994754get_next_directory_item: The
> >>>>>entry ".." of the directory [994529 994754] pointes to [984867
> >>>>>994529], instead of [2 18] - corrected Looking for lost files:
> >>>>>vpf-10670: The file [25 93091] has the wrong size in the StatData
> >>>>>(30352) - corrected to (36864)
> >>>>>vpf-10680: The file [25 93091] has the wrong block count in the
> >>>>>StatData (64) - corrected to (72)
> >>>>>vpf-10680: The file [25 111982] has the wrong block count in the
> >>>>>StatData (75408) - corrected to (16872)
> >>>>>vpf-10680: The file [3127 59061] has the wrong block count in the
> >>>>>StatData (8) - corrected to (0)
> >>>>>vpf-10680: The file [3128 72300] has the wrong block count in the
> >>>>>StatData (8) - corrected to (0)
> >>>>>vpf-10680: The file [3620 18950] has the wrong block count in the
> >>>>>StatData (8) - corrected to (0)
> >>>>>...
> >>>>>...
> >>>>>...
> >>>>>rewrite_file: 2 items of file [994350 994764] moved to [994350 3108]
> >>>>>rewrite_file: 2 items of file [994350 994765] moved to [994350 3109]
> >>>>>rewrite_file: 2 items of file [994350 994766] moved to [994350 3110]
> >>>>>Flushing..finished
> >>>>>        Objects without names 18403
> >>>>>        Empty lost dirs removed 384
> >>>>>        Dirs linked to /lost+found: 2174
> >>>>>                Dirs without stat data found 83
> >>>>>        Files linked to /lost+found 16229
> >>>>>        Objects having used objectids: 49
> >>>>>                files fixed 47
> >>>>>                dirs fixed 2
> >>>>>Pass 4 - finished   done 1476, 37 /sec
> >>>>>        Deleted unreachable items 716
> >>>>>Flushing..finished
> >>>>>Syncing..finished
> >>>>>###########
> >>>>>reiserfsck finished at Tue Feb  8 17:40:05 2005
> >>>>>###########
