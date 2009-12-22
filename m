From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14855] Reiserproblem
Date: Tue, 22 Dec 2009 17:33:29 GMT
Message-ID: <200912221733.nBMHXT3l007602@demeter.kernel.org>
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





--- Comment #4 from Toby Thain <toby@telegraphics.com.au>  2009-12-22 17:33:26 ---
Memory can die over time. Another way to do quick and dirty memory testing
while the box is in production could be to run some heavy compiles, perhaps
many in parallel... but ideally memtest, of course :)

The main reason I mentioned it is because you are using Reiser3, which is very
mature and stable. It seems plausible that hardware could be at fault.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
