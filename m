From: Cesar Augusto Bonadio <bonadio@picture.com.br>
Subject: slow rebuild-tree
Date: Thu, 24 Aug 2006 15:48:01 -0300
Message-ID: <44EDF461.8020805@picture.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello

We have a server with a partition of 1.1TB, last saturday
the machine locked up and we had to reboot, after that

when we access some files we received and "permission denied"
so we started a reiserfsck with rebuild-tree, the process is still running

19047 root      25   0  141m 140m 2748 R 99.9  7.0   6401:43 reiserfsck

we are running reiserfsprogs  3.6.19-1, I saw a post about running 3.6.20
but I could not find this file.

Is this normal to take this long? any ideas?

Thanks for any help

running Debian  with 2.6.16.13
the server has 4 400GB SATA II in RAID5 with megaraid controller



