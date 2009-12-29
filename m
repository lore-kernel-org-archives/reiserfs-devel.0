From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14927] New: reiserfs: circular locking dependency detected
Date: Tue, 29 Dec 2009 00:31:43 GMT
Message-ID: <bug-14927-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14927

           Summary: reiserfs: circular locking dependency detected
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


Subject    : reiserfs: circular locking dependency detected
Submitter  : Christian Kujau <lists@nerdbynature.de>
Date       : 2009-12-24 11:26
References : http://marc.info/?l=linux-kernel&m=126165398604367&w=4

This entry is being used for tracking a regression from 2.6.32.  Please don't
close it until the problem is fixed in the mainline.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
