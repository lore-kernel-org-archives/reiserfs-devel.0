From: Bingner Sam J Contractor PACAF CSS/SCHE <Sam.Bingner@hickam.af.mil>
Subject: RE: FW: Problem with reiserfsck --rebuild-tree
Date: Fri, 30 Aug 2002 18:33:33 -0000
Message-ID: <5C13D527041B9145AB3E6D5D040494AD09CB77@himl07.hickam.pacaf.ds.af.mil>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C25053.BEC2A2A8"
Return-path: <reiserfs-list-return-11351-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: "'reiserfs-list@namesys.com '" <reiserfs-list@namesys.com>
Cc: 'Vitaly Fertman ' <vitaly@namesys.com>

------_=_NextPart_000_01C25053.BEC2A2A8
Content-Type: text/plain;
	charset="koi8-r"

Only data in syslog relevant was:

what I believe to be the original error:

Aug 28 15:33:26 recluce kernel: reiserfs: checking transaction log (device
09:00) ...
Aug 28 15:33:27 recluce kernel: reiserfs: replayed 1 transactions in 2
seconds
Aug 28 15:33:27 recluce kernel: is_tree_node: node level 1 does not match to
the expected one 4
Aug 28 15:33:27 recluce kernel: vs-5150: search_by_key: invalid format found
in block 26542. Fsck?
Aug 28 15:33:27 recluce kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [1 2 0x0 SD]
Aug 28 15:33:27 recluce kernel: Using r5 hash to sort names
Aug 28 15:33:27 recluce kernel: is_tree_node: node level 1 does not match to
the expected one 4
Aug 28 15:33:27 recluce kernel: vs-5150: search_by_key: invalid format found
in block 26542. Fsck?
Aug 28 15:33:27 recluce kernel: vs-2140: finish_unfinished: search_by_key
returned -2
Aug 28 15:33:27 recluce kernel: ReiserFS version 3.6.25
Aug 28 15:33:43 recluce kernel: raid5: switching cache buffer size, 4096 -->
512
Aug 28 15:33:43 recluce kernel: FAT: bogus logical sector size 0
Aug 28 15:33:43 recluce kernel: VFS: Can't find a valid FAT filesystem on
dev 09:00.
Aug 28 15:33:49 recluce kernel: raid5: switching cache buffer size, 512 -->
4096
Aug 28 15:33:50 recluce kernel: reiserfs: checking transaction log (device
09:00) ...
Aug 28 15:33:50 recluce kernel: is_tree_node: node level 1 does not match to
the expected one 4
Aug 28 15:33:50 recluce kernel: vs-5150: search_by_key: invalid format found
in block 26542. Fsck?
Aug 28 15:33:50 recluce kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [1 2 0x0 SD]
Aug 28 15:33:50 recluce kernel: Using r5 hash to sort names
Aug 28 15:33:50 recluce kernel: is_tree_node: node level 1 does not match to
the expected one 4
Aug 28 15:33:50 recluce kernel: vs-5150: search_by_key: invalid format found
in block 26542. Fsck?
Aug 28 15:33:50 recluce kernel: vs-2140: finish_unfinished: search_by_key
returned -2
Aug 28 15:33:50 recluce kernel: ReiserFS version 3.6.25

current errors:

reiserfs: checking transaction log (device 16:41) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
raid5: switching cache buffer size, 1024 --> 4096
dev 09:00: Unfinished reiserfsck --rebuild-tree run detected. Please run
reiserfsck --rebuild-tree and wait for a completion. If that fails
get newer reiserfsprogs package
raid5: switching cache buffer size, 4096 --> 1024
read_super_block: can't find a reiserfs filesystem on (dev 09:00, block 8,
size 1024)

and

dev 09:00: Unfinished reiserfsck --rebuild-tree run detected. Please run
reiserfsck --rebuild-tree and wait for a completion. If that fails get newer
reiserfsprogs package
read_super_block: can't find a reiserfs filesystem on (dev 09:00, block
2,size 4096)

PS: I had to subscribe to post, but forgot to edit out the part saying I
wasnt subscribed, you can disregard that ;)

	Sam Bingner
	PACAF CSS/SCHE
	Contractor RSIS
	DSN	315 449-7889
	COMM	808 449-7889

-----Original Message-----
From: Vitaly Fertman [mailto:vitaly@namesys.com]
Sent: Thursday, August 29, 2002 10:33 PM
To: Bingner Sam J Contractor PACAF CSS/SCHE; 'reiserfs-list@namesys.com '
Cc: 'sam@dhs.org '
Subject: Re: [reiserfs-list] FW: Problem with reiserfsck --rebuild-tree



Hi, 

Do you see anything related in your syslog, like I/O errors or similar?

please send me the metadata dump of your partition:
    debugreiserfs -p /dev/md0 | bzip -c > md0.bz2


On Friday 30 August 2002 12:19, Bingner Sam J Contractor PACAF CSS/SCHE
wrote:
>  <<rebuild.log.gz>>
> I had some corruption on my drive, and it hammered the FS (and alot of
> the files I'm sure) ... so I had to run reiserfsck --rebuild-tree ...
> I'm attaching the output as well as the logfile, it looks like it's
> finding alot of good dirs etc, but it's getting a segfault...  any help
> would be greatly appreciated...
>
> my tape drive is FUBAR, so unfortunately, no I don't have a backup of
> everything ;)
>
> Lastly, I'm not subscribed to the list. Please CC me at either this
> address or sam@dhs.org on all replies... thanks :)
>
> Sam
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.6.3
>
>   **********************************************************
>   ** This  is  an  experimental  version  of  reiserfsck, **
>   **              !! MAKE A BACKUP FIRST !!               **
>   ** Don't run this program unless something  is  broken. **
>   ** Some types of random FS damage can be recovered from **
>   ** by  this  program,   which  basically   throws  away **
>   ** the internal nodes of the tree and then reconstructs **
>   ** them. This program is for use only by the desperate, **
>   ** and is  of only beta quality.  If you are using  the **
>   ** latest  reiserfsprogs  and  it  fails  please  email **
>   ** bug reports to reiserfs-list@namesys.com.            **
>   **********************************************************
>
> Will rebuild the filesystem (/dev/md0) tree
> Will put log info to 'rebuild.log'
>

-- 

Thanks,
Vitaly Fertman


------_=_NextPart_000_01C25053.BEC2A2A8--
