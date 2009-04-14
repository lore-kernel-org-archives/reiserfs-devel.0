From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 0/3] kill-the-BKL/reiserfs: reiserfs fixes
Date: Tue, 14 Apr 2009 12:00:13 +0200
Message-ID: <20090414100013.GE3558@elte.hu>
References: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Alessio Igor Bogani <abogani@texware.it>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Chris Mason <chris.mason@oracle.com>


* Frederic Weisbecker <fweisbec@gmail.com> wrote:

> Ingo,
> 
> This small patchset fixes some deadlocks I've faced after trying 
> some pressures with dbench on a reiserfs partition.
> 
> There is still some work pending such as adding some checks to 
> ensure we _always_ release the lock before sleeping, as you 
> suggested. Also I have to fix a lockdep warning reported by 
> Alessio Igor Bogani. And also some optimizations....
> 
> Thanks,
> Frederic.
> 
> Frederic Weisbecker (3):
>   kill-the-BKL/reiserfs: provide a tool to lock only once the write lock
>   kill-the-BKL/reiserfs: lock only once in reiserfs_truncate_file
>   kill-the-BKL/reiserfs: only acquire the write lock once in
>     reiserfs_dirty_inode
> 
>  fs/reiserfs/inode.c         |   10 +++++++---
>  fs/reiserfs/lock.c          |   26 ++++++++++++++++++++++++++
>  fs/reiserfs/super.c         |   15 +++++++++------
>  include/linux/reiserfs_fs.h |    2 ++
>  4 files changed, 44 insertions(+), 9 deletions(-)

Applied, thanks Frederic!

	Ingo
