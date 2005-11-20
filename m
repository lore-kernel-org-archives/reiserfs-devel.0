From: julius Junghans <julius.junghans@gmx.de>
Subject: resize_reiserfs, free space in front....
Date: Sun, 20 Nov 2005 15:46:43 +0100
Message-ID: <43808C53.5000808@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

i would like to grow my reserfs partition, the unsued space is in front 
of my root partition, between swap and root partition.
as stated in the resize_reiserfs manpage:

.......This can be done using cfdisk(8) for partitions, by deleting the 
partition and recreating it with
       a larger size (assuming there is free space after the partition 
in question).  Make sure you re-create it with the same starting disk
       cylinder as before!  Otherwise, the resize operation will 
certainly not work, and you may lose your entire filesystem.....

the same starting cylinder wouldnt change anything in my case...
is it possible what i want todo with resize_reiserfs?
- if yes then the manpage should be updated.

greets
julius
