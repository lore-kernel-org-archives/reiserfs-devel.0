From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: bug report (?) with  reiserfsck --rebuild-tree.......
Date: Sat, 10 May 2003 21:14:20 +0400
Message-ID: <200305102114.20627.vitaly@namesys.com>
References: <20030510145146.58538.qmail@web13901.mail.yahoo.com> <3EBD2976.2080406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14057-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EBD2976.2080406@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: serge rossel <serger@rocketmail.com>, reiserfs-list@namesys.com

On Saturday 10 May 2003 20:31, Hans Reiser wrote:
> Vitaly, does the current fsck explain at length that read errors tend t=
o
> be hardware failures, and what to do?

yes, it sais

The problem has occurred looks like a hardware problem.
If you have bad blocks, we advise you to get a new hard
drive, because once you get one bad block that the disk
drive internals cannot hide from your sight, the chances
of getting more are generally said to become much higher
(precise statistics are unknown to us), and this disk drive
is probably not expensive enough for you to risk your time
and data on it. If you don't want to follow that advice,
then if you have just a few bad blocks, try writing to the
bad blocks and see if the drive remaps the bad blocks (that
means it takes a block it has in reserve and allocates it
for use for requests of that block number).  If it cannot
remap the block, this could be quite bad, as it may mean
that so many blocks have gone bad that none remain in=20
reserve to allocate.


> >SeekComplete DataRequest Error }
> ><4>hda: read_intr: error=3D0x40 { UncorrectableError },
> >LBAsect=3D230962500, sector=3D188743680
> ><4>end_request: I/O error, dev 03:04 (hda), sector
> >188743680
> ><4>sh-2029: reiserfs read_bitmaps: bitmap block
> >(#23592960) reading failed
> ><4>sh-2014: reiserfs_read_super: unable to read bitmap
> ><4>hda: read_intr: status=3D0x59 { DriveReady
> >SeekComplete DataRequest Error }
> ><4>hda: read_intr: error=3D0x40 { UncorrectableError },
> >LBAsect=3D231224644, sector=3D189005824
> ><4>end_request: I/O error, dev 03:04 (hda), sector
> >189005824
> ><4>hda: read_intr: status=3D0x59 { DriveReady
> >SeekComplete DataRequest Error }
> ><4>hda: read_intr: error=3D0x40 { UncorrectableError },
> >LBAsect=3D231486789, sector=3D189267968
> ><4>end_request: I/O error, dev 03:04 (hda), sector

this is a hadrware problem.

> >serge@dhcppc2:~> su
> >Password:
> >dhcppc2:/home/serge # reiserfsck --rebuild-tree
> >--logfile check.log /var/log
> >reiserfsck 3.6.2 (2002)
> >
> >Will rebuild the filesystem (/var/log) tree
> >Will put log info to 'check.log'
> >
> >Do you want to run this program?[N/Yes] (note need to
> >type Yes):Yes
> >
> >bread: Cannot read a block # 2.
> >
> >Abandon

Serge, if you used the latest reiserfsprogs, you would get=20
the message above.

--=20
Thanks,
Vitaly Fertman
