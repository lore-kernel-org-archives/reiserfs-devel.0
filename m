From: Brian Marr <cabernet@internode.on.net>
Subject: Re: Filesystem errors
Date: Tue, 16 Jul 2002 02:22:50 +0930
Message-ID: <200207160222.50147.cabernet@internode.on.net>
References: <200207160146.01440.cabernet@internode.on.net> <3D326683.1000606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D326683.1000606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs list <reiserfs-list@namesys.com>


What reiserfsck paramaters should I try ? Do I have to do --rebuild-tree =
?
Brian Marr

On Monday 15 July 2002 15:36, you wrote:
> Brian Marr wrote:
> >Can anyone help interpret these logs ? They have just started appearin=
g on
> > my Suse 8.0 system. I have made some tentative exploration with
> > reiserfsck --check. The results were
> >reiserfsck......check started on Mon
> >Replaying journal
> >0 transactions replayed
> >checking S+tree..../1(of 2 ) / 1(of 164)/ 51(of 166)
> >pass_through_tree: Unable to read block 52842 block on device 0x3
> >
> >The system is working but something is obviously wrong. Also the xserv=
er
> > is taking ages to start.
>
> Probably you have bad blocks on your reiserfs partition. And because of
> this your xserver starts so slowly. Kernel trying to reread a block and
> can't do it, because it is bad.
>
> >Brian Marr
> >
> >(snip)=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >VFS: Disk change detected on device sr(11,0)
> >hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
> >hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D487003,
> >sector=3D422736
> >end_request: I/O error, dev 03:02 (hda), sector 422736
> >hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
> >hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D487003,
> >sector=3D422736
> >end_request: I/O error, dev 03:02 (hda), sec
> >
> >
> >(snip)=3D=3D=3D=3D=3D=3D
> >hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
> >hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D474244,
> >sector=3D409984
> >end_request: I/O error, dev 03:02 (hda), sector 409984
> >vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find st=
at
> > data of [96126 168017 0x0 SD]

