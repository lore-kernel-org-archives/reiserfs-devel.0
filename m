From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Thu, 9 Apr 2009 23:07:28 +0200
Message-ID: <20090409210728.GA11407@elte.hu>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> <87tz4x97uq.fsf@basil.nowhere.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87tz4x97uq.fsf@basil.nowhere.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>


* Andi Kleen <andi@firstfloor.org> wrote:

> > After this patch, reiserfs suffers from a slight performance 
> > regression (for now).
> 
> That might be related to the scheduling behaviour. Watch the 
> reschedule counters in vmstat 1

FYI, Frederic is one of the main upstream tracing developers, and i 
can assure you that when working on scalability he watches something 
far more sophisticated than "vmstat 1" ;-)

See the commit below for example.

Thanks,

	Ingo

--------------------->
From 8f350bb74293dded6c51870c34a74645b054caba Mon Sep 17 00:00:00 2001
From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Mon, 6 Apr 2009 01:49:33 +0200
Subject: [PATCH] tracing/lockdep: report the time waited for a lock

While trying to optimize the new lock on reiserfs to replace
the bkl, I find the lock tracing very useful though it lacks
something important for performance (and latency) instrumentation:
the time a task waits for a lock.

That's what this patch implements:

  bash-4816  [000]   202.652815: lock_contended: lock_contended: &sb->s_type->i_mutex_key
  bash-4816  [000]   202.652819: lock_acquired: &rq->lock (0.000 us)
 <...>-4787  [000]   202.652825: lock_acquired: &rq->lock (0.000 us)
 <...>-4787  [000]   202.652829: lock_acquired: &rq->lock (0.000 us)
  bash-4816  [000]   202.652833: lock_acquired: &sb->s_type->i_mutex_key (16.005 us)

As shown above, the "lock acquired" field is followed by the time
it has been waiting for the lock. Usually, a lock contended entry
is followed by a near lock_acquired entry with a non-zero time waited.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Acked-by: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
LKML-Reference: <1238975373-15739-1-git-send-email-fweisbec@gmail.com>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 include/trace/lockdep_event_types.h |   23 ++++++++++++++++++-----
 kernel/lockdep.c                    |    8 ++++----
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/include/trace/lockdep_event_types.h b/include/trace/lockdep_event_types.h
index adccfcd..863f1e4 100644
--- a/include/trace/lockdep_event_types.h
+++ b/include/trace/lockdep_event_types.h
@@ -32,11 +32,24 @@ TRACE_FORMAT(lock_contended,
 	TP_FMT("%s", lock->name)
 	);
 
-TRACE_FORMAT(lock_acquired,
-	TP_PROTO(struct lockdep_map *lock, unsigned long ip),
-	TP_ARGS(lock, ip),
-	TP_FMT("%s", lock->name)
-	);
+TRACE_EVENT(lock_acquired,
+	TP_PROTO(struct lockdep_map *lock, unsigned long ip, s64 waittime),
+
+	TP_ARGS(lock, ip, waittime),
+
+	TP_STRUCT__entry(
+		__field(const char *, name)
+		__field(unsigned long, wait_usec)
+		__field(unsigned long, wait_nsec_rem)
+	),
+	TP_fast_assign(
+		__entry->name = lock->name;
+		__entry->wait_nsec_rem = do_div(waittime, NSEC_PER_USEC);
+		__entry->wait_usec = (unsigned long) waittime;
+	),
+	TP_printk("%s (%lu.%03lu us)", __entry->name, __entry->wait_usec,
+				       __entry->wait_nsec_rem)
+);
 
 #endif
 #endif
diff --git a/kernel/lockdep.c b/kernel/lockdep.c
index b0f0118..c4582a6 100644
--- a/kernel/lockdep.c
+++ b/kernel/lockdep.c
@@ -3061,6 +3061,8 @@ found_it:
 	put_lock_stats(stats);
 }
 
+DEFINE_TRACE(lock_acquired);
+
 static void
 __lock_acquired(struct lockdep_map *lock, unsigned long ip)
 {
@@ -3099,6 +3101,8 @@ found_it:
 		hlock->holdtime_stamp = now;
 	}
 
+	trace_lock_acquired(lock, ip, waittime);
+
 	stats = get_lock_stats(hlock_class(hlock));
 	if (waittime) {
 		if (hlock->read)
@@ -3137,14 +3141,10 @@ void lock_contended(struct lockdep_map *lock, unsigned long ip)
 }
 EXPORT_SYMBOL_GPL(lock_contended);
 
-DEFINE_TRACE(lock_acquired);
-
 void lock_acquired(struct lockdep_map *lock, unsigned long ip)
 {
 	unsigned long flags;
 
-	trace_lock_acquired(lock, ip);
-
 	if (unlikely(!lock_stat))
 		return;
 
