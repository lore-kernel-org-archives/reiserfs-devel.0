From: Gorazd Golob <gorazdg@noviforum.si>
Subject: md raid 1 & reiser4
Date: Thu, 20 Jan 2005 08:31:41 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0501200822270.17233@datsun.noviforum.si>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi!

I have a very strange problem. I'm using 2.6.10 vanilla kernel with latest
reiser4 patch. I'm using reiser4progs from gentoo distrobution 1.0.3.
I have created md raid 1 device and formated if with reiser4
(mkfs.reiser4), mounted the partition (it took a bit longer than mounting
a normal partition), copy some data on it - and suddenly it froze. I
wasn't able to do ls on mount point (also freeze) and so on. I wasn't even
able to reboot system properly - waiting for unmount of reiser4 partition?
So after rebooting the computer (hard way) I mounted same reiser4
partition again - and it was without data. What can be wrong - is that
known issue using reiser4 and md together?
Reiser4 is working ok on same configuration on ide disk device (hdx).

thanks, gorazd
