From: Ookhoi <ookhoi@humilis.net>
Subject: rfs4, 2.5.53: jnode_flush failed with err = -12
Date: Mon, 6 Jan 2003 12:22:17 +0100
Message-ID: <20030106122217.A19841@humilis>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Dear Developers and list readers,

First of all, a happy new year to all of you.

With kernel 2.5.53 and reiserfs4 snapshot of 24 Dec 2002 I get the
following error when I try to untar a file on it.

jnode_flush failed with err = -12

16 times.

then:

 reiser4[pdflush(5)]: jnode_flush (fs/reiser4/flush.c:1050)[jmacd-16739]:
WARNING: flush failed: -12

and 
jnode_flush failed with err = -12

two more times.


I make a bootfloppy with the 2.5.53 kernel and rfs4 compiled in (get an
insmod "Unknow symbol" error if compiled as module (balance_dirty_pages
IIRC).

Boot the system, up the network, wget scsi modules, libs and binaries,
insmod the scsi modules, fdisk the disk (one partition), mkfs it without
options, mount it, wget base2_2.tar from debian potato onto it (44M),
untar it and get the above messages.

The untar seems stuck and I can't get a prompt back (sash). sysrq works,
so I could get some info out of it if it is useful.

Please let me know if I should provide more info.
