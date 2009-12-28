From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14916] New: jnode_page(node) != NULL
Date: Mon, 28 Dec 2009 14:37:15 GMT
Message-ID: <bug-14916-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14916

           Summary: jnode_page(node) != NULL
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


Using several hard resets, I ran into "jnode_page(node) != NULL" asserts
(causing kernel panics). These panics happen when some file is read (often a
GNOME file needed for startup).

"fsck.reiser4 --fix" was always able to fix it, but the fs shouldn't get into
such a state in the first place.

I'm afraid I don't have a way to reproduce.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
