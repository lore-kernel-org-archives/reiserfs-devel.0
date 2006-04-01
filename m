From: Pierre =?UTF-8?B?RXRjaGVtYcOvdMOp?= <petchema@concept-micro.com>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Sun, 2 Apr 2006 01:15:45 +0200
Message-ID: <20060402011545.e0213e6e.petchema@concept-micro.com>
References: <44206D3C.7050504@free.fr>
	<4420FFA2.1090908@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4420FFA2.1090908@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Tue, 21 Mar 2006 23:41:22 -0800, Hans Reiser <reiser@namesys.com> a =C3=
=A9crit :

>  It may be that we need to port some of
> the block allocation optimizations from V3 to V4 (Jeff's work) to help
> with 90% full filesystems.

Talking of that, I've read about a localized performance problem of
reiserfs 3 in backuppc's mailing list (that is otherwise similar in
performance with xfs for that task). I wonder if it was ever reported
to you, as suggested in this mailing list...

http://sourceforge.net/mailarchive/message.php?msg_id=3D8646808

My understanding is that backuppc is hitting reiserfs3 hard links worse
case.

Backuppc creates a huge pool of all versions of all files from all
backups, compressed, organized using MD5 hashing (handling collisions
of course), and hardlinked from their different backup views. [Some
metadata is stored separately, so that several files with same content
but different metadata can still be shared on disk. But I digress]
At night, a sweeping process takes place to remove too old backups
(according to user policy), and maybe check if some more background
sharing/compression can be done.

If I remember well, v3 puts directory entries and their corresponding
inodes next to each other on disk. When hardlinks are created, new
directory entries are created, pointing to the same inode. If the first
directory entry is removed, the inode could be no longer stored near
any of the entries pointing to it.

Since backuppc is routinely removing directory entries in FIFO order,
it's almost guaranteed to happen every time. Hence a very bad inodes
distribution on disk after some time...

I don't know what xfs does exactly (blocks of preallocated inodes ?) but
it does better in this case.

Hope it helps,
Pierre.
