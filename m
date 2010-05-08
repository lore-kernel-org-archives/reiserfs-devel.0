From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13037] reiserfs panic (device null superblock)
Date: Sat, 8 May 2010 22:12:29 GMT
Message-ID: <201005082212.o48MCTSm004332@demeter.kernel.org>
References: <bug-13037-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13037-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=13037


Christian Kujau <lists@nerdbynature.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lists@nerdbynature.de




--- Comment #10 from Christian Kujau <lists@nerdbynature.de>  2010-05-08 22:12:25 ---
A clean testcase would be nice. I tested 2.6.34-rc6 with reiserfs and an
external log; copied 11000000 files around, copied 2 kernel trees around - no
panic. It's a multicore machine too, but no DRBD or NFS involved.
If these variables make a difference, please describe your (exact) setup so
that one can try to reproduce this.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
