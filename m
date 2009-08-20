From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Thu, 20 Aug 2009 10:27:28 GMT
Message-ID: <200908201027.n7KARSe7000482@demeter.kernel.org>
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





--- Comment #19 from Roland Kletzing <devzero@web.de>  2009-08-20 10:27:25 ---
ok, thanks. seems smartmon/smartd has some weirdos or some disks report just
nonsense. let`s skip that temperature isssue for now....

Elmar, can we have your mount options for your reiser filesystems?

furthermore, can you try mounting with "noatime" to see if the problem also
happens if atime is disabled for appropriate filesystem ?

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
