From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13321] New: kernel crash with NULL pointer when boot
Date: Sat, 16 May 2009 12:37:39 GMT
Message-ID: <bug-13321-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13321

           Summary: kernel crash with NULL pointer when boot
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.30-rc6
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: mrb74@gmx.at
        Regression: Yes


When booting the system with reiserfs as root it crashes with a NULL pointer
(see attachement). Last "working" kernel was 2.6.30-rc5 (which had a regression
with xattrs).

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
