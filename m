From: Joachim Zobel <jzobel@heute-morgen.de>
Subject: Yet another reiserfs<dm<md corruption
Date: Sun, 10 Apr 2005 20:04:45 +0200
Message-ID: <1113156285.4681.7.camel@localhost>
Reply-To: jzobel@heute-morgen.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi.

After upgrading to the latest sarge (on x86 withe ide) I found a lvm2
logical partition with reiserf 3.6 on a software raid1 corrupted. Trying
to reiserfsck --rebuild-tree it I got: 

-------
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

build_the_tree: Nothing but leaves are expected. Block 9746 - unknown
-------

Actually the block number changes when I rerun the fsck, however there
are no syslog   entries abot drive problems. So probably the "hardware
problem" is in fact a device mapper problem, right?

Sincerely,
Joachim


