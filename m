From: Chris Worley <chrisw@lnxi.com>
Subject: 2GB limit won't go away
Date: Sun, 9 Jun 2002 06:13:41 +0000 (UTC)
Message-ID: <1023708533.4654.301.camel@xserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm Running Linux 2.4.10-4GB on SuSE 7.3 with reiserfsprogs-3.x.0j-1
(using 3.5.x disk format...ReiserFS version 3.6.25) atop
lvm-1.0.0.2_rc2-6.  I believe I upgraded reiserfs after a disk crash
last xmas (with a few remnants of that catastrophe still in the system).

I try to "mount -o remount,conv" and put "conv" in the options section
for the root partition in the /etcfstab file.

But,  I can't create a file greater than 2GB.

What am I doing wrong?  I'd really like to accomplish this without
changing lvm or my kernel.

Thanks,

Chris



