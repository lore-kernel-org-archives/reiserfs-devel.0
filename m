From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 45431] PROBLEM: problem with kswap/raiserfs
Date: Wed,  8 Aug 2012 09:24:36 +0000 (UTC)
Message-ID: <20120808092436.D64A611FB3D@bugzilla.kernel.org>
References: <bug-45431-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-45431-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=45431


Alan <alan@lxorguk.ukuu.org.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alan@lxorguk.ukuu.org.uk




--- Comment #2 from Alan <alan@lxorguk.ukuu.org.uk>  2012-08-08 09:24:36 ---
Known bug: one way to avoid it should be to run reiserfs without any quotas
enabled.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
