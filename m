From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: data logging 2.6 - possible bug
Date: Tue, 10 Feb 2004 22:06:31 +0100
Message-ID: <402947D7.7000003@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16748-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

after a week of uptime on my daily use workstation
with kernel 2.6.2-rc2 + 2.6.1 exp data logging patches
I did a reboot and reiserfsck of the raid1 device /dev/md1.

Reiserfsck found 5 corruptions all of the style:
/.tmp-kallsyms2.ovpf-10680: The file [420253 452289] has the
wrong block count in the StatData (256), should be (320).

Only .tmp-kallsyms[1|2].ovpf files in / and /usr/src/2.6.2-rc2
were affected, no "production" files.
These files are not listed by ls -f, neither before --fix-fixable
nor after it. --fix-fixable was able to correct these corruptions.

-- 
lg, Chris
