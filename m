From: Jan Kara <jack@suse.cz>
Subject: [GIT PULL] Reiserfs fix for 3.9-rc6
Date: Wed, 3 Apr 2013 17:43:38 +0200
Message-ID: <20130403154338.GA17415@quack.suse.cz>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

  Hello Linus,

  could you please pull from

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_linus

to get a fix for reiserfs xattr bug exposed by changes to lookup_one_len().
Top of the tree is 35e5cbc. The full shortlog is:

Jan Kara (1):
      reiserfs: Fix warning and inode leak when deleting inode with xattrs

The diffstat is

 fs/reiserfs/xattr.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

							Thanks
								Honza

-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
