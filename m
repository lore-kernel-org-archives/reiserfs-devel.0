From: Brian Marr <cabernet@internode.on.net>
Subject: Re: Filesystem errors
Date: Tue, 16 Jul 2002 03:37:23 +0930
Message-ID: <200207160337.23572.cabernet@internode.on.net>
References: <200207160146.01440.cabernet@internode.on.net> <200207160222.50147.cabernet@internode.on.net> <3D3268FF.5040505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D3268FF.5040505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs list <reiserfs-list@namesys.com>

I have looked at the FAQ. I have not touched fdisk.
I am thinking of backing up the partition, reformatting and copying back =
the=20
data. I had to do this on another drive recently.
Brian Marr

Current useage
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda2              14G  2.5G   11G  17% /

On Monday 15 July 2002 15:47, you wrote:
> Brian Marr wrote:
> >What reiserfsck paramaters should I try ? Do I have to do --rebuild-tr=
ee ?
> >Brian Marr
> >
> >On Monday 15 July 2002 15:36, you wrote:
> >>Brian Marr wrote:
> >>>Can anyone help interpret these logs ? They have just started appear=
ing
> >>> on my Suse 8.0 system. I have made some tentative exploration with
> >>> reiserfsck --check. The results were
> >>>reiserfsck......check started on Mon
> >>>Replaying journal
> >>>0 transactions replayed
> >>>checking S+tree..../1(of 2 ) / 1(of 164)/ 51(of 166)
> >>>pass_through_tree: Unable to read block 52842 block on device 0x3
> >>>
> >>>The system is working but something is obviously wrong. Also the xse=
rver
> >>>is taking ages to start.
> >>
> >>Probably you have bad blocks on your reiserfs partition. And because =
of
> >>this your xserver starts so slowly. Kernel trying to reread a block a=
nd
> >>can't do it, because it is bad.
>
> Please, read on www.namesys.com about this problem. Right now I may
> suggest you to try to kill old xserver binary and copy it again.
>
> >>>Brian Marr
> >>>
> >>>(snip)=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>VFS: Disk change detected on device sr(11,0)
> >>>hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
> >>>hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D487003=
,
> >>>sector=3D422736
> >>>end_request: I/O error, dev 03:02 (hda), sector 422736
> >>>hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
> >>>hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D487003=
,
> >>>sector=3D422736
> >>>end_request: I/O error, dev 03:02 (hda), sec
> >>>
> >>>
> >>>(snip)=3D=3D=3D=3D=3D=3D
> >>>hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
> >>>hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D474244=
,
> >>>sector=3D409984
> >>>end_request: I/O error, dev 03:02 (hda), sector 409984
> >>>vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find =
stat
> >>>data of [96126 168017 0x0 SD]

