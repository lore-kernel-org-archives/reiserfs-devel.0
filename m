From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Fri, 20 Sep 2013 19:23:48 +0000
Message-ID: <bug-29162-695-NDnLGOB1AR@https.bugzilla.kernel.org/>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162

--- Comment #51 from Jeff Mahoney <jeffm@suse.com> ---
Anyone who has experienced this problem should re-test with 3.12-rc1 or later.
It has the locking fixes that should address the issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.
