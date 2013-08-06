From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 0/2] reiserfs locking patchset (v2)
Date: Mon, 05 Aug 2013 20:12:16 -0400
Message-ID: <20130806001216.080404663@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: jack@suse.com

This patchset untangles some of the locking in reiserfs.

- We push the write lock out of the xattr code. It doesn't need it and
  we can simplify locking by releasing and reacquiring the locks around
  the xattr calls. This version fixes the double unlock that snuck into
  my original post.

- Handle nested locks properly. There's confusion on when a lock is nested,
  when it's not, and how to drop it across schedules like the BKL it is
  modeled after. We make the distinction between taking/releasing the lock
  and when to drop it for schedules and simplify the logic. This fixes
  a number of deadlocks that happen because the intention was to drop
  the write lock but it really only decremented the use count.

- Fix the deadlocks with the quota code. This involves dropping the write
  lock before quota calls and reacquring it afterwards. Without this patch
  reiserfs quotas are essentially unusable.

Jan - This series is in the for-3.12 branch of
git.kernel.org:/pub/scm/linux/kernel/git/jeffm/linux-reiserfs.git

Thanks.

-Jeff

-- 
Jeff Mahoney
SuSE Labs

