From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14826] jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Tue, 13 Apr 2010 15:41:25 GMT
Message-ID: <201004131541.o3DFfP7u002831@demeter.kernel.org>
References: <bug-14826-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-14826-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=14826


Greg Surbey <gregsurbey@hotmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jeffm@suse.com




--- Comment #4 from Greg Surbey <gregsurbey@hotmail.com>  2010-04-13 15:41:09 ---
Considering that this bug eventually leads to completely unrepairable
filesystem corruption, I strongly recommend that Linux revert to the old
reiserfs xattr pre-2.6.30 code for the time being.  I realize that these code
improvements are a worthy goal, however this is supposed to be a stable kernel
release with a stable filesystem.  Losing data is the worst thing that can
happen, but losing data silently/randomly is even worse.  Unless this issue is
fixed today, this patch-set needs to go back to testing/development mode for
the time being.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
