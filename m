From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH] kill-the-bkl/reiserfs: update
Date: Thu, 14 May 2009 04:00:48 +0200
Message-ID: <1242266449-21121-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=F/DkFSDVTGireHH6C/QIk5PgZexBB2jTFQYWEPSYMX8=;
        b=b7w3oyIg1dSmn2GY+RLn6QgIUc3/JpM1RDO06M/biz72iTWXMw8gfATHR21X08JTya
         P6ZPMjJOSHo51mcYQeDwi8WR7b0aro/ylOaWBbs3SAa4bggnqNv8kU/bGUdhnf/2c97E
         auz9vqWtr/DoMaoBAT0v25TTnR3QxNcB8Kpf8=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>

Hi,

Here is a new patch which increases the performances with
reiserfs using a mutex instead of the bkl.

Now I've compared with dbench on a fresh and empty reiserfs
partition with 64 GB and the results are better with the mutex than with
the bkl.

Also this new patch increases the throughput a bit more.
Dbench on SMP (2 Cpus), Preempt and 100 threads during 400 seconds:

Bkl:		          37.6764 MB/sec
Mutex, before this patch: 39.4532 MB/sec
Mutex, after this patch:  40.3758 MB/sec

The following graph shows better the difference:
http://kernel.org/pub/linux/kernel/people/frederic/dbench.pdf

So it looks like on some cases, it is faster (fresh filesystem ?)
and sometimes slower (filesystem already well filled ?).

Of course it is also supposed to be faster on parallel multiple partitions
accesses but I have no benchmark yet to show that.

The following changes since commit 2989c5541d5ab1138e538f8c713f491f7b2416b1:
  Frederic Weisbecker (1):
        kill-the-bkl/reiserfs: use mutex_lock in reiserfs_mutex_lock_safe

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
	kill-the-bkl/reiserfs

Frederic Weisbecker (1):
      kill-the-bkl/reiserfs: unlock only when needed in search_by_key

 fs/reiserfs/stree.c |   42 ++++++++++++++++++++++++++++++++++--------
 1 files changed, 34 insertions(+), 8 deletions(-)
