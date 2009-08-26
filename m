From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13756] Kernel panic occasionaly under load
Date: Wed, 26 Aug 2009 17:22:29 GMT
Message-ID: <200908261722.n7QHMTXl032542@demeter.kernel.org>
References: <bug-13756-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13756-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13756


Igor Novgorodov <igor@novg.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |PATCH_ALREADY_AVAILABLE




--- Comment #8 from Igor Novgorodov <igor@novg.net>  2009-08-26 17:22:27 ---
Well, it looks like the patch solves the problem!
Under 31-rc7 i've recompiled the toolchain three times, and it's rock solid.
We can close the bug now i think. Thanks to all of you!

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
