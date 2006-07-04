From: "Diego Pinheiro" <diegopp@Safe-mail.net>
Subject: Reiser4 on top of software raid 0 (dmraid) - another problem
Date: Tue, 4 Jul 2006 14:56:51 -0400
Message-ID: <N1-H9MllQX4ad@Safe-mail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm having another problem when running reiser4 on top of software raid 0 (dmraid)...

I can work the filesystem fine (mount, copy, create, delete, move, etc...) - even big ammount of data (> 3Gb) as a separate (non / - root folder) filesystem. But if I try to mount this filesystem as the root filesystem I get a segmentation fault in the init script (in the process to update the /etc/mtab file (line 413 Fedora Core 5 init script). The line "mount -f /" goes fine; but the line "mount -f /proc" generates the error)...

The same procedure with a ext3 filesystem goes fine, so apparently it's not the init script, neither the software raid or the kernel (2.6.16.22 with 2.6.16-4 reiser4 patch)

Any ideas?

Thanks,
Diego
