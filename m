From: Radim Kolar <hsn@cybermail.net>
Subject: how to use reiserfs with smaller journal?
Date: Fri, 9 Aug 2002 18:01:59 +0200
Message-ID: <20020809160159.GA381@home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I can not use reiserfs with smaller journal than default. I create
filesystem with:
mkreiserfs -s 513 /dev/hdd1
output looks ok

mount /dev/hdd1 /mnt -t reiserfs
mount: wrong fs type, bad option, bad superblock on /dev/hdd1,
or too many mounted file systems
      
syslog:
Aug  9 17:53:57 home kernel: read_super_block: can't find a reiserfs
filesystem
on (dev 16:41, block 16, size 4096)
Aug  9 17:53:57 home kernel: read_super_block: can't find a reiserfs
filesystem
on (dev 16:41, block 2, size 4096)

what is wrong?
