From: Yasuo Iwakura <yasuoiwakura@arcor.de>
Subject: =?unknown-8bit?q?df=C2=A0_shows=C2=A0_172GB_reiserFS_partition_as=C2=A0?= 109GB partition
Date: 07 Jul 2003 19:49:22 +0200
Message-ID: <1057600162.2657.218.camel@brainless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14841-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I have a IBM Deskstar 180GB Harddrive and I created a 172GB Reiser FS
partition, using drakconf (mdk-9.1-ger).

The Problem is, "df" show only 109GB, same with  windows(samba) -
Windows says 108GB. (btw, the Bios thinks 130GB but i think thats not
important)

"df (coreutils) 4.5.7"
"Linux version 2.4.21-0.13mdk"

fdisk says
"
/dev/hda: 185.2 GByte, 185283624960 Byte"
- 255 heads
- 63 sectors
- 22526 cylinder

/dev/hda1
- cylinder 1-22526
- 180940063+ blocks
- ID 83  Linux
"

i dont know, how much data i can write on the partition, when df thinks
there are only 109GB :(

Thank for the help and sorry for my bad english ;)
-- 
Yasuo Iwakura <yasuoiwakura@arcor.de>

