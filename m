From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Errors requiring --rebuild-tree in 2.4.23
Date: Thu, 11 Dec 2003 20:27:58 +0300
Message-ID: <200312112027.58197.vitaly@namesys.com>
References: <br9soe$h0h$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16332-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <br9soe$h0h$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Benecke <jens@spamfreemail.de>, reiserfs-list@namesys.com
Cc: vs@namesys.com

On Thursday 11 December 2003 16:51, Jens Benecke wrote:
> Hi,
>
> I posted earlier about quota problems. WE updated to 2.4.23 b ecause of the
> logging patches because some power failures made our /home partition spew
> out these: (QUESTIONS at the end of the mail)
>
>
> Dec  1 06:26:05 artus kernel: is_leaf: item location seems wrong (second
> one): *3.6* [113366 113466 0x1 DIRECT], item_len 280, item_location 1216,
> free_space(entry_count) 65535
> Dec  1 06:26:05 artus kernel: vs-5150: search_by_key: invalid format found
> in block 36020. Fsck?
> Dec  1 06:26:05 artus kernel: vs-13070: reiserfs_read_inode2: i/o failure
> occurred trying to find stat data of [113366 113469 0x0 SD]
> Dec  1 06:26:05 artus kernel: is_leaf: item location seems wrong (second
> one): *3.6* [113366 113466 0x1 DIRECT], item_len 280, item_location 1216,
> free_space(entry_count) 65535
> Dec  1 06:26:05 artus kernel: vs-5150: search_by_key: invalid format found
> in block 36020. Fsck?
> Dec  1 06:26:05 artus kernel: vs-13070: reiserfs_read_inode2: i/o failure
> occurred trying to find stat data of [113366 113469 0x0 SD]
> Dec  1 06:26:05 artus kernel: is_leaf: item location seems wrong (second
> one): *3.6* [113366 113466 0x1 DIRECT], item_len 280, item_location 1216,
> free_space(entry_count) 65535
> Dec  1 06:26:05 artus kernel: vs-5150: search_by_key: invalid format found
> in block 36020. Fsck?
> Dec  1 06:26:05 artus kernel: vs-13070: reiserfs_read_inode2: i/o failure
> occurred trying to find stat data of [113366 113469 0x0 SD]
> Dec  1 06:26:05 artus kernel: is_leaf: item location seems wrong (second
> one): *3.6* [113366 113466 0x1 DIRECT], item_len 280, item_location 1216,
> free_space(entry_count) 65535
> Dec  1 06:26:05 artus kernel: vs-5150: search_by_key: invalid format found
> in block 36020. Fsck?
> Dec  1 06:26:05 artus kernel: vs-13070: reiserfs_read_inode2: i/o failure
> occurred trying to find stat data of [113366 113469 0x0 SD]
> Dec  1 06:26:05 artus kernel: is_leaf: item location seems wrong (second
> one): *3.6* [113366 113466 0x1 DIRECT], item_len 280, item_location 1216,
> free_space(entry_count) 65535
> Dec  1 06:26:05 artus kernel: vs-5150: search_by_key: invalid format found
> in block 36020. Fsck?
> Dec  1 06:26:05 artus kernel: vs-13070: reiserfs_read_inode2: i/o failure
> occurred trying to find stat data of [113366 113469 0x0 SD]
>
>
>
> We only ever got read errors from cron scripts working on /home so we
> thought that was the only partition affected. (And anyway, stuff in / and
> usr was never _written_ to so it should have been OK).
>
> But shortly after upgrading our server crashed totally and booting knoppix
> we found this in the syslog:
>
>
>
> Dec  9 23:00:57 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [5 19 0x1 IND], item_len 28, item_location 2964,
> free_space(entry_count) 0
> Dec  9 23:00:57 linux1 kernel: ide0(3,1):vs-5150: search_by_key: invalid
> format found in block 23346. Fsck?
> Dec  9 23:00:57 linux1 kernel: ide0(3,1):vs-13050: reiserfs_update_sd: i/o
> failure occurred trying to update [5 9 0x0 SD] stat data
> Dec  9 23:00:57 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [5 19 0x1 IND], item_len 28, item_location 2964,
> free_space(entry_count) 0
> Dec  9 23:00:57 linux1 kernel: ide0(3,1):vs-5150: search_by_key: invalid
> format found in block 23346. Fsck?
> Dec  9 23:00:57 linux1 kernel: ide0(3,1):vs-13050: reiserfs_update_sd: i/o
> failure occurred trying to update [5 7 0x0 SD] stat data
> Dec  9 23:00:57 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [5 19 0x1 IND], item_len 28, item_location 2964,
> free_space(entry_count) 0
> Dec  9 23:00:57 linux1 kernel: ide0(3,1):vs-5150: search_by_key: invalid
> format found in block 23346. Fsck?
> Dec  9 23:00:57 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [5 19 0x1 IND], item_len 28, item_location 2964,
> free_space(entry_count) 0
> Dec  9 23:00:57 linux1 kernel: ide0(3,1):vs-5150: search_by_key: invalid
> format found in block 23346. Fsck?
> Dec  9 23:00:57 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [5 19 0x1 IND], item_len 28, item_location 2964,
> free_space(entry_count) 0
> Dec  9 23:00:57 linux1 kernel: ide0(3,1):vs-5150: search_by_key: invalid
> format found in block 23346. Fsck?
> Dec  9 23:00:57 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [5 19 0x1 IND], item_len 28, item_location 2964,
> free_space(entry_count) 0
> Dec  9 23:00:57 linux1 qmail: 1071007257.421057 delivery 498: deferral:
> Aack,_child_crashed._(#4.3.0)/
> Dec  9 23:00:57 linux1 kernel: ide0(3,1):vs-5150: search_by_key: invalid
> format found in block 23346. Fsck?
>
>
> and much more of these. These required a --rebuild-tree (done with 3.6.11
> from Knoppix from November 2003):
>
>
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 312614 blocks marked used
> Skipping 8241 blocks (super block, journal, bitmaps) 304373 blocks will be
> read
> 0%.block 23346: The number of items (35) is incorrect, should be (19) -
> corrected
> block 23346: The free space (1540) is incorrect, should be (2520) -
> corrected
>                                                       left 286816, 1350
> /sec [1]+  Stopped                 reiserfsck --rebuild-tree /dev/hda1
> root@1[mnt]# fg
> reiserfsck --rebuild-tree /dev/hda1
> ...20%....40%....60%....80%...block 447056: The free space (2) is
> incorrect, should be (4072) - corrected
> .100%                        left 0, 3074 /sec
> 133527 directory entries were hashed with "r5" hash.
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 304373
>                 Leaves among those 34465
>                         - leaves all contents of which could not be saved
> and deleted 1
>                 Objectids found 133061
>
> Pass 1 (will try to insert 34464 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....100%                        left 0, 1641
> sec
> Flushing..finished
>         34464 leaves read
>                 34431 inserted
>                 33 not inserted
> ####### Pass 2 #######
>
> Pass 2:
> 0%....20%....40%....60%....80%....100%                          left 0, 66
> sec
> Flushing..finished
>         Leaves inserted item by item 33
> Pass 3 (semantic):
> ####### Pass 3 #########
> /bin/dfvpf-10680: The file [5 19] has the wrong block count in the StatData
> (56) - corrected to (0)                            rebuild_semantic_pass:
> The entry [5 21] ("ln") in directory [2 5] points to nowhere - is removed
> rebuild_semantic_pass: The entry [5 22] ("ls") in directory [2 5] points to
> nowhere - is removed
> rebuild_semantic_pass: The entry [5 25] ("mv") in directory [2 5] points to
> nowhere - is removed
> rebuild_semantic_pass: The entry [5 26] ("rm") in directory [2 5] points to
> nowhere - is removed
> rebuild_semantic_pass: The entry [5 20] ("dir") in directory [2 5] points
> to nowhere - is removed
> rebuild_semantic_pass: The entry [5 23] ("mkdir") in directory [2 5] points
> to nowhere - is removed
> rebuild_semantic_pass: The entry [5 24] ("mknod") in directory [2 5] points
> to nowhere - is removed
> rebuild_semantic_pass: The entry [5 27] ("rmdir") in directory [2 5] points
> to nowhere - is removed
> vpf-10680: The directory [2 5] has the wrong block count in the StatData
> (5) - corrected to (4)
> vpf-10650: The directory [2 5] has the wrong size in the StatData (2152) -
> corrected to (1960)                                /libFlushing..finished
> in the StatData (2587122) -/usr/lib/nessus/plugins         Files found:
> 115781
>         Directories found: 10270
>         Symlinks found: 2875
>         Others: 4120
>         Files with fixed size: 1
>         Names pointing to nowhere (removed): 8
> Pass 3a (looking for lost dir/files):
> ####### Pass 3a (lost+found pass) #########
> Looking for lost directories:
> Flushing..finished8, 103 /sec
> Pass 4 - finished  done 33606, 99 /sec
>         Deleted unreachable items 1
> Flushing..finished
> Syncing..finished
> ###########
> reiserfsck finished at Wed Dec 10 22:42:29 2003
> ###########
>
> --------------------------------------------------------------------------
>
> QUESTIONS:
>
> - can I safely assume that the ONLY files damaged were the ones that
> reiserfsck mentioned and deleted?

almost. reiserfsck tries to be accurate in reporting what it does, but it 
might silently remove something if consideres it as not recoverable.

>
> - is it possible that the new reiserfs code introduced data loss bugs, or
> is it more likely that it brought old errors in the FS to the surface that
> the 2.4.19 code never noticed? (We never had problems executing "ls" or
> "ln" before moving to 2.4.23, but it was apparently one of the files that
> was severely damaged).
>
yes, it is possible

> - is it possible to show the files/directories that are affected in the
> syslog when errors occur? Otherwise it's always guesswork which files you
> can still trust and which you can't. (And yes, we do have backups, i.e. the
> other drbd machine, but only for /home ATM).
>
yes, I am working on improving those warnings.

> - How can I prevent this from happening in the future?

Am I corrent that you got corrupted filesystem as result of the following:
install 2.4.23 with datalogging patches,
power failure under heavy load
?  

> Is it possible to
> detect this kind of errors and automatically reboot, forcing a fsck at
> reboot? Does that make sense?

I think no. Returing -EIO when metadata corruption is encountered (currently 
reiserfs returns -EACCES) seems to be more appropriate. 

--
Thanks,
Vitaly Fertman
