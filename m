From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14826] New: jdm-20002 reiserfs_xattr_get: Invalid hash for
 xattr
Date: Thu, 17 Dec 2009 09:00:22 GMT
Message-ID: <bug-14826-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14826

           Summary: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.32
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: lists@nerdbynature.de
        Regression: Yes


Note: this has been reported on reiserfs-devel by me as well:
http://www.spinics.net/lists/reiserfs-devel/msg02009.html


After upgrading to 2.6.32, the following messages appear in the logs:

REISERFS warning (device xvda3): jdm-20002 reiserfs_xattr_get: Invalid hash for
xattr
(user.{http:%2F%2Ftwistedmatrix.com%2Fxml_namespace%2Fdav%2F}getcontentmd5)
associated with [765 43775 0x0 SD]

The filesystem has been created a long time ago, the mountoptions haven't
changed either:

$ grep reiser /proc/mounts 
/dev/xvda3 /var reiserfs rw,nosuid,nodev,noexec,relatime,user_xattr,notail 0 0

So far, the messages are not flooding the logs but are triggered a few times a
day:

$ uptime
 09:32:48 up 2 days,  6:30, 10 users,  load average: 0.95, 0.31, 0.11
$ dmesg | grep -c jdm-20002
35

A full dmesg and the .config is available on:
http://nerdbynature.de/bits/2.6.33-git/jdm-20002/

Although cosmetical (right?) and and probably fixable by removing/resetting the
xattr flags, this should not happen.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
