From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Fix of quota deadlock on pagelock
Date: Fri, 19 Nov 2004 10:55:16 +0100
Message-ID: <20041119095515.GD15189@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@osdl.org
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

  Hello!

  The four patches in the next mails fix deadlocks with quotas of
pagelock (the problem was lock inversion on PageLock and transaction
start - quota code needed to first start a transaction and then write
the data which subsequently needed acquisition of PageLock while the
standard ordering - PageLock first and transaction start later - was
used e.g. by pdflush). They implement a new way of quota access to disk:
Every filesystem that would like to implement quotas now has to provide
quota_read() and quota_write() functions. These functions must obey
quota lock ordering (in particular they should not take PageLock inside
a transaction).
  The first patch implements the changes in the quota core, the other
three patches implement needed functions in ext2, ext3 and reiserfs.
The patch for reiserfs also fixes several other lock inversion problems
(similar as ext3 had) and implements the journaled quota functionality
(which comes almost for free after the locking fixes...).
  The quota core patch makes quota support in other filesystems (except
XFS which implements everything on its own ;)) unfunctional (quotaon()
will refuse to turn on quotas on them). When the patches get reasonable
wide testing and it will seem that no major changes will be needed I
can make fixes also for the other filesystems (JFS, UDF, UFS).
  Could you Andrew merge the patches in the -mm tree for testing please?
The patch for reiserfs was not yet checked by any reiserfs maintainer so
I'm not sure about the policy here...
  Any comments are welcome.

								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs
