From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sun, 21 Aug 2011 13:00:12 GMT
Message-ID: <201108211300.p7LD0Cko030749@demeter1.kernel.org>
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


roucaries.bastien+kernel@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|2.6.36,2.6.37               |2.6.36,2.6.37,2.6.39




--- Comment #35 from roucaries.bastien+kernel@gmail.com  2011-08-21 13:00:04 ---
I can reproduce on 2.6.39. Could not save the trace, but by memory it is the
same call trace.

Could you help me and send testing patch ?

I am trying to reproduce with 3.0

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
