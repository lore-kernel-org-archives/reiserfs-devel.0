From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13876] New: [x86_32, 2.6.30, reiserfs, reiser3, bug,
 regression] kernel oopsed while Sarg was running
Date: Thu, 30 Jul 2009 11:36:32 GMT
Message-ID: <bug-13876-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13876

           Summary: [x86_32, 2.6.30, reiserfs, reiser3, bug, regression]
                    kernel oopsed while Sarg was running
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.30
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: for.poige+bugzilla.kernel.org@gmail.com
        Regression: Yes


Created an attachment (id=22537)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=22537)
partial dmesg output

(Sarg is Squid statistic analyzer, giving quite valuable both disk and CPU
load.)

dmesg is in the attachment. Unfortunately, it's not complete cause the kernel's
failure made it impossible to log in to the comp where it occurred. Possibly,
it completely remains in the system log files, and I hope since the comp will
get rebooted (it's a remote one for me), I'll be able to find the logs and rest
of the filesystem... ergh... intact.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
