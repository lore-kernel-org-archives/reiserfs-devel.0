From: mangoo@interia.pl
Subject: testing compression in reiserfs4.1
Date: 07 Apr 2005 11:03:20 +0200
Message-ID: <20050407090320.ABD062BC072@poczta.interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-list-return-23798-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I was long looking for a Linux filesystem that would support r/w transparen=
t compression.

jffs2 is stable, but is dedicated to flash devices mainly, and hence the ma=
ximum size of this filesystem is 4 GB.

ext2 + compression patches does not work with 2.6 kernels, has no journalin=
g (it's ext2, after all), and is not considered stable (which doesn't bothe=
r me that much for my purposes).

IBM's jfs supports compression, but not under Linux.


And there is (will be) reiserfs4.1, which will at last have compression sup=
port?

Is it to be released anytime soon?

If not, where can I get 4.1 sources and how can I patch my kernel with the =
current, most up-to-date reiserfs4.1-alpha-don't-use version?

Features I need is compression, hardlinks and read/write (of course) - is t=
he current state OK to test it on a /mnt/test partition with non-critical d=
ata?


Tomek


------------------------------------------------------------------
Jan Pawel II 1920 - 2005
http://link.interia.pl/f1871 

