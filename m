From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 0/3] reiserfs/kill-bkl: Ioctl path fixes and unlocked_ioctl conversion
Date: Thu, 15 Oct 2009 00:26:04 +0200
Message-ID: <1255559167-5554-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934087AbZJNW0u@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=sQKVOTRyRUsmEBbK5gFTZ2bsIyPi5XxF2D2yqUJY3js=;
        b=mKlUiF+B+JKJjoKgGo2ipzW/w1M06rabKD7Qou7kOI44voCsWONilikIeZqxgCrIEg
         I4lR2GTv6Nd+0Tv/orrUIAtjfik8s2lwa6f8jv8Ath2o1vv7EbeCe7/1yZXS3IL6sjxa
         KKb9s8ui5B86iX/cFv/yAoElujIBauUslzXF4=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, Jeff Mahoney <jeffm@suse.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>, Laurent Riffard <laurent.riffard@free.fr>

Hi,

This includes some fixes in the reiserfs ioctl path for the
reiserfs/kill-bkl tree.

As usual, any reviews or testings are very welcome.

Thanks,
Frederic.
---

The whole tree that drops the bkl from reiserfs 3 can be pulled from:

  git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
	reiserfs/kill-bkl

Frederic Weisbecker (3):
      kill-the-bkl/reiserfs: always lock the ioctl path
      kill-the-bkl/reiserfs: definitely drop the bkl from reiserfs_ioctl()
      kill-the-bkl/reiserfs: drop the fs race watchdog from _get_block_create_0()

 fs/reiserfs/dir.c           |    2 +-
 fs/reiserfs/file.c          |    2 +-
 fs/reiserfs/inode.c         |   11 +-----
 fs/reiserfs/ioctl.c         |   77 +++++++++++++++++++++++-------------------
 include/linux/reiserfs_fs.h |    3 +-
 5 files changed, 47 insertions(+), 48 deletions(-)
