From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 195211] WARNING: CPU: 4 PID: 342 at fs/quota/dquot.c:619
 dquot_writeback_dquots+0x25e/0x270
Date: Sat, 01 Jul 2017 01:42:32 +0000
Message-ID: <bug-195211-695-CbJumjoeXR@https.bugzilla.kernel.org/>
References: <bug-195211-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-195211-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=195211

higuita (higuita@gmx.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |higuita@gmx.net

--- Comment #4 from higuita (higuita@gmx.net) ---
same problem here on 4.11.7

is this something that we should worry or just really a small warning?
for me, i can mount that old raiserfs read-only, as this partition is mostly
old data/archive partition

-- 
You are receiving this mail because:
You are the assignee for the bug.