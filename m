From: Harald van Pee <pee@iskp.uni-bonn.de>
Subject: crash after kernel: clm-6004: convert tail failed inode ... error -28
Date: Fri, 21 Jun 2002 17:52:52 +0200
Message-ID: <200206211552.g5LFqqc07539@klee.cb.uni-bonn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

this is stock linux 2.4.18 on SuSE 7.0.=20
Last night I wrote to a disk on an software raid 0 array until there was =
no=20
capacity availible on this disk. But my jobs don't stop writing and so I =
got=20
a lot of clm-6004: convert tail failed messages,=20
until the kernel the kernel stops working. The last 6 entries in=20
/var/log/messages=20
before the crash are from this kind of messages, nothing else for the nex=
t 12=20
hours until I noticed the crash.
I can't see any problems with the filesystem after the reboot.
I don't want to reproduce this error, but I want to avoid such kind of cr=
ashs=20
in the future.

Is this a known problem and does a patch exists?

Regards
Harald
