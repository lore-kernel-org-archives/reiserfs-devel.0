From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: BUG in Reiserfs Journal Thread
Date: Wed, 15 Sep 2004 15:02:27 -0500
Message-ID: <d68fdf7d04091513021adcd9c7@mail.gmail.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mason@suse.com, reiserfs-list@namesys.com
Cc: reiser@namesys.com, vijayan@cs.wisc.edu

Dear Chris Mason,

I found a bug in Reiserfs journal thread. This bug is in function
reiserfs_journal_commit_thread().

I'm trying to measure the impact of journal thread on data flushes. I
changed the commit interval from the default of 5 seconds (this value
is hard coded in the function) to other different values. I found that
irrespective of changing the journal thread's timer value, the dirty
data was not getting flushed after the time out at the commit thread.

The reason for this is due to a bug in the code. The code looks like

while(1) {

  /*blah blah blah*/

  if (CURRENT_TIME - last_run > 5) {
    reiserfs_flush_old_commits(s);
  }

  /*blah blah blah*/

  interruptible_sleep_on_timeout(&reiserfs_commit_thread_wait, 5 * HZ) ;

  /*thread wakes up*/
}

If you see the code, the thread sleeps for 5 seconds. But after waking
up, it again checks the condition:

if (CURRENT_TIME - last_run > 5) {
   reiserfs_flush_old_commits(s);
}

Actually, the condition should be ">=" instead of ">". Since the
thread wakes up immediately after the timer expires, the condition
will never satisfy if it is ">".

Chris, can you please verify this and add the fix ?

I appreciate your help.

Vijayan
