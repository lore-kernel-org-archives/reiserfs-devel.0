From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14915] New: Reiser4 doesn't sync
Date: Mon, 28 Dec 2009 14:33:29 GMT
Message-ID: <bug-14915-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14915

           Summary: Reiser4 doesn't sync
           Product: File System
           Version: 2.5
    Kernel Version: 2009-12-10-17-19
          Platform: All
        OS/Version: Linux
              Tree: -mm
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Reiser4
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: buchner.johannes@gmx.at
        Regression: No


The current mm patches don't respect 'sync()'.
In particular, reiser4_sync_inodes in fs/reiser4/super_ops.c skips it, due to
NULL being handed over.

The skip was introduced by
http://userweb.kernel.org/~akpm/mmotm/broken-out/reiser4-fixed-null-pointer-dereference.patch
to mitigate a NULL dereference introduced by
http://userweb.kernel.org/~akpm/mmotm/broken-out/reiser4-vfs-add-super_operationssync_inodes-2.patch

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
