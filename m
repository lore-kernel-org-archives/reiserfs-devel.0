From: myciel <myciel@dotcom.pl>
Subject: dead inode read from disk... ignore?
Date: Wed, 12 Nov 2003 11:26:21 +0100
Message-ID: <3FB20ACD.8080105@dotcom.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16055-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi

Few times a day I get in syslog:
kernel: sd(8,20):vs-13075: reiserfs_read_inode2: dead inode read from 
disk [11574064 47212 0x0 SD]. This is likely to be race with knfsd. Ignore

I just wanted to be sure: should I  really ignore this?

kernel: 2.4.22 SMP + data-logging patches + Trond's nfs patches
2 filesystems:  ~800G and  ~450G,
filled in ~50% with small files avg size ~36kb

thanks

rafal

