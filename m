From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 34362] New: Error-valued pointer dereferences
Date: Wed, 4 May 2011 12:46:16 GMT
Message-ID: <bug-34362-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=34362

           Summary: Error-valued pointer dereferences
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.38.3
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: crubio@cs.wisc.edu
        Regression: No


Created an attachment (id=56552)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=56552)
Sample traces describing error-valued pointer dereferences

We have statically analyzed ReiserFS, VFS and the memory management module to
find error-valued pointers that are dereferenced. We have found five potential
error-valued pointer dereferences:

fs/inode.c:1436: Dereferencing variable iput#inode, which may contain one of
the following error codes: ENOMEM* 

fs/reiserfs/super.c:249: Dereferencing variable finish_unfinished#inode, which
may contain one of the following error codes: ENOMEM* 

fs/reiserfs/super.c:259: Dereferencing variable finish_unfinished#inode, which
may contain one of the following error codes: ENOMEM* 

fs/reiserfs/super.c:279: Dereferencing variable finish_unfinished#inode, which
may contain one of the following error codes: ENOMEM* 

fs/super.c:205: Dereferencing variable deactivate_super#s, which may contain
one of the following error codes: ENOMEM* 


For each potential error-valued pointer dereference, our tool produces a
complete sample trace and the corresponding slice. The complete sample trace
illustrates how one error code may reach the program point at which the
variable is dereferenced. The slice summarizes the complete sample trace by
including only relevant program points at which the error code is transferred
from variable to variable or returned by a function. Sample traces and slices
are attached.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
