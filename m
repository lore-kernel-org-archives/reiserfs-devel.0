From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 190071] The patch "reiserfs: switch to
 generic_{get,set,remove}xattr()" introduced with 4.4.27 causes kernel panic
 on root mount
Date: Fri, 06 Jan 2017 19:01:48 +0000
Message-ID: <bug-190071-695-3XaTytKSat@https.bugzilla.kernel.org/>
References: <bug-190071-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-190071-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=190071

--- Comment #2 from dflogeras2@gmail.com ---
After reading

https://lkml.org/lkml/2016/5/25/416

I applied the two commits from Linus tree
0040773bff7b585fc948565a0558e5a6a4680e96
aaf431b4f92152d46ab54079692633aa422262b1

and my crash is gone. YMMV.

-- 
You are receiving this mail because:
You are the assignee for the bug.
