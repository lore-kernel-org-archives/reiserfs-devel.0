From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Which filesystem do errors come from?
Date: Thu, 25 Jul 2002 23:57:34 +0200 (CEST)
Message-ID: <Pine.LNX.4.44.0207252352120.1119-100000@grignard.amagerkollegiet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-list-return-11079-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hi

I am getting som errors on a box running reiserfs:

is_leaf: item location seems wrong (second one): *3.5*[87265 197987 0x1 IND=
], item_len 1, item_location 1379, free_space(entry_count) 21729
vs-5150: search_by_key: invalid format found in block 473792. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat da=
ta of [87265 216135 0x0 SD]
[...]

Note that these errors most likely come from DMA trouble on the
controller or disk, so I'm not asking for help on recovering data or
anything.

However, I cannot seem to find out, what filesystem, these errors come
from:

moffe@tuborg:~# mount | grep reiserfs
/dev/hda6 on / type reiserfs (rw)
/dev/hdc1 on /home type reiserfs (rw)

How can I see, whether the messages come from hda6 or hdc1?

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
[...] Note that 120 sec is defined in the protocol as the maximum
possible RTT.  I guess we'll have to use something other than TCP
to talk to the University of Mars.
----------------------------------[ moffe at amagerkollegiet dot dk ] --

