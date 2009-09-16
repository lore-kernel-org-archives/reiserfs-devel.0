From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 0/4] kill-the-bkl/reiserfs: fix some lock dependency
	inversions
Date: Wed, 16 Sep 2009 22:37:50 +0200
Message-ID: <20090916203747.GB5068@nowhere>
References: <1251167570-5233-1-git-send-email-fweisbec@gmail.com> <20090826201330.GA18761@orion> <20090914203749.GF6045@nowhere> <a4423d670909141433g18659aay6e177b1302e5b4a0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760033AbZIPUh7@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=Nuegu1fxpCjtmfzPXx3l0I74g9nKe8g8eHZbewQZWDA=;
        b=FiY784bi+Wf9zEgneKBpQSCjhRc6E4iKOJ4r767CVCFCBUAyBNZEsqtXqcahJpcE+Y
         +qHSIfJYFXRTyG46SXzwXAmYwrUdYH1b1eDoiLU6HuUYRvZ3XiRIc7AUfD8JrjXsT6Xf
         XSdb3vvwbO6jbURMfindm0hmzCl6xRR7S4kB0=
Content-Disposition: inline
In-Reply-To: <a4423d670909141433g18659aay6e177b1302e5b4a0@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Reiserfs <reiserfs-devel@vger.kernel.org>

On Tue, Sep 15, 2009 at 01:33:42AM +0400, Alexander Beregalov wrote:
> > Hi Alexander,
> >
> > It should be fixed now, still in the following tree:
> 
> Hi!
> Another one, similar:
> It is v2.6.31-3123-g99bc470 plus your 805031859(kill-the-bkl/reiserfs:
> panic in case of lock imbalance), UP.



Although I can't reproduce it, I think I see how that can happen.

On mount time, we have the following dependency:

reiserfs_lock -> bdev_mutex -> sysfs_mutex

which happens while calling journal_init_dev() because
we open the device there.

But also in case of mmap on a reiserfs filesystem we
may call reiserfs_readpages(), holding the reiserfs lock
while already holding mm->mmap_sem

The above dependency is then updated:

mmap_sem
     |
     |
     ------- reiserfs_lock -> bdev_mutex -> sysfs_mutex

And later, while doing a readdir() on a sysfs directory,
sysfs calls filldir, which might_fault, and then might grab
mmap_sem. filldir is called there while holding sys_mutex,
creating the new following dependency

sysfs_mutex -> mmap_sem

Hence the inversion.
It seems the deadlock can't ever happen, I even don't see
corner cases where it could happen.

But still, this dependency should disappear.

Could you please tell me if the following patch makes it shut down?

Otherwise, I may need your config. I don't know why, but I suspect
the lock_acquire(mmap_sem) in might_fault doesn't trigger needed the lockdep
check, although I have the appropriate debug config, at least it seems.
But anyway, it should also happen in my box but it doesn't...

Thanks!

The patch:

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index d23d6d7..59f7a4c 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2801,11 +2801,14 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
 		goto free_and_return;
 	}
 
+	reiserfs_write_unlock(sb);
 	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
 		reiserfs_warning(sb, "sh-462",
 				 "unable to initialize jornal device");
+		reiserfs_write_lock(sb);
 		goto free_and_return;
 	}
+	reiserfs_write_lock(sb);
 
 	rs = SB_DISK_SUPER_BLOCK(sb);
 
