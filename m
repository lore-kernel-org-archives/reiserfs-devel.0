From: Moritz Angermann <moritz.angermann@gmx.net>
Subject: O.k. so this way, r8 ?
Date: 18 Jul 2002 14:57:05 +0200
Sender: Moritz Angermann <cone@caos.mine.nu>
Message-ID: <1026997025.734.8.camel@prototype>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

so i check it all out:
thanks for your help.
so this is what i'm going to do,
i'd just like to have it confirmed, so
i get less risk to kill my FS.

#0 backing up my data
#1 getting 2.4.18
#2 getting all patches from
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.18.pending
#3 applying them all to my 2.4.18 kernel.
#4 make clean;make menuconfig;make dep;make bzfloppy[;make modules;make
modules install ?]
#5 getting
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.2.tar.gz
#6 unpacking it; ./configure --prefix=/mnt/floppy/rfsp;make;make install
#7 reboot
#8 umount /
#9 rfsp/reiserfsck /dev/hda6 --fix-fixable
#10 reboot [and hope]

-thanks.
-moritz
