From: Yaroslav Kholev <yaroslav@tourinfo.ru>
Subject: ioctl and software raid
Date: Thu, 26 Aug 2004 18:15:32 +0400
Message-ID: <412DF084.6030202@tourinfo.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I`m using the vanilla kernel 2.4.27 with quota patches from 
ftp.suse.com/pub/people/mason/patches/data-loggin
reiserfsprogs - 3.6.18
the system is installed and booting from software raid-1 partition 
(/dev/md0)

I`ve found this message in system log after the system has booted:
Aug 26 09:14:10 gate-t md: fsck.reiserfs(pid 47) used obsolete MD ioctl, 
upgrade your software to use new ictls.

should i do anything with it ? is it critical?


ps
sorry for my english :)

