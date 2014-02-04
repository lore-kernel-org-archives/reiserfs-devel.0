From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 04 Feb 2014 20:20:44 +0000
Message-ID: <bug-29162-695-WtBzqNsXER@https.bugzilla.kernel.org/>
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

--- Comment #63 from D.K. <dkozlowski@sevone.com> ---
Attached are two logs one is the output from LOCKDEP showing all locks held on
a system. The second is the log showing all running tasks on the system when it
locked up.

-- 
You are receiving this mail because:
You are the assignee for the bug.
