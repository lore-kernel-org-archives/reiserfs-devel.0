From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13556] Random oopses
Date: Thu, 20 Aug 2009 12:42:54 GMT
Message-ID: <200908201242.n7KCgsvS014472@demeter.kernel.org>
References: <bug-13556-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13556-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13556





--- Comment #5 from Michael Uleysky <uleysky@gmail.com>  2009-08-20 12:42:52 ---
I create another reiserfs filesystem and test it with different mount options.

rw,nosuid,nodev,relatime,data=journal    -   Crash
rw,nosuid,nodev,relatime                 -   Ok
rw,nodev,noatime                         -   Ok
rw,nodev,noatime,data=journal            -   Crash

So, problem, most probably, in data=journal option.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
