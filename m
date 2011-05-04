From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 34372] New: Error-valued pointer used in pointer arithmetic
Date: Wed, 4 May 2011 12:55:48 GMT
Message-ID: <bug-34372-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=34372

           Summary: Error-valued pointer used in pointer arithmetic
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


We have statically analyzed ReiserFS, VFS and the memory management module to
find error-valued pointers that are used in pointer arithmetic. We have found
one instance: 

include/linux/reiserfs_fs.h:390: Using variable REISERFS_I#__mptr in pointer
arithmetic, which may contain one of the following error codes: ENOMEM*

Here is a sample trace that illustrates how this might happen:

Complete sample trace
=====================
include/linux/err.h:24: an unchecked error may be returned
fs/reiserfs/inode.c:1515:"cabs2cil_" receives an error from function "ERR_PTR"
fs/reiserfs/inode.c:1515:"tmp___11" receives an error from "cabs2cil_"
fs/reiserfs/inode.c:1515:"tmp___11" may have an unchecked error
fs/reiserfs/inode.c:1515:"tmp" receives an error from "tmp___11"
fs/reiserfs/inode.c:1515:"tmp" may have an unchecked error
fs/reiserfs/inode.c:1515:"tmp___7" receives an error from "tmp"
fs/reiserfs/inode.c:1515:"tmp___7" may have an unchecked error
fs/reiserfs/inode.c:1515: an unchecked error may be returned
fs/reiserfs/super.c:239:"inode" receives an error from function "reiserfs_iget"
fs/reiserfs/super.c:240:"inode" may have an unchecked error
fs/reiserfs/super.c:249:"inode" may have an unchecked error
fs/reiserfs/super.c:257:"inode" may have an unchecked error
fs/reiserfs/super.c:259:"inode" may have an unchecked error
fs/reiserfs/super.c:274:"inode" may have an unchecked error
fs/reiserfs/super.c:287:"inode" may have an unchecked error
fs/reiserfs/super.c:289:"inode" may have an unchecked error
fs/reiserfs/super.c:290:"inode" may have an unchecked error
fs/reiserfs/super.c:292:"inode" may have an unchecked error
include/linux/reiserfs_fs.h:390:"__mptr" receives an error from "inode"
include/linux/reiserfs_fs.h:390:"__mptr" may have an unchecked error
include/linux/reiserfs_fs.h:390: Using variable REISERFS_I#__mptr in pointer
arithmetic, which may contain one of the following error codes: ENOMEM* 

Slice (summary of the above sample trace only including relevant program
points)
=====
include/linux/err.h:24: an unchecked error may be returned
fs/reiserfs/inode.c:1515:"cabs2cil_" receives an error from function "ERR_PTR"
fs/reiserfs/inode.c:1515:"tmp___11" receives an error from "cabs2cil_"
fs/reiserfs/inode.c:1515:"tmp" receives an error from "tmp___11"
fs/reiserfs/inode.c:1515:"tmp___7" receives an error from "tmp"
fs/reiserfs/inode.c:1515: an unchecked error may be returned
fs/reiserfs/super.c:239:"inode" receives an error from function "reiserfs_iget"
fs/reiserfs/super.c:292:"inode" may have an unchecked error
include/linux/reiserfs_fs.h:390:"__mptr" receives an error from "inode"
include/linux/reiserfs_fs.h:390: Using variable REISERFS_I#__mptr in pointer
arithmetic, which may contain one of the following error codes: ENOMEM*

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
