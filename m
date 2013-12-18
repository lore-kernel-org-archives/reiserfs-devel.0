From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Wed, 18 Dec 2013 21:08:57 +0000
Message-ID: <bug-29162-695-N6uNUI2zn8@https.bugzilla.kernel.org/>
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

--- Comment #54 from David Kowis <dkowis+kbt@shlrm.org> ---
(In reply to David Kowis from comment #53)
> I'm uncertain if the problem I'm encountering is the same problem or not,
> but it appears extremely similar. Forgive me if I'm not contributing
> properly.

Forgive me, I'm not using any quotas at least I don't have quotas enabled for
mounting:

$ mount
/dev/xvda1 on / type reiserfs (rw,relatime)

$ dmesg | grep quota
[    0.378754] VFS: Disk quotas dquot_6.5.2

That does show up, but I believe that's simply because it's builtin.

-- 
You are receiving this mail because:
You are the assignee for the bug.
