From: Nick Wellnhofer <wellnhofer@aevum.de>
Subject: reiserfs corruption
Date: Sat, 16 Nov 2002 23:35:19 +0100
Message-ID: <3DD6C827.5090501@aevum.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com


Hi,

we recently upgraded one of our servers from Linux kernel 2.2.16 to
2.4.18. After the upgrade I got the following error messages in syslog
repeatedly:

is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 1365267. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat
data of [4 40403 0x0 SD]

It's always the same block 1365267.

After I did a reiserfsck --check I was told to run --rebuild-tree (I
couldn't look at the exact output of the program since I have only
remote access to the server. I put the reiserfsck in the boot scripts,
rebooted and got a return value of 2). At first I only tried
--fix-fixable. Now I get one error message less, the only remaining ones =
are

is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 1365267. Fsck?

But the system still runs fine, so I'm a bit scared to try a
--rebuild-tree, especially because I have no direct access to the server
right now. What are your experiences with --rebuild-tree? What are the
chances of --rebuild-tree failing?

I'm using the old reiserfs 3.5 layout and the newest reiserfsprogs 3.6.4.=


Another thing: I expect that my reiserfs file system was already
corrupted before the kernel upgrade, but only the new kernel version
tells me about that. Does reiserfs report more error conditions in
kernel 2.4?

Thanks for your help,

Nick Wellnhofer


--=20
The hot Caribbean sun and a sweet sea breeze are all that can be felt.
http://matadorworld.com/
--
aevum gmbh
leopoldstr. 87
80802 m=FCnchen
germany

fon: +4989 38380653
fax: +4989 38799384
wellnhofer@aevum.de
http://www.aevum.de


