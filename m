From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 17 May 2011 07:16:27 GMT
Message-ID: <201105170716.p4H7GRS2008465@demeter1.kernel.org>
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





--- Comment #13 from Maximilian Decker <burbon04@gmx.de>  2011-05-17 07:16:24 ---
well my openSuSE box running on 2.6.38.4 is up for 14 days now, usage is
everything between idle and stressed under quite different workloads. 
No crash so far. 

Suspicion arises that somehow the problem is either gone or at least much more
harder to reproduce on 2.6.38. It would be interesting why, though.

@Bastien - did you ever get to test on 2.6.38 ?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
