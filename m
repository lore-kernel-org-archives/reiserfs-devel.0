From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Another bug in commiting old transactions
Date: Wed, 15 Sep 2004 16:34:17 -0500
Message-ID: <d68fdf7d040915143410fe965f@mail.gmail.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21793-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mason@suse.com, reiserfs-list@namesys.com
Cc: vijayan@cs.wisc.edu

Hi,

This is in continuation to my previous mail on bug in
reiserfs_journal_commit_thread().

Previous bug:
---------------
There is an "if" condition in reiserfs_journal_commit_thread():

if (CURRENT_TIME - last_run > 5) {
  reiserfs_flush_old_commits(s);
}

that must be changed to

if (CURRENT_TIME - last_run >= 5) {
  reiserfs_flush_old_commits(s);
}

New bug:
----------
Even after changing the above "if" condition to use ">=" instead of
">", dirty old data were not being flushed by the file system. The
reason for this in reiserfs_flush_old_commits() function.

There is a safety check in reiserfs_flush_old_commits(). It looks like:

/* safety check so we don't flush while we are replaying the log during
 * mount
 */
if (list_empty(&SB_JOURNAL(p_s_sb)->j_journal_list)) {
  return 0  ;
}

This condition was added so that the reiserfs doesn't flush dirty data
while replaying during mount.

But the first transaction after the mount does NOT get flushed to the
disk because of this condition. The first transaction gets added to
the j_journal_list only in function do_journal_end(). So, until that
point the j_journal_list remains empty.

Fix:
----
Actually, we don't need this condition at all.
reiserfs_flush_old_commits() function will be called only ONLY by the
reiserfs_journal_commit_thread. And this thread is created only after
the replay is over (in journal_init() function). So, I thought even
removing this condition would not affect the system in any way.

Chris: Any comments on this fix ? If you think it is ok, can you
please add this also to your patch ?

I appreciate your help.

Vijayan
