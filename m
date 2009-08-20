From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13876] [x86_32, 2.6.30, reiserfs, reiser3, bug, regression]
 kernel oopsed while Sarg was running
Date: Thu, 20 Aug 2009 15:30:50 GMT
Message-ID: <200908201530.n7KFUoU7025025@demeter.kernel.org>
References: <bug-13876-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13876-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13876





--- Comment #4 from Roland Kletzing <devzero@web.de>  2009-08-20 15:30:50 ---
ah, we have possibly a duplicate here - see
http://bugzilla.kernel.org/show_bug.cgi?id=13556

can you try if mounting your reiserfs filesystems without data=journal fixes
the problem ?

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
