From: Bruce <bestb@sympatico.ca>
Subject: Re: Can resize_reiserfs do non-destructive resizing??
Date: Mon, 18 Nov 2002 08:51:54 -0500
Message-ID: <200211180851.54274.bestb@sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Thanks; I ran=20
=09reiserfsck --rebuild-sb /de/hda2
then tried to run=20
=09reiserfsck --rebuild-tree
However, running the second came up with:

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 1837081 blocks marked used
Skipping 8373 blocks (super block, journal, bitmaps) 1828708 blocks will =
be=20
read
0%                                                      left 1823494, 260=
7=20
/sec
bread: Cannot read a block # 17599.



Aborted
[root@desktop /] #

Thoughts??

Bruce
