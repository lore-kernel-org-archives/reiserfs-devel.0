From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: ReiserFS 3.6 errors
Date: Tue, 29 Mar 2005 20:01:38 +0400
Message-ID: <1112112098.4766.597.camel@tribesman.namesys.com>
References: <42497B29.4020506@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42497B29.4020506@teleformix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Oglesby <doglesby@teleformix.com>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2005-03-29 at 19:58, Dan Oglesby wrote:
> Greetings,
> 
> I just finished installing a machine that uses ReiserFS v3.6 
> filesystems, one of which is on a RAID-5 device off of a 3Ware 7506 
> controller.
> 
> After the build, a stress test was run that generates a lot of disk I/O, 
> and I saw the following in dmesg:
> 
> vs-500: unknown uniqueness 1162690892
> vs-500: unknown uniqueness 1162690892
> vs-500: unknown uniqueness 1162690892
> vs-500: unknown uniqueness 1162690892
> vs-500: unknown uniqueness 1162690892
> vs-500: unknown uniqueness 1162690892
> , item_len 14136, item_location 10272, free_space(entry_count) 11827
> vs-5150: search_by_key: invalid format found in block 2029494. Fsck?
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
> data of [40 171378 0x0 SD]
> is_leaf: item location seems wrong (second one): *3.6* [40 357194 0x0 
> SD], item_len 44, item_location 2412, free_space(entry_count) 65535
> vs-5150: search_by_key: invalid format found in block 3864557. Fsck?
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
> data of [40 357181 0x0 SD]
> vs-500: unknown uniqueness 1647255672
> vs-500: unknown uniqueness 1647255672
> vs-500: unknown uniqueness 1647255672
> vs-500: unknown uniqueness 1647255672
> vs-500: unknown uniqueness 1647255672
> vs-500: unknown uniqueness 1647255672
> , item_len 27951, item_location 29803, free_space(entry_count) 28265
> vs-5150: search_by_key: invalid format found in block 4488286. Fsck?
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
> data of [40 453681 0x0 SD]
> 
> I did see something in the FAQ about requiring a reboot after changing 
> partitions on a disk.  Unfortunately, I didn't see this until after the 
> machine was built.  Could these errors be caused from a lack of a reboot 
> between partitioning the disk and running mkreiserfs?
> 
I do not think so.

> This is on a RedHat 7.3 system, using kernel 2.4.20.
2.4.20 is quite old. Would it be possible to use newer kernel? 2.4.29,
namely?

> 
> --Dan
> 

