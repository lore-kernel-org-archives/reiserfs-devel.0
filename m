From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sat, 21 Sep 2013 23:39:39 +0000
Message-ID: <bug-29162-695-jzN5G1jSRE@https.bugzilla.kernel.org/>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162

--- Comment #52 from Frederic Weisbecker <fweisbec@gmail.com> ---
On Fri, Sep 20, 2013 at 07:23:48PM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=29162
> 
> --- Comment #51 from Jeff Mahoney <jeffm@suse.com> ---
> Anyone who has experienced this problem should re-test with 3.12-rc1 or later.
> It has the locking fixes that should address the issue.

Thanks a lot for fixing all these, Jeff!

-- 
You are receiving this mail because:
You are the assignee for the bug.
