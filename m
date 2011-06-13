From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 13 Jun 2011 21:37:24 GMT
Message-ID: <201106132137.p5DLbOmh027843@demeter2.kernel.org>
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





--- Comment #31 from Maximilian Decker <burbon04@gmx.de>  2011-06-13 21:37:21 ---
yes same here I tried to find some sort of testing setup that would allow for 
easy and reliable crash reproduction. No luck so far.

Anyway the machine that crashed twice (running openSuSE 11.4) differs from the
"try-to-reproduce"-machine in at least the following:

CPU running at 3.00 GHz instead of 1.80 GHz
AMD Radeon HD (w/ fglrx binary driver) instead of Intel GPU
had loaded VirtualBox kernel modules
had loaded VMWare kernel modules

That's it. So nothing to really worry about IMHO.
Well ok as far as I can remember the VMWare modules I used actually had some
BKL dependencies, the patch for full 2.6.39 compatibility without BKL dep was
not yet released that time. But it would be quite far-fetched to blame them.

@Bastien - is there anything notably special about your setup ? 
For now you seem to be the only one being able to reasonably reproduce the
issue.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
