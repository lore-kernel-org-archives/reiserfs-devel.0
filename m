From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: $25 question - ReiserFS 3.6 data errors on 2.4.23
Date: Wed, 18 Feb 2004 13:08:31 +0300
Message-ID: <1077098911.5090.38.camel@tribesman.namesys.com>
References: <20040218093510.GD21098@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040218093510.GD21098@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "jens@spamfreemail.de" <jens@spamfreemail.de>
Cc: reiserfs-list@namesys.com

Hello

> Mailing-List: contact reiserfs-list-help@namesys.com; run by ezmlm
> To: reiserfs-list@namesys.com
> From: Jens Benecke <jens@spamfreemail.de>
> Subject: $25 question - ReiserFS 3.6 data errors on 2.4.23
> Date: Tue, 17 Feb 2004 14:52:10 +0100
> Organization: University of the Armed Forces, Hamburg, Germany
> 
> Hi,
> 
> I posted here in December about problems with one specific computer and
> having to rebuild-tree a partition because of data errors on it.
> 
> Well, it happeend again. I don't understand this. I am running a dozen
> machines, each with ReiserFS, most of them under much heavier load than
> those two in question, but for the FOURTH time in some months THIS
> partition has coughed up errors (see below).
> 
> I would really like to get to the bottom of this. The same problem happened
> with 2.4.19 and 2.4.22 (without data logging) after some weeks of
> continuous useage. I am running another server with the same 2.4.23 kernel
> (+ data logging patches) and it has not had any file sytems problems. The
> strange thing is, there are no signs of hardware problems in the logs where
> these errors occur:
> 
> Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
> free_space(entry_count) 0
> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
> format found in block 4683374. Fsck?
> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-13070: reiserfs_read_inode2:
> i/o failure occurred trying to find stat data of [68636 68667 0x0 SD]
> Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
> free_space(entry_count) 0
> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
> format found in block 4683374. Fsck?
> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-13070: reiserfs_read_inode2:
> i/o failure occurred trying to find stat data of [68636 68668 0x0 SD]
> Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
> free_space(entry_count) 0
> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
> format found in block 4683374. Fsck?
> Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
> free_space(entry_count) 0
> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
> format found in block 4683374. Fsck?
> Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
> one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
> free_space(entry_count) 0
> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
> format found in block 4683374. Fsck?
> Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-13070: reiserfs_read_inode2:
> i/o failure occurred trying to find stat data of [68636 68666 0x0 SD]
> Feb 17 14:40:18 linux1 imaplogin: LOGOUT, user=et7ks,
> ip=[::ffff:134.28.62.44], headers=0, body=0
> 
> It's always the same files, the machine has had these for a couple weeks,
> and it does not depend on drbd (I had the same problems before starting to
> mirror stuff).
> 
> 
> If anybody would like a reiserfsdebug output mailed somewhere please say so.
> I will arrange for a downtime and run reiserfsdebug over the partition.
> 

These days usually when one notices similar corruptions - he later
discovers hardware problem (memory problem more often). May I ask you to
try memtest for some time.

Does linux1 have other reiserfs filesystem with similar loads?

Can you switch machine linux1 with other machine which runs flawlessly
currently?
Then if that machine will get filesystem corruptions - then we probably
have a bug which comes up on the load linux1 is currently running under.

If it will work well - than linux1 is probably not very reliable.






