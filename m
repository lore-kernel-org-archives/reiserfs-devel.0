From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 0/4] kill-the-bkl/reiserfs: fix some lock dependency inversions
Date: Tue, 25 Aug 2009 04:32:46 +0200
Message-ID: <1251167570-5233-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:to;
        bh=QzUhebERIe2G5UBPXPb6ysT+3tVQ9At4I6f344obqI8=;
        b=m86zTQTX4x8RZ9hu11XzUk9QkaVlyaMs6YE8UIhblhftgSX/iAcQDSIiTLZ6/bgalM
         qq7OvPCf+5sBGAw6Yh/yk+nocB6Xmp/BuXwWzGon9No/fPQaNemKMtLeSOrJWl62YrzL
         ZfFXoSYVwttWHaWk2oMPnGd7ApR70W1btLBrI=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, Jeff Mahoney <jeffm@suse.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>, Laurent Riffard <laurent.riffard@free.fr>

Hi,

This small set fixes some lock dependency inversions found in reiserfs
xattr and mmap paths.
I guess there are still some of them that I'll have to hunt, especially one
reported by Laurent Riffard and another one introduced by the reiserfs_readdir
path optimization (though I'm not sure about the latter, I have yet to find a
way to reproduce it properly).

As usual, these patches can be found at:

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git \
	reiserfs/kill-bkl

Thanks,
Frederic.

Frederic Weisbecker (4):
  kill-the-bkl/reiserfs: fix "reiserfs lock" / "inode mutex" lock
    inversion dependency
  kill-the-bkl/reiserfs: fix recursive reiserfs lock in
    reiserfs_mkdir()
  kill-the-bkl/reiserfs: fix recursive reiserfs write lock in
    reiserfs_commit_write()
  kill-the-bkl/reiserfs: panic in case of lock imbalance

 fs/reiserfs/inode.c |   11 ++---------
 fs/reiserfs/lock.c  |    7 +++----
 fs/reiserfs/namei.c |    7 ++++---
 fs/reiserfs/xattr.c |    2 +-
 4 files changed, 10 insertions(+), 17 deletions(-)


