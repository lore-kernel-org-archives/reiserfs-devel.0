From: Sam Vilain <sam@vilain.net>
Subject: Bad blocks
Date: Tue, 16 Apr 2002 02:13:50 +0100
Message-ID: <E16xHXa-0000Mh-00@hoffman.vilain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10076-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I seem to have some bad blocks on my laptop's hard drive, how do I mark
them as bad to reiserfs?

root@hoffman:/usr/share/doc/RFC/unclassified# ls
hda: read_intr: status=0x5b { DriveReady SeekComplete DataRequest Index Error }
hda: read_intr: error=0x40 { UncorrectableError }, LBAsect=25866987, sector=4211304
end_request: I/O error, dev 03:06 (hda), sector 4211304
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [66745 67408 0x0 SD]
ls: rfc470.txt.gz: Permission denied
hda: read_intr: status=0x5b { DriveReady SeekComplete DataRequest Index Error }
hda: read_intr: error=0x40 { UncorrectableError }, LBAsect=25866987, sector=4211304
end_request: I/O error, dev 03:06 (hda), sector 4211304
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [66745 67410 0x0 SD]
ls: rfc486.txt.gz: Permission denied
hda: read_intr: status=0x5b { DriveReady SeekComplete DataRequest Index Error }
hda: read_intr: error=0x40 { UncorrectableError }, LBAsect=25866987, sector=4211304
end_request: I/O error, dev 03:06 (hda), sector 4211304
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [66745 67409 0x0 SD]
ls: rfc478.txt.gz: Permission denied
rfc1.txt.gz    rfc239.txt.gz  rfc370.txt.gz  rfc501.txt.gz  rfc697.txt.gz  rfc84.txt.gz
   [...]

I know I have 8 bad sectors:

hoffman:/usr/share/doc/RFC/unclassified# dd if=/dev/hda6 of=test skip=4211303 count=2
dd: reading `/dev/hda6': Input/output error
1+0 records in
1+0 records out
hoffman:/usr/share/doc/RFC/unclassified# dd if=/dev/hda6 of=test skip=4211311 count=2
dd: reading `/dev/hda6': Input/output error
0+0 records in
0+0 records out
hoffman:/usr/share/doc/RFC/unclassified# dd if=/dev/hda6 of=test skip=4211312 count=2
2+0 records in
2+0 records out
hoffman:/usr/share/doc/RFC/unclassified# 

`mkreiserfs' is missing the -c and -l options.

`reiserfsck' aborts during the scan with the message:

pass_through_tree: unable to read 526413 block on device 0x3

Apparently, ext2 handles marking sectors as bad automatically.

How can I deal with this?  If anyone knows of a tool to re-format just
8 sectors (to let the disk re-map the blocks elsewhere), that also
would be helpful.

Cheers,
--
   Sam Vilain, sam@vilain.net     WWW: http://sam.vilain.net/
    7D74 2A09 B2D3 C30F F78E      GPG: http://sam.vilain.net/sam.asc
    278A A425 30A9 05B5 2F13

