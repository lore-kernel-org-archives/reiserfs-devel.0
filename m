From: Brian Marr <cabernet@internode.on.net>
Subject: Filesystem errors
Date: Tue, 16 Jul 2002 01:46:01 +0930
Message-ID: <200207160146.01440.cabernet@internode.on.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs list <reiserfs-list@namesys.com>

Can anyone help interpret these logs ? They have just started appearing o=
n my=20
Suse 8.0 system. I have made some tentative exploration with reiserfsck=20
--check. The results were
reiserfsck......check started on Mon
Replaying journal
0 transactions replayed
checking S+tree..../1(of 2 ) / 1(of 164)/ 51(of 166)
pass_through_tree: Unable to read block 52842 block on device 0x3

The system is working but something is obviously wrong. Also the xserver =
is=20
taking ages to start.

Brian Marr

(snip)=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
VFS: Disk change detected on device sr(11,0)
hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D487003,=20
sector=3D422736
end_request: I/O error, dev 03:02 (hda), sector 422736
hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D487003,=20
sector=3D422736
end_request: I/O error, dev 03:02 (hda), sec


(snip)=3D=3D=3D=3D=3D=3D
hda: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D474244,=20
sector=3D409984
end_request: I/O error, dev 03:02 (hda), sector 409984
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat =
data=20
of [96126 168017 0x0 SD]
