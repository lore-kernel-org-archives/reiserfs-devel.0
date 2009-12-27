From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14899] New: reiserfs: inconsistent lock state
Date: Sun, 27 Dec 2009 23:18:45 GMT
Message-ID: <bug-14899-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14899

           Summary: reiserfs: inconsistent lock state
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.33-rc1
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: rjw@sisk.pl
            Blocks: 14885
        Regression: Yes


Subject    : 2.6.33-rc0: reiserfs: inconsistent lock state
Submitter  : Alexander Beregalov <a.beregalov@gmail.com>
Date       : 2009-12-11 22:06
References : http://marc.info/?l=linux-kernel&m=126056920702515&w=4
Handled-By : Frederic Weisbecker <fweisbec@gmail.com>
Patch      : http://patchwork.kernel.org/patch/67256/
Patch      : http://patchwork.kernel.org/patch/67257/

This entry is being used for tracking a regression from 2.6.32.  Please don't
close it until the problem is fixed in the mainline.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
