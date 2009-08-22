From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Sat, 22 Aug 2009 08:53:19 GMT
Message-ID: <200908220853.n7M8rJPj007612@demeter.kernel.org>
References: <bug-13536-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13536-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13536





--- Comment #20 from Roland Kletzing <devzero@web.de>  2009-08-22 08:53:16 ---
Elmar, could you confirm if mount option "data=journal" is triggering your
problem and if this patch: http://bugzilla.kernel.org/attachment.cgi?id=22800 
is fixing it ?  you can otherwise try .31-rc7 kernel, which already has this
patch included.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
