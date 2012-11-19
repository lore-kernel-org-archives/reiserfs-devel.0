From: Jan Kara <jack@suse.cz>
Subject: [PULL] Reiserfs fixes and ext3 fix for 3.7-rc6
Date: Mon, 19 Nov 2012 21:53:47 +0100
Message-ID: <20121119205347.GE20532@quack.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

  Hello Linus,

  could you please pull from

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_linus

You will get fixes of reiserfs deadlocks when quotas are enabled (locking
there was completely busted by BKL conversion) and also one small ext3 fix
in the trim interface.

Top of the tree is ae49eee. The full shortlog is:

Jan Kara (4):
      reiserfs: Fix lock ordering during remount
      reiserfs: Protect reiserfs_quota_on() with write lock
      reiserfs: Protect reiserfs_quota_write() with write lock
      reiserfs: Move quota calls out of write lock

Lukas Czerner (1):
      ext3: Avoid underflow of in ext3_trim_fs()

The diffstat is

 fs/ext3/balloc.c    |    5 ++-
 fs/reiserfs/inode.c |   10 ++++++--
 fs/reiserfs/stree.c |    4 +++
 fs/reiserfs/super.c |   60
+++++++++++++++++++++++++++++++++++++++------------
 4 files changed, 60 insertions(+), 19 deletions(-)

							Thanks
								Honza


-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
