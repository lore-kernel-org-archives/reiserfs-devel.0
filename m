From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 0/2] kill-the-bkl/reiserfs: rebase against -rc6, fixes
Date: Sat, 16 May 2009 20:02:00 +0200
Message-ID: <1242496922-6330-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=xeMEcRBR3wpzkm8JAMjOWpsMqEc1caHvG3mvWlb3NT0=;
        b=B8B09azKzXyOs0ccDHJsFhjTQoAWALIOPzmyubqjb6TkxzxqN7ABTDLU07OgK1vtIh
         RKCb7pC/vKYTjSNmG3pq9QWuwZ6OhIewhQbLXXG6+Rp677jW4TJGLdoa0bLJv8ZyHzRH
         TqUqWHgq5SNO7dZ11Me3nlJ5FZNyXQjFIwGNE=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Al, Stephen,

This patchset is subsequent to a rebase of the bkl killing in reiserfs
work rebased against -rc6. It contains only fixes.
The old topic is left unchanged but the new one reiserfs/kill-bkl-rc6 can
be pulled against -rc6 without problem.

Also, Al, I don't know if you would still accept to apply this work in the VFS
tree.
The fact is that it becomes late in the process, we are already in -rc6
and I would like it to be tested at least in linux-next.

So, it's up to you. Whether you prefer to apply it and make it
available to next, or I can ask Stephen to pull directly from my tree.

Thanks,
Frederic.

The following changes since commit b693ba70c541a5a26eb4e8f2db5ade454afe1c74:
  Frederic Weisbecker (1):
        kill-the-bkl/reiserfs: unlock only when needed in search_by_key

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
	reiserfs/kill-bkl-rc6

Frederic Weisbecker (2):
      kill-the-bkl/reiserfs: acquire the inode mutex safely
      kill-the-bkl/reiserfs: move the concurrent tree accesses checks per superblock

 fs/reiserfs/do_balan.c         |   17 +++++------------
 fs/reiserfs/fix_node.c         |    5 +----
 fs/reiserfs/journal.c          |   34 ----------------------------------
 fs/reiserfs/prints.c           |    4 ----
 fs/reiserfs/stree.c            |    5 +----
 fs/reiserfs/xattr.c            |    4 ++--
 include/linux/reiserfs_fs.h    |   35 +++++++++++++++++++++++++++++++++++
 include/linux/reiserfs_fs_sb.h |   11 +++++++++++
 8 files changed, 55 insertions(+), 60 deletions(-)
