From: Mira =?iso-8859-2?Q?Temp=EDr?= <mira@cekit.cz>
Subject: reiserfsck --rebuild-tree on a big filesystem
Date: Mon, 25 Nov 2002 15:36:34 +0100
Message-ID: <20021125143634.GC9006@mail.cekit.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12038-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello,
my setup:
linux 2.4.18 SMP, HW RAID5, nearly full 240GB reiserfs of mostly small file=
s,
reiserprogs 3.6.4.

After some power outages (but this is only my opinion, that this
caused of our problems), our array run into situation when
parts of filesystem structure were broken (it seemed so, but were still
usable):

Nov 23 22:24:55 zeus kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [9221389 9221390 0x0 SD]=20
Nov 23 22:24:55 zeus kernel: is_tree_node: node level 12664 does not
match to the expected one 1=20
Nov 23 22:24:55 zeus kernel: vs-5150:
search_by_key: invalid format found in block 56940122. Fsck?=20

So I've started filesystem check with these results:
node (3117838) with wrong level (0) found in the tree (should be 1)
whole subtree skipped
node (56940122) with wrong level (12664) found in the tree (should be 1)
whole subtree skipped
free block count 41569 mismatches with a correct one 43484.=20
on-disk bitmap does not match to the correct one.=20

With advice to run --rebuild-tree.
But after 16 hours of running it, it is still on 0% and whole process=20
would take about 1 month to complete (started at 2000 blocks/sec,=20
but now running at 26b/s).

My question is: is there any way how to speed up filesystem restore?
I still believe, that problem is not in hardware and data is recoverable.

We are ready to pay for support if it can help in same way.

--=20
   mira temp=EDr <mira@cekit.cz> -- =E8ekit s.r.o.
   bratislavsk=E1 2, 602 00 brno, czech republic
