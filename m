From: Jeffrey Mahoney <jeffm@novell.com>
Subject: [PATCH 0/5] reiserfs/selinux: patches to allow reiserfs and selinux to work together
Date: Sat, 20 Nov 2004 19:13:05 -0500
Message-ID: <20041121001305.GA979@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>


Hey all -

The following 5 patches allow reiserfs and selinux to work together.

01-selinux-load_policy.diff
  - Allows load_policy to fail and to not BUG on the second attempt.

02-selinux-private-inode.diff
  - Allows "private" inodes that aren't tracked by selinux xattrs

03-reiserfs-private-inode.diff
  - Abstracts the private inode implementation in reiserfs to a static inline

04-reiserfs-selinux.diff
  - Uses the selinux private inode implementation to allow reiserfs to mark
    inodes as private. Also works around the checks in vfs_rmdir.

05-reiserfs-const-fixes.diff
  - Cleans up warnings introduced by 04-reiserfs-selinux.diff


Take a look, I'm interested in feedback. 

-Jeff

-- 
Jeff Mahoney
SuSE Labs
