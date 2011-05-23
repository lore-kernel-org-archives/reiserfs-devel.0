From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 23 May 2011 20:02:58 GMT
Message-ID: <201105232002.p4NK2w5d004260@demeter2.kernel.org>
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





--- Comment #25 from Maximilian Decker <burbon04@gmx.de>  2011-05-23 20:02:55 ---
Well I did *not* have the acl mount option set for the /home - partition, and
it crashed nevertheless. The data partition uses acl, however.
That bug is quite weird.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
