From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14899] reiserfs: inconsistent lock state
Date: Sun, 10 Jan 2010 23:01:03 GMT
Message-ID: <201001102301.o0AN13nd007093@demeter.kernel.org>
References: <bug-14899-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-14899-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14899


Rafael J. Wysocki <rjw@sisk.pl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |CODE_FIX




--- Comment #2 from Rafael J. Wysocki <rjw@sisk.pl>  2010-01-10 23:01:02 ---
Fixed by commit 500f5a0bf5f0624dae34307010e240ec090e4cde .

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
