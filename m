From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13756] Kernel panic occasionaly under load
Date: Sat, 22 Aug 2009 08:55:15 GMT
Message-ID: <200908220855.n7M8tFob007838@demeter.kernel.org>
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





--- Comment #7 from Roland Kletzing <devzero@web.de>  2009-08-22 08:55:12 ---
if this is the "data=journal" issue, could you please try (and confirm) if this
patch: http://bugzilla.kernel.org/attachment.cgi?id=22800  is fixing the
problem ?  you can otherwise try .31-rc7 kernel, which already has this patch
included.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
