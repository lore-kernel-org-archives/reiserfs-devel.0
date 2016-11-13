From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 187561] New: Kernel Dump on Write-Access to when Kernel is
 compiled without Reiserfs-Extended-Attributes-Option
Date: Sun, 13 Nov 2016 22:03:54 +0000
Message-ID: <bug-187561-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=187561

            Bug ID: 187561
           Summary: Kernel Dump on Write-Access to when Kernel is compiled
                    without Reiserfs-Extended-Attributes-Option
           Product: File System
           Version: 2.5
    Kernel Version: 4.4.31
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: felix.wiedenroth@gmx.de
        Regression: No

When a custom-kernel is compiled with Reiserfs-Support and the Option "Reiserfs
Extended Attibutes is NOT chosen, the Kernel Crashes on Write-Access to the
Reiserfs-Filesystem. This happens when a Reiserfs is created with default
options using mkfs.reiserfs.

I observed this behaviour with Kernel-Versions 4.4.28 to 4.4.31. 

Works fine if extended-attributes are activated in the Kernel.

Problems is probably, that Kernel does not set / return default Values for the
Extended-Reiserfs-Attributes when option "Extended-Attributes" for Reiserfs is
not compiled in.

Regards,

Felix Wiedenroth

-- 
You are receiving this mail because:
You are the assignee for the bug.
