From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14656] New: Oops at __rmqueue+0x98 with 2.6.32-rc6
Date: Sat, 21 Nov 2009 14:42:42 GMT
Message-ID: <bug-14656-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14656

           Summary: Oops at __rmqueue+0x98 with 2.6.32-rc6
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.32-rc6
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: rjw@sisk.pl
            Blocks: 14230
        Regression: Yes


Subject    : Oops with 2.6.32-rc6
Submitter  : "Lucas C. Villa Real" <lucasvr@gobolinux.org>
Date       : 2009-11-19 3:48
References : http://marc.info/?l=linux-kernel&m=125860255229092&w=4
Notify-Also : reiserfs-devel@vger.kernel.org

This entry is being used for tracking a regression from 2.6.31.  Please don't
close it until the problem is fixed in the mainline.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
