From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13556] Random oopses
Date: Thu, 20 Aug 2009 10:28:11 GMT
Message-ID: <200908201028.n7KASBtH000618@demeter.kernel.org>
References: <bug-13556-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13556-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13556





--- Comment #4 from Roland Kletzing <devzero@web.de>  2009-08-20 10:28:09 ---
so, f you change /usr to have same fs mount options (i suspect atime/noatime or
data=journal) can you produce the crash with /usr, too ?

if that is the case, can you please evaluate which specific mount option is
causing it ?

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
