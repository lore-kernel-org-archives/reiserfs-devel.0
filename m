From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 208719] PROBLEM: IO lockup on reiserfs FS.
Date: Wed, 29 Jul 2020 02:34:16 +0000
Message-ID: <bug-208719-695-7HjxY5Hia1@https.bugzilla.kernel.org/>
References: <bug-208719-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-208719-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208719

--- Comment #5 from deference@null.net ---
I should add that in chasing down this bug I have tried all the IO schedulers
available (noop deadline and cfq).
Cfq is the one I'm now using to reproduce this.

Also, I don't know if it makes a difference, but when the system first starts
up it takes 20m to get from the login manager to having my web browsers restart
and get all their pages from online. It might be because there is a lot of IO
going on or it might be that there are several stalls in the scheduling; just
not bad enough to cause a hung task problem like above.

-- 
You are receiving this mail because:
You are the assignee for the bug.
