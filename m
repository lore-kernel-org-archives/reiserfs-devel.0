From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13374] reiserfs blocked for more than 120secs
Date: Fri, 5 Jun 2009 18:25:48 GMT
Message-ID: <200906051825.n55IPmoZ006512@demeter.kernel.org>
References: <bug-13374-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13374-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13374


Jeff Mahoney <jeffm@suse.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jeffm@suse.com
         AssignedTo|reiserfs-devel@vger.kernel. |jeffm@suse.com
                   |org                         |




--- Comment #2 from Jeff Mahoney <jeffm@suse.com>  2009-06-05 18:25:47 ---
Can you capture a sysrq+t when this is occuring? The lock is properly released,
but I have a hunch that another thread is waiting on ordered writeback.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
