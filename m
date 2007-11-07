From: Dushan Tcholich <dusanc@gmail.com>
Subject: [BUG] reiser4-for-2.6.22-2 Large stalls when using atime mount
	option
Date: Wed, 07 Nov 2007 21:24:48 +0100
Message-ID: <1194467088.4766.0.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiser4 <reiserfs-devel@vger.kernel.org>

Kernel: Gentoo 2.6.22-r2 + reiser4-for-2.6.22-2.patch
fstab:
/dev/sda2        /boot        ext2        noauto,noatime    1 2
/dev/sda5        /        reiser4                0 0
/dev/sda3        none        swap        sw        0 0 
/dev/sda6        /home        ext3        noatime        0 0

reiser4 partition is with cryptocompress (lzo) default settings.

I usually mount r4 with -noatime, but after some debbuging with some
users on irc (rvalles), who have intermitent large stalls, we found that
only difference between our setups was my -noatime flag in fstab. 
I tried to mount / without -noatime, started gnome, and then in about
same time evolution, firefox, played some mp3s, avis, did a kernel
compile, emerge -uD world (compiled few packages), acessed some random
fles in /usr/src/linux, started gnome disk usage analyser etc. and had
no stalls at all. 
And then I tried to reboot. System stalled for 3min 25 sec (i was ready
with a watch :)) before printing the first message, with heavy disk
activity.
Upon reboot I just changed line in fstab with nano to mount r4 with
-noatime and rebooted agin. Now there were no stalls. 


Related/same bugreports:
http://marc.info/?l=reiserfs-devel&m=113081021609510&w=2
http://marc.info/?l=reiserfs-devel&m=114368644227582&w=2
http://marc.info/?l=reiserfs-devel&m=115488109712570&w=2
http://marc.info/?l=reiserfs-devel&m=117507704927976&w=2 this one is
interesting - Reiser4 does a disk write with even no disk activity
during every fsync()
http://marc.info/?l=reiserfs-devel&m=115285478906088&w=2

As I can see this started in 2.6.12->2.6.13 transition time.

Have fun :)


