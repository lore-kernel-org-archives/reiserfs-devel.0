From: "Henning Westerholt" <henning-04@die.informatik.uni-siegen.de>
Subject: problems with reiserfs4
Date: Wed, 18 Feb 2004 23:27:17 +0100 (CET)
Message-ID: <47002.127.0.0.1.1077143237.squirrel@www.die.informatik.uni-siegen.de>
Reply-To: henning-04@die.informatik.uni-siegen.de
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

i'm using kernel 2.6.2 with the snapshot from 06.02, and set up a two
reiser4 partitions as build/ tmp dir for my system.

1.
Every few hours, or few days (depend on the system load), during the
compiling of projects like kde or gcc, i noticed many stat data error. Is
this a known issue?

I reported these errors on the list some time ago, but got no reply.
Please refer to
http://marc.theaimsgroup.com/?l=reiserfs&m=107619080428445&w=2
for excepts from the logfile and fsck output.


2.
Sometimes during the shutdown process, after the unmounting of the
partitions, i noticed the many of the following errors on the console:

Warning: flushing like mad: 2097152
reiser4[ktxnmgrd:run(2566):commit_current_atom(fs/reiser4/txnmgr.c: 
[nikita-3176]
...


Beside these two errors work this snapshot of reiser4 very stable for me,
the fsck could fix the mentioned errors.


Best regards,

Henning


