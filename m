From: Nikita Danilov <Nikita@Namesys.COM>
Subject: reiser4 snapshot
Date: Mon, 11 Aug 2003 19:57:31 +0400
Message-ID: <16183.48363.884605.564937@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>
Cc: Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>

Hello,

new reiser4 snapshot is available at 

http://thebsh.namesys.com/snapshots/2003.08.11/

**********************************************************************
                              WARNING!!! 
                      This code is experimental! 
    WE ARE NOT KIDDING! DO NOT PUT ANY VALUABLE DATA ON REISER4 YET!
**********************************************************************

Lots of changes in this snapshot compared to previous one that was
release over half of year ago.  Everything should be better and more
stable I hope.

Snapshot is released as a patch against linux-2.6.0-test3.

REISER4_NOOPT config option (Disable compiler optimizations for reiser4
code.)  is known to not compile on x86.

The reiser4-kernelonly.diff file represents only required kernel
modifications if you plan to use our reiser4 bk repository. It does not
contains any reiser4 code

The reiser4.diff is full patch with everything included.

With this snapshot reiser4 supports different on-disk format by default,
so you should recreate your reiser4 file systems.

Nikita.

