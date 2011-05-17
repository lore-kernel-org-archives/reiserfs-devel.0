From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 17 May 2011 13:15:56 GMT
Message-ID: <201105171315.p4HDFuF0010403@demeter2.kernel.org>
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





--- Comment #15 from Frederic Weisbecker <fweisbec@gmail.com>  2011-05-17 13:15:51 ---
Ok, good to know.

Well it's fairly possible that 2.6.38 got some patch that lowered the
likeliness
of this to happen. In any case I still need to find a way to reproduce that.

I've been unable to trigger the issue again. I'm going to use some stress test
tools like xfstools or so and see if that can trigger the thing faster.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
