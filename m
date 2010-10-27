From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 21092] Kernel 2.6.36 Bug during quotaon on reiserfs
Date: Wed, 27 Oct 2010 21:55:30 GMT
Message-ID: <201010272155.o9RLtUqb021637@demeter2.kernel.org>
References: <bug-21092-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-21092-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=21092


Jan Kara <jack@suse.cz> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jack@suse.cz




--- Comment #1 from Jan Kara <jack@suse.cz>  2010-10-27 21:55:24 ---
This looks like a fallout of the BKL conversion in reiserfs. After the
conversion, it is expected that reiserfs_unpack will be called with write_lock
held but that's not the case for the call from reiserfs_quota_on.

The easiest is probably to just acquire write_lock before calling
reiserfs_unpack. The attached patch does this and don't see the BUG with it.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
