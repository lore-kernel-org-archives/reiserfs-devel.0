From: myciel <myciel@dotcom.pl>
Subject: reiserfs_read_inode2: i/o failure occurred trying to find stat data...
Date: Tue, 09 Mar 2004 12:39:58 +0100
Message-ID: <404DAD0E.5030105@dotcom.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

for few days allready I get some new messagess from kernel,
I suppose following is not good :-(

kernel 2.4.22 + data-logging
uptime 139 days
mount options: notail,noatime,nodiratime,data=ordered

Mar  4 18:23:20 host kernel: is_tree_node: node level 2570 does not 
match to the expected one 1
Mar  4 18:23:20 host kernel: sd(8,20):vs-5150: search_by_key: invalid 
format found in block 161743381. Fsck?
Mar  4 18:23:20 host kernel: sd(8,20):vs-13070: reiserfs_read_inode2: 
i/o failure occurred trying to find stat data of [8840375 34384847 0x0 SD]
Mar  4 18:23:20 host kernel: is_tree_node: node level 2570 does not 
match to the expected one 1

regards

rafal
