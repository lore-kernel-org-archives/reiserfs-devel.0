From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 20 Jun 2011 07:38:36 GMT
Message-ID: <201106200738.p5K7cafo025183@demeter1.kernel.org>
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





--- Comment #34 from Maximilian Decker <burbon04@gmx.de>  2011-06-20 07:37:45 ---
I had 4 concurrent I/O tests running for one week now on my AMD machine that 
happened to crash reiserfs twice. The tests did lots of fopen, fclose, fgetc, 
gputc, chmod and stat. No crash. The system was loaded with I/O and CPU usage 
(with the testing processes summing up to nearly 200% (dual-core CPU)).

The filesystem was dm-crypted  and mounted "rw,relatime,acl,user_xattr",
running with the openSuSE 11.4 kernel (2.6.37.1-1.2-desktop SMP 64bits).

Another script randomly set different CPU clockspeeds (for whatever that might
help, but for me the crashes had happend with ondemand CPU scaling governor).

So, to me it seems there must be something else actually triggering the crash. 
Maybe some interfering CPU idling stuff or something like that. Or some very
specific I/O I did not cover with my test. Don't know.

Anyway I could not reproduce with "just" steady CPU and I/O.

Someone else any news on this ?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
