From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 0/3] kill-the-BKL/reiserfs: reiserfs fixes
Date: Tue, 14 Apr 2009 05:34:22 +0200
Message-ID: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754042AbZDNDem@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=dgQRaXlJftAdx20jge1/6DM18fY/eQQxh3ST1zF3590=;
        b=orNxSHDYTcFu/euA6Axcs3C1NniQbzwMMW2Bfs4ficir4yEXwtlRo3okgGiQJE2eKW
         p5ZHI398hj+m37102EtXRcvVqOmd+LuXjAU27KANpNvuHeaUab0wdNma1DIRsjaU0WQE
         ZCc3GltaeO7N/RNnaiHa6r/Q3Gzbxqa32m3tI=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Chris Mason <chris.mason@oracle.com>

Ingo,

This small patchset fixes some deadlocks I've faced after trying
some pressures with dbench on a reiserfs partition.

There is still some work pending such as adding some checks to ensure we
_always_ release the lock before sleeping, as you suggested.
Also I have to fix a lockdep warning reported by Alessio Igor Bogani.
And also some optimizations....

Thanks,
Frederic.

Frederic Weisbecker (3):
  kill-the-BKL/reiserfs: provide a tool to lock only once the write lock
  kill-the-BKL/reiserfs: lock only once in reiserfs_truncate_file
  kill-the-BKL/reiserfs: only acquire the write lock once in
    reiserfs_dirty_inode

 fs/reiserfs/inode.c         |   10 +++++++---
 fs/reiserfs/lock.c          |   26 ++++++++++++++++++++++++++
 fs/reiserfs/super.c         |   15 +++++++++------
 include/linux/reiserfs_fs.h |    2 ++
 4 files changed, 44 insertions(+), 9 deletions(-)
