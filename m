From: Jure =?ISO-8859-2?Q?Pe=5Far?= <pegasus@nerv.eu.org>
Subject: reiserfs3 errors
Date: Sun, 17 Oct 2004 15:16:23 +0200
Message-ID: <20041017151623.1774c6ee.pegasus@nerv.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Sunday morning and i'm greeted with this in the logs of one of our
production servers:

Oct 17 03:44:55 mai-stor2 kernel: md(9,19):vs-4080: reiserfs_free_block:
free_block (0913:28890293)[dev:blocknr]: bit already cleared
Oct 17 03:44:55 mai-stor2 kernel: md(9,19):vs-4080: reiserfs_free_block:
free_block (0913:28890290)[dev:blocknr]: bit already cleared
Oct 17 03:44:55 mai-stor2 kernel: md(9,19):vs-4080: reiserfs_free_block:
free_block (0913:28890289)[dev:blocknr]: bit already cleared
Oct 17 03:44:55 mai-stor2 kernel: md(9,19):vs-4080: reiserfs_free_block:
free_block (0913:28890288)[dev:blocknr]: bit already cleared
Oct 17 03:44:55 mai-stor2 kernel: md(9,19):vs-4080: reiserfs_free_block:
free_block (0913:28890286)[dev:blocknr]: bit already cleared
Oct 17 03:44:55 mai-stor2 kernel: md(9,19):vs-4080: reiserfs_free_block:
free_block (0913:28890285)[dev:blocknr]: bit already cleared
Oct 17 03:44:55 mai-stor2 kernel: md(9,19):vs-4080: reiserfs_free_block:
free_block (0913:28890284)[dev:blocknr]: bit already cleared

and then an avalanche of

Oct 17 03:45:11 mai-stor2 kernel: vs-3050: wait_buffer_until_released:
nobody releases buffer (dev 09:13, size 4096, blocknr 28890283, count 2,
list 0, state 0x10019, page c17a4b40, (UPTODATE, CLEAN, UNLOCKED)). Still
waiting (30000000)  JDIRTY !JWAIT

Can someone confirm that a bad memory is a cause for this?


Then when the other machine wanted to take over the disks, i got this:

Oct 17 03:56:43 mai-stor1 kernel: is_tree_node: node level 25938 does not
match to the expected one 1
Oct 17 03:56:43 mai-stor1 kernel: md(9,19):vs-5150: search_by_key: invalid
format found in block 125446178. Fsck?
Oct 17 03:56:43 mai-stor1 kernel: md(9,19):vs-13070: reiserfs_read_inode2:
i/o failure occurred trying to find stat data of [108 45294024 0x0 SD]
Oct 17 03:56:46 mai-stor1 kernel: is_tree_node: node level 25938 does not
match to the expected one 1
Oct 17 03:56:46 mai-stor1 kernel: md(9,19):vs-5150: search_by_key: invalid
format found in block 125446178. Fsck?
Oct 17 03:56:46 mai-stor1 kernel: md(9,19):vs-13070: reiserfs_read_inode2:
i/o failure occurred trying to find stat data of [108 45294024 0x0 SD]
Oct 17 04:00:06 mai-stor1 kernel: is_tree_node: node level 25938 does not
match to the expected one 1
Oct 17 04:00:06 mai-stor1 kernel: md(9,19):vs-5150: search_by_key: invalid
format found in block 123025023. Fsck?
Oct 17 04:00:06 mai-stor1 kernel: md(9,19):vs-13070: reiserfs_read_inode2:
i/o failure occurred trying to find stat data of [108 45263681 0x0 SD]


Now reiserfsck --rebuild-tree is running ... hopefully it will finish until
monday morning ...=20


--=20

Jure Pe=E8ar
http://jure.pecar.org/
