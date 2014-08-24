From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 83121] New: silent data corruption
Date: Sun, 24 Aug 2014 13:03:41 +0000
Message-ID: <bug-83121-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=83121

            Bug ID: 83121
           Summary: silent data corruption
           Product: File System
           Version: 2.5
    Kernel Version: 3.16.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: spike@ml.yaroslavl.ru
        Regression: No

In 3.16.1 kernel corrupt files in reiserfs filesystem. Data in changed files
truncated or have garbage at front. Filesystem is clean and reiserfsck found
nothing.

kernel 3.16.0 working without data loss.
kernel 3.16.1 also working on SSD drive but corrupt data on hard drive.

Data corruption detected by gentoo portage system. /usr/portage live in
reiserfs partition and updated files have incorrect checksum.

-- 
You are receiving this mail because:
You are the assignee for the bug.
