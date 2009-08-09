From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH] kill-the-bkl/reiserfs: fix early readdir offset increment
Date: Mon, 10 Aug 2009 01:27:36 +0200
Message-ID: <20090809232735.GC6089@nowhere>
References: <20090731174642.GA6539@nowhere> <20090801081141.GA18036@basil.fritz.box> <20090801155335.GA4836@nowhere> <20090802142100.GA21160@elte.hu> <adatz0po5cn.fsf@cisco.com> <20090803132659.GC3570@think>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=7S22EIQPm5cMznnSAGwnfOuX+ba/T/9SHo2y/+lCK10=;
        b=eBSsSyJQAx/KXyVEtO7cO5ZiwPo9zFBqVQX1GCadsrepvSvN3/8YUTda3HR8HQ+8No
         UWjCQjkALASkI7fg7n60K6x4Ng1KK2LUdvDjfUmbP9ZqRoD2WXDdnTQkDP5fosaAsfJF
         A+dtm395sRMmZtf5prrbQqWMoovrVoICSuBAE=
Content-Disposition: inline
In-Reply-To: <20090803132659.GC3570@think>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, Jeff

On Mon, Aug 03, 2009 at 09:26:59AM -0400, Chris Mason wrote:
> Definitely, the cost of the rare bug is much higher.  The good news is
> that reiserfs tends to pile its races into a few spots.  Most of them
> can be found with a 12 hour run of the namesys stress.sh program and a
> lot of memory pressure.  I'd compile with preemption on and you'll have
> a good test on any SMP machine.
> 
> http://oss.oracle.com/~mason/stress.sh
> 
> stress.sh just copies a source directory into the test filesystem, then
> reads it  back and deletes it in a loop.  I'd run with 50 procs and
> enough memory  pressure for the box to lightly swap (booting w/mem= is a
> fine way to make memory pressure).  This way you make sure to hammer on
> the metadata writeback paths, which is where all of the difficult races
> come in.
> 
> Testing with an fsx-linux process running at the same time will make
> sure all of the mmap/truncate paths are working correctly as well.
> 
> -chris
> 


Running this script has unearthed a bug introduced in my last commit.
This is fixed in the patch below.
Thanks for this script, I'm now running it very often, only on PREEMPT UP
for now.

---
From a22c48509ca7b54206c0616141278e5561f119ef Mon Sep 17 00:00:00 2001
From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Mon, 10 Aug 2009 00:53:45 +0200
Subject: [PATCH] kill-the-bkl/reiserfs: fix early readdir offset increment

The previous commit:
"kill-the-bkl/reiserfs: release the lock only for first entry in readdir"
brought a bug which increments the readdir offset even if we failed to
copy a directory entry through filldir.

Then if we are in the end of the user buffer, there are chances that
getdents() will be subsequently called with a new buffer to continue
fetching the directory. At this time the directory entry offset will
be wrong because it has omitted the previous entry that failed to copy.

We need to increment the directory offset after fetching an entry, not
before.

This fixes weird bugs in which a directory seems not empty whereas
it is.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
---
 fs/reiserfs/dir.c |   21 +++++++++++----------
 1 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/reiserfs/dir.c b/fs/reiserfs/dir.c
index d6fb8d3..d4477eb 100644
--- a/fs/reiserfs/dir.c
+++ b/fs/reiserfs/dir.c
@@ -195,12 +195,6 @@ int reiserfs_readdir_dentry(struct dentry *dentry, void *dirent,
 				*pos = d_off;
 				d_ino = deh_objectid(deh);
 
-				/*
-				 * next entry should be looked for with such
-				 * offset
-				 */
-				next_pos = deh_offset(deh) + 1;
-
 				if (first_entry) {
 					int fillret;
 
@@ -221,11 +215,18 @@ int reiserfs_readdir_dentry(struct dentry *dentry, void *dirent,
 
 					if (item_moved(&tmp_ih, &path_to_entry))
 						goto research;
-					continue;
-				}
-				if (filldir(dirent, d_name, d_reclen, d_off,
-					    d_ino, DT_UNKNOWN) < 0)
+				} else {
+					if (filldir(dirent, d_name, d_reclen,
+						  d_off, d_ino, DT_UNKNOWN) < 0)
 						goto end;
+				}
+
+				/*
+				 * next entry should be looked for with such
+				 * offset
+				 */
+				next_pos = deh_offset(deh) + 1;
+
 			}	/* for */
 		}
 
-- 
1.6.2.3


You can find this patch and the other in this series in the following git
tree:

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
	reiserfs/kill-bkl

Thanks.

