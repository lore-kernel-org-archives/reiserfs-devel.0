From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14826] jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Tue, 13 Apr 2010 08:55:49 GMT
Message-ID: <201004130855.o3D8tnjt011415@demeter.kernel.org>
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


Marco Gatti <marco.gatti@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |marco.gatti@gmail.com




--- Comment #3 from Marco Gatti <marco.gatti@gmail.com>  2010-04-13 08:55:39 ---
It seems to me that things turned bad with acl with the release of kernel
2.6.30.
Check this discussion if you haven't:
http://marc.info/?t=126979018700003&r=1&w=2

In particular this post with a simple test case and results:
http://marc.info/?l=reiserfs-devel&m=127056179512450&w=2

Is there something i can do to help? I mean just as a linux user...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
