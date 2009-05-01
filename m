From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements, faster than Bkl based scheme
Date: Fri,  1 May 2009 04:44:16 +0200
Message-ID: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=8loj4sOQA92EeKO1vfYmEDF+6OCoNAle87tHMa5hsc8=;
        b=s2KX9Rzk7818YM7VPK+fjZ798EgNYv9KPNmlV8f3yVnE8oS7ih0Qk+mWbt6OYWw2Eb
         VD3lMLKgixsguxIJG4hPwscYOoi7F2dtCSr0HV4+7WVI681VewJcsuuxfoh7XPekhgkX
         +QolWonwxF6BG9tx33LmoiIbYEsDX7Sw21wOU=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

Hi,

This reiserfs patchset applies against latest tip:core/kill-the-BKL
It adds various explicit write lock releases on specific sleeping sections.

A performance test with dbench on UP with 100 processus during 100 seconds
gives the following results:

Locking		  Throughput 

Bkl:              11.2587 MB/s
Write lock/Mutex: 12.5713 MB/s

So the new locking scheme makes it 11% faster than with the bkl.

It's not possible to compare it on the kill-the-BKL tree because the Bkl
is not anymore a Bkl inside but a plain Mutex.

Instead, you can apply the following equivalent patch against -rc3 to test it:
http://www.kernel.org/pub/linux/kernel/people/frederic/reiserfs-kill-the-bkl-full.patch

Of course it might eat your data, make you cows produce black milk, bring coffee
to your children at 3:00 am, turn the teletubbies song in your mind for
seven years long and so...

Frederic.

The following changes since commit a3a2b793d18bc068b79508e96eba33ae2326f759:
  Alessio Igor Bogani (1):
        remove the BKL: remove "BKL auto-drop" assumption from ext3_remount()

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git bkl

Frederic Weisbecker (6):
      kill-the-BKL/reiserfs: release write lock on fs_changed()
      kill-the-BKL/reiserfs: release the write lock before rescheduling on do_journal_end()
      kill-the-BKL/reiserfs: release write lock while rescheduling on prepare_for_delete_or_cut()
      kill-the-BKL/reiserfs: release the write lock inside get_neighbors()
      kill-the-BKL/reiserfs: release the write lock inside reiserfs_read_bitmap_block()
      kill-the-BKL/reiserfs: release the write lock on flush_commit_list()

 fs/reiserfs/bitmap.c        |    2 ++
 fs/reiserfs/fix_node.c      |    4 ++++
 fs/reiserfs/journal.c       |    9 +++++++--
 fs/reiserfs/stree.c         |    2 ++
 include/linux/reiserfs_fs.h |    8 +++++++-
 5 files changed, 22 insertions(+), 3 deletions(-)
