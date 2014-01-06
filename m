From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 06 Jan 2014 16:05:36 +0000
Message-ID: <bug-29162-695-OHdAbdnAbt@https.bugzilla.kernel.org/>
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

--- Comment #59 from Jeff Mahoney <jeffm@suse.com> ---
(In reply to D.K. from comment #58)
> I just pulled git from torvalds tree and the changes listed by Jeff Mahoney
> are not in there. Also the patches do not apply cleanly.

Yeah they are:
d2d0395fd1778d4bf714adc5bfd23a5d748d7802 reiserfs: locking, release lock around
quota operations
278f6679f454bf185a07d9a4ca355b153482d17a reiserfs: locking, handle nested locks
properly
4c05141df57f4ffc1a9a28f1925434924179bfe4 reiserfs: locking, push write lock out
of xattr code
a1457c0ce976bad1356b9b0437f2a5c3ab8a9cfc reiserfs: fix deadlock with nfs racing
on create/lookup

-- 
You are receiving this mail because:
You are the assignee for the bug.
