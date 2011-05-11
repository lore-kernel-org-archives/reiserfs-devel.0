From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Wed, 11 May 2011 14:54:50 GMT
Message-ID: <201105111454.p4BEsoH3032005@demeter1.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162





--- Comment #11 from Frederic Weisbecker <fweisbec@gmail.com>  2011-05-11 14:54:46 ---
I'm still investigating on this.

I had tested concurrent loops of git-reset/git-merge for 2 days few weeks ago
but couldn't reproduce. I think it was on 2.6.38 though.

I've tested the same this night with 2.6.37.1 as in your latest report, but
couldn't manage to trigger the issue either.

So now I'm going to test kmail as it seems to often happen as a good trigger
for this bug.

I'll give you more news soon.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
