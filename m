From: Jens Benecke <jens@spamfreemail.de>
Subject: $25 question - ReiserFS 3.6 data errors on 2.4.23
Date: Tue, 17 Feb 2004 14:52:10 +0100
Sender: news <news@sea.gmane.org>
Message-ID: <c0t66m$i3q$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

I posted here in December about problems with one specific computer and
having to rebuild-tree a partition because of data errors on it.

Well, it happeend again. I don't understand this. I am running a dozen
machines, each with ReiserFS, most of them under much heavier load than
those two in question, but for the FOURTH time in some months THIS
partition has coughed up errors (see below).

I would really like to get to the bottom of this. The same problem happened
with 2.4.19 and 2.4.22 (without data logging) after some weeks of
continuous useage. I am running another server with the same 2.4.23 kernel
(+ data logging patches) and it has not had any file sytems problems. The
strange thing is, there are no signs of hardware problems in the logs where
these errors occur:

Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
free_space(entry_count) 0
Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
format found in block 4683374. Fsck?
Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-13070: reiserfs_read_inode2:
i/o failure occurred trying to find stat data of [68636 68667 0x0 SD]
Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
free_space(entry_count) 0
Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
format found in block 4683374. Fsck?
Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-13070: reiserfs_read_inode2:
i/o failure occurred trying to find stat data of [68636 68668 0x0 SD]
Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
free_space(entry_count) 0
Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
format found in block 4683374. Fsck?
Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
free_space(entry_count) 0
Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
format found in block 4683374. Fsck?
Feb 17 14:40:18 linux1 kernel: is_leaf: item location seems wrong (second
one): *3.6* [68637 68643 0x1 IND], item_len 8, item_location 1444,
free_space(entry_count) 0
Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-5150: search_by_key: invalid
format found in block 4683374. Fsck?
Feb 17 14:40:18 linux1 kernel: drbd(43,0):vs-13070: reiserfs_read_inode2:
i/o failure occurred trying to find stat data of [68636 68666 0x0 SD]
Feb 17 14:40:18 linux1 imaplogin: LOGOUT, user=3Det7ks,
ip=3D[::ffff:134.28.62.44], headers=3D0, body=3D0

It's always the same files, the machine has had these for a couple weeks,
and it does not depend on drbd (I had the same problems before starting to
mirror stuff).


If anybody would like a reiserfsdebug output mailed somewhere please say so.
I will arrange for a downtime and run reiserfsdebug over the partition.


Please help =3D;)


PS: I'm serious about the subject. If this is something I messed up and you
tell me where I'm perfectly willing to pay for it.

--=20
Jens Benecke (jens at spamfreemail.de)
http://www.hitchhikers.de - Europaweite kostenlose Mitfahrzentrale
http://www.spamfreemail.de - 100% saubere Postf=E4cher - garantiert!
http://www.rb-hosting.de - PHP ab 9? - SSH ab 19? - g=FCnstiger Traffic
