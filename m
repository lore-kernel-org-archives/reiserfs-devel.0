From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 28 Mar 2011 09:33:32 GMT
Message-ID: <201103280933.p2S9XWRM014831@demeter2.kernel.org>
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





--- Comment #9 from roucaries.bastien+kernel@gmail.com  2011-03-28 09:33:30 ---
Dear Jeff,

Yes I have acl enable.

If your theory is right why lockdep does not detect this kind of scenario ? Do
you need a virtual lock in order to lockdep to automatically detect this ?

Sorry for the delay, real life suck

Bastien

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
