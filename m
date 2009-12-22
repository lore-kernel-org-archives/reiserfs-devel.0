From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14855] Reiserproblem
Date: Tue, 22 Dec 2009 08:22:03 GMT
Message-ID: <200912220822.nBM8M3hC011107@demeter.kernel.org>
References: <bug-14855-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-14855-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14855





--- Comment #3 from Nerijus Kislauskas <nerijus.kislauskas@ktu.lt>  2009-12-22 08:22:01 ---
(In reply to comment #1)
> Have you thoroughly checked your hardware? (e.g. a proper soak of memtest86, to
> start)

Hi Toby,

Before production, I always do a memtest, upgrading firmware, do some stress
tests. As I remember, in that time memtest86 showed good results. Maybe
somethings changed since then, I can do more memtesting, but need to plan
downtime for couple of hours, let know users about maintenance and so on.
Server itself does not give any info through diagnostic LED's about any
problems. Give me some time, I will try to do additional memtesting, but I
don't think that problem is in memory.

Nerijus

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
