From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12335] crafted reiserfs filesystem image local DoS (reboot)
Date: Tue, 10 Dec 2013 22:54:53 +0000
Message-ID: <bug-12335-695-1GZtBJYUwq@https.bugzilla.kernel.org/>
References: <bug-12335-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-12335-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12335

Jeff Mahoney <jeffm@suse.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jeffm@suse.com

--- Comment #6 from Jeff Mahoney <jeffm@suse.com> ---
Created attachment 118031
  --> https://bugzilla.kernel.org/attachment.cgi?id=118031&action=edit
[PATCH] reiserfs: fix crash with fuzzed file system

This will fix this particular issue, but reiserfs is generally pretty
vulnerable to fuzzer issues.

-- 
You are receiving this mail because:
You are the assignee for the bug.
