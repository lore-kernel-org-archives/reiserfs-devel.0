From: Tom Vier <tmv@comcast.net>
Subject: /proc/mounts doesn't show attrs
Date: Sat, 07 Sep 2002 17:31:10 -0400
Message-ID: <20020907213110.GA6012@yzero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

i added the attrs mount option in my fstab, and it's definetly worked. it's
not showing up in /proc/mounts, though:

rootfs / rootfs rw 0 0
/dev/root / reiserfs rw,mand 0 0

/dev/root points to /dev/md/0, btw.

from /etc/fstab:
/dev/md/0	/		reiserfs	defaults,mand,attrs	0	0

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
