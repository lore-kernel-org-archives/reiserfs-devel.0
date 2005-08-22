From: "Charles P. Wright" <cwright@cs.sunysb.edu>
Subject: Odd llseek semantics on directories
Date: Mon, 22 Aug 2005 11:01:44 -0400
Message-ID: <1124722904.25421.11.camel@polarbear.fsl.cs.sunysb.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25608-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Hello,

I've noticed that Reiser4's behavior deviates from other file systems
when seeking with directories.  After reading a directory, if you run
vfs_lseek(dir, 0, SEEK_CUR), then -ENOENT is returned.   This means that
you can't pass the identifier back to vfs_lseek with SEEK_SET.

Charles

