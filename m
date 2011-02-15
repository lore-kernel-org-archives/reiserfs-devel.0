From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 15 Feb 2011 09:47:14 GMT
Message-ID: <201102150947.p1F9lElJ022726@demeter2.kernel.org>
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





--- Comment #6 from roucaries.bastien+kernel@gmail.com  2011-02-15 09:47:13 ---
Very hard to reproduce. Take between 30 to 6 hours to get it.

using git pull in parallel increase the chance to hit.

I suffer dataloss at reboot and I rebuild twice my / partition using reiserfsck
and restore using a backup once.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
