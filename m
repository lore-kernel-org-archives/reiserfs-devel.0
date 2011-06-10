From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Fri, 10 Jun 2011 12:41:14 GMT
Message-ID: <201106101241.p5ACfEHB023991@demeter1.kernel.org>
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





--- Comment #27 from Maximilian Decker <burbon04@gmx.de>  2011-06-10 12:41:08 ---
I think we have to wait till Frederic has some way to reproduce the issue ...

I tried to reproduce it myself with different workloads on another machine, 
also created binaries with C doing multiple very fast I/O operations, ran
them for several hours, but it did not crash. (Intel Dualcore ~1,8Ghz).
Somehow it seems to also depend on the system config/specs.

So, to make it short - 
2 crashes on AMD Dualcore 3GHz, 0 crashes on Intel Dualcore 1.8Ghz for me.

@Bastien - what hardware are you running ?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
