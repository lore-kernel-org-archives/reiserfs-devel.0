From: Tom Vier <tmv@comcast.net>
Subject: non-standard journal breaks autodetect
Date: Sun, 10 Aug 2003 20:32:26 -0400
Message-ID: <20030811003226.GA426@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


[root@zero root]# mkreiserfs -l hosts -s 16386 /dev/sdc4
[root@zero root]# mount /dev/sdc4 /mnt/
mount: you must specify the filesystem type
[root@zero root]# mount -t reiserfs /dev/sdc4 /mnt/
[root@zero root]# 

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
