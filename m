From: grobe@gmx.net
Subject: Re: corrupted fs: bitmap does not match to the correct one....
Date: Wed, 15 May 2002 15:58:46 +0200 (MEST)
Message-ID: <19890.1021471126@www22.gmx.net>
References: <20020515170855.A986@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi!

> > I have a bad problem with my reiserfs. I got a lot of SCSI-errors in the
> > Hm. SCSI errors are bad, and you have performed everything on the same
> hardware?

Yes, a Serveraid 4M with a EXP15 Raid 5 attached. Curent kernel (2.4.16),
current firmware, current driver (and UNCHANGED!).

> What kind of errors was there, by the way?

Zeus:/tmp # tail -50 /var/log/warn
May 15 12:54:01 Zeus kernel: SCSI disk error : host 2 channel 0 id 1 lun 0
return code = 70000
May 15 12:54:01 Zeus kernel:  I/O error: dev 08:11, sector 211045693
[... a lot of these ...]
May 15 12:54:01 Zeus kernel: SCSI disk error : host 2 channel 0 id 1 lun 0
return code = 70000
May 15 12:54:01 Zeus kernel:  I/O error: dev 08:11, sector 242274461
May 15 14:18:03 Zeus kernel: reiserfs: checking transaction log (device
3a:00) ...
May 15 14:18:07 Zeus kernel: is_tree_node: node level 2 does not match to
the expected one 4
May 15 14:18:07 Zeus kernel: vs-5150: search_by_key: invalid format found in
block 9113. Fsck?
May 15 14:18:07 Zeus kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [1 2 0x0 SD]
May 15 14:18:07 Zeus kernel: Using r5 hash to sort names
May 15 14:18:07 Zeus kernel: ReiserFS version 3.6.25
May 15 14:18:45 Zeus kernel: FAT: bogus logical sector size 0
May 15 14:18:45 Zeus kernel: VFS: Can't find a valid FAT filesystem on dev
3a:00.
May 15 14:18:45 Zeus kernel: VFS: Can't find a HFS filesystem on dev 3a:00.
May 15 14:19:00 Zeus kernel: reiserfs: checking transaction log (device
3a:00) ...
May 15 14:19:00 Zeus kernel: is_tree_node: node level 2 does not match to
the expected one 4
May 15 14:19:00 Zeus kernel: vs-5150: search_by_key: invalid format found in
block 9113. Fsck?
May 15 14:19:00 Zeus kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [1 2 0x0 SD]
May 15 14:19:00 Zeus kernel: Using r5 hash to sort names
May 15 14:19:00 Zeus kernel: ReiserFS version 3.6.25
May 15 14:30:57 Zeus kernel: FAT: bogus logical sector size 0
May 15 14:30:57 Zeus kernel: VFS: Can't find a valid FAT filesystem on dev
3a:00.
May 15 14:30:57 Zeus kernel: VFS: Can't find a HFS filesystem on dev 3a:00.
May 15 14:31:11 Zeus kernel: reiserfs: checking transaction log (device
3a:00) ...
May 15 14:31:11 Zeus kernel: is_tree_node: node level 2 does not match to
the expected one 4
May 15 14:31:11 Zeus kernel: vs-5150: search_by_key: invalid format found in
block 9113. Fsck?
May 15 14:31:11 Zeus kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [1 2 0x0 SD]
May 15 14:31:11 Zeus kernel: Using r5 hash to sort names
May 15 14:31:11 Zeus kernel: ReiserFS version 3.6.25

> What version of reiserfsprogs was used?

3.x.0j

> How about more error messages about scsi errors in the logs?

As I mentioned,  I can't mount any more, so no more messages...

> Not likely. If you have extended the fs more than 132M in size, you'd
> notice if something go wrong instantly.

I shrinked the fs, and I have created new fs (I use lvm, so I shrinke fs,
than reduced the logical volume size, and reused the disk space for other fs).

> There is always a chance, another question (rather important in your case,
> it seems) is what option would be faster.

That's what I need to know ;-) In fact, the backup is on an IDE-Array, I
dont get more than 10MB/s from the backup server, and i have 300GB of data...

Thank You, CU, Lars.

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net

