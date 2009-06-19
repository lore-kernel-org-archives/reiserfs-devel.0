From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13579] New: 2.6.13-15.12-default sudden crash in ReiserFS
Date: Fri, 19 Jun 2009 08:27:18 GMT
Message-ID: <bug-13579-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13579

           Summary: 2.6.13-15.12-default sudden crash in ReiserFS
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.13-15.12-default
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: wharms@bfs.de
        Regression: No


NOTE:
the system im question was working for years reliable. An investigation of the
hardeare after the last crash could not find the reason of the crash. perhaps
someone can relate it an other problem. We are using SUSE LINUX 10.0.

The ReiserFS driver crashes for no obvious reason. a restart "solves" the
problem. a subsequent fsck does not show any serious problems.

After the crash the system is still working as expected (but of FS access of
cause).

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
