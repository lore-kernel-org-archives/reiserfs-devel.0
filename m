From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sat, 11 May 2013 16:11:07 +0000 (UTC)
Message-ID: <20130511161107.8C85411FB04@bugzilla.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162





--- Comment #48 from Jeff Mahoney <jeffm@suse.com>  2013-05-11 16:11:06 ---
There are few misconceptions here about reiserfsck.

1) --rebuild-tree will not detect more problems than a --check will. It is the
biggest, heaviest hammer we have in order to recover a file system and should
not be used unless it absolutely must.

2) Only use --fix-fixable if you run into problems on the file system after
mounting. The reason is that reiserfsck --check doesn't handle save links,
which are placed in the file system when a file is truncated or removed while
the file is still open. A file system with unhandled save links will have stat
data that doesn't make sense right away and reiserfsck --check will suggest
--fix-fixable as a result. I spent some time yesterday looking into how to fix
this, but I'm not sure how to handle it gracefully WRT the
system/disk/reiserfsck crashing mid-execution since it will essentially be
operating directly on the file system without a journal for some fairly
involved operations. So, for now, try to mount first. It'll replay the journal
and clear the save links out.

---

I suspect that the root cause of these hangs is the reiserfs write lock not
being dropped completely across schedules the way Frederic expected. I have a
patch that makes the distinction between "dropping because we're done using it"
and "dropping because we're scheduling" but I need to clean it up. I'll post it
here tomorrow or Monday for testing.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
