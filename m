From: Dirk Leber <dirk.leber@web.de>
Subject: How to work around bad blocks?
Date: Mon, 10 Mar 2003 21:15:50 -0800
Sender: dirk.leber@web.de
Message-ID: <200303102115.50039.dirk.leber@web.de>
Reply-To: dirk.leber@web.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello List,
I am the unhappy owner of a "corrupt" ReiserFS. All the other partitions =
on=20
the same disk work fine, just this one seems to have some bad blocks. HEr=
e=20
are some outputs:

> mount /dev/hda4 /mnt/data2/
mount: wrong fs type, bad option, bad superblock on /dev/hda4,
       or too many mounted file systems

> reiserfsck --check
[no problem]

> reiserfsck --fix-fixable /dev/hda4
reiserfsck 3.6.2 (2002)
Will check consistency of the filesystem on /dev/hda4
Will fix what can be fixed w/o --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Mon Mar 10 20:50:03 2003
###########

bread: Cannot read a block # 7503872.


> badblocks -b 4096
[detects bad blocks 7503858 - 7503871]

Obviously the build-tree option also fails. The "How Reiser handles Bad=20
blocks-FAQ" can only be considered a bad joke, since you need a degree in=
=20
computer science AND a mountable filesystem for fooling the FS in that wa=
y.=20

What I would like to do is, detecting the bad blocks, freeing them (accep=
ting=20
there content) rebuilding the tree (or not) and than mounting it while=20
accepting that some files will be corrupt.=20

What can I do?=20

Dirk=20

