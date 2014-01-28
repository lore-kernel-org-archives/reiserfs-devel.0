From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 28 Jan 2014 21:45:06 +0000
Message-ID: <bug-29162-695-7SKi2xns4e@https.bugzilla.kernel.org/>
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

--- Comment #62 from D.K. <dkozlowski@sevone.com> ---
Turning off the journal ( via nolog ) does not appear to alter this behavior,
and I have not been able to get this to be reproduced when turning on LOCKDEP.

-- 
You are receiving this mail because:
You are the assignee for the bug.
