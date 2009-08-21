From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13876] [x86_32, 2.6.30, reiserfs, reiser3, bug, regression]
 kernel oopsed while Sarg was running
Date: Fri, 21 Aug 2009 19:56:26 GMT
Message-ID: <200908211956.n7LJuQJf028053@demeter.kernel.org>
References: <bug-13876-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13876-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13876


Linus Torvalds <torvalds@linux-foundation.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |torvalds@linux-foundation.o
                   |                            |rg




--- Comment #6 from Linus Torvalds <torvalds@linux-foundation.org>  2009-08-21 19:56:26 ---
Igor, can you try the patch I just added in that bugzilla entry 13556?

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
