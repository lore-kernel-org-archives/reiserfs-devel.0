From: Jan Kara <jack@suse.cz>
Subject: [GIT PULL] Reiserfs fixes for 3.10
Date: Fri, 31 May 2013 23:18:39 +0200
Message-ID: <20130531211839.GB3370@quack.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: reiserfs-devel@vger.kernel.org

  Hello Linus,

  could you please pull from

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_linus

to get three reiserfs fixes. They fix real problems spotted by users so I
hope they are ok even at this stage.

Top of the tree is a1457c0. The full shortlog is:

Jeff Mahoney (3):
      reiserfs: fix spurious multiple-fill in reiserfs_readdir_dentry
      reiserfs: fix problems with chowning setuid file w/ xattrs
      reiserfs: fix deadlock with nfs racing on create/lookup

The diffstat is

 fs/reiserfs/dir.c       |  2 ++
 fs/reiserfs/inode.c     |  9 +++++++--
 fs/reiserfs/xattr.c     | 14 +++++++++++++-
 fs/reiserfs/xattr_acl.c |  3 +++
 4 files changed, 25 insertions(+), 3 deletions(-)

							Thanks
								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
