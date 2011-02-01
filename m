From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 27972] New: Null pointer dereference at shutdown time
Date: Tue, 1 Feb 2011 04:54:41 GMT
Message-ID: <bug-27972-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=27972

           Summary: Null pointer dereference at shutdown time
           Product: File System
           Version: 2.5
    Kernel Version: Linux pluto.afaics.de 2.6.37 #1 SMP PREEMPT Thu Jan 20
                    20:29:44 CET 2011 x86_64 GNU/Linux
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: harri@afaics.de
        Regression: No


Created an attachment (id=45722)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=45722)
screen snapshot

I got a kernel dump at umount time of a huge reiserfs partition. It said

    Null pointer dereference at 0000000000000010
    IP: [ffffffffa01dc818] open_xa_dir+0x2d/0x1b0 [reiserfs]
    :

The config file and a photo with a complete stack trace are attached.

reiserfsck of this partition showed a lot of files to sync due to the missing
umount, but no other problems.

Kernel is 2.6.37 (amd64). Please mail if I can help to track this
down.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
