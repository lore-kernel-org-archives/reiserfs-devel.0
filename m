From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sun, 21 Aug 2011 14:11:23 GMT
Message-ID: <201108211411.p7LEBNna031787@demeter1.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162





--- Comment #36 from Frederic Weisbecker <fweisbec@gmail.com>  2011-08-21 14:11:20 ---
Can you still reproduce under a bound amount of time? Like two days or so?

If so, as I remember you told me your mount options are:
"rw,nosuid,nodev,relatime,user_xattr,acl", can you test without acl for several
days, enough to usually reproduce it, and tell us if you can still see the bug?
If so it may be nice to retry the same experience with user_xattr.

Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
