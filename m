From: Oleg Drokin <green@namesys.com>
Subject: reiserfs patch for linux 2.2.20 released
Date: Wed, 10 Apr 2002 14:08:51 +0400
Message-ID: <20020410140851.A20253@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10007-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

   New reiserfs support patch for linux kernel version 2.2.20 is released.
   Several bugs were fixed and several bugfixes were backported from 2.4 kernel
   series.
   New patch version number is 3.5.35, you can download it at:
   ftp://ftp.namesys.com/pub/reiserfs-for-2.2/linux-2.2.20-reiserfs-3.5.35.diff.bz2
   incremental patch over version 3.5.34 is available at:
   ftp://ftp.namesys.com/pub/reiserfs-for-2.2/reiserfs-3.5.35-upgrade-patch.bz2

   Here are the releasenotes for new patch:

 - Included forgotten patch that made system crash if we do umount while sync.
 - Defeated a problem where newly created symlinks and dirs had zero size in
   blocks.
 - Defeated a problem where file tail erroneously tried to be read if attempt to
   read past the actual file contents was made.
 - Empty files with non zero blocks usage issue was fixed.
 - Patch by Chris Mason to avoid duplicate replay of last flushed transaction.
   (2.4 backport)
 - Patch to break infinite loop in journal_read() in a case when
   journal log area is completely filled with transactions. (2.4 backport)
 - Symlink-body length check was made against incorrect value, allowing for too
   long nodes to be inserted into tree. This might lead to obscure warnings
   in some cases. (2.4 backport)
 - Print nicer warning message is unfinished rebuild-tree operation was
   detected. (2.4 backport)
 - file's mtime was not updated on truncate, sometimes. (2.4 backport)
 - directory's atime were not updated on readdir (2.4 backport)
 - Fixed journal replaying isses if there was junk in the journal.
   As additional bonus, journal replay is now faster. (2.4 backport)
 - Do not run the commit thread 3 times per second, this is pure waste of CPU
   time. (2.4 backport)

Bye,
    Oleg
