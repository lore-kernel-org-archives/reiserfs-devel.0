From: Jakub Neumann <yavi@V-LO.krakow.pl>
Subject: another quota problem
Date: Mon, 12 Jan 2004 23:29:43 +0100 (CET)
Message-ID: <Pine.LNX.4.44.0401122320180.9334-100000@august.V-LO.krakow.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16468-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I compiled the 2.4.23 kernel with reiserFS, quota patches for
it form <somewhere on the suse mirror> and grsecurity.
But when I booted it, I got a "unknown option usrquota" error on
my /home (which is the only fs with quota enabled)...
Used 2.4.20 with ReiserFS quota before, and there was no such
problem.
my line from /etc/fstab:
/dev/sda7	/home	reiserfs	nosuid,nodev,usrquota  0  2

I'd be happy if anybody could help me :)

