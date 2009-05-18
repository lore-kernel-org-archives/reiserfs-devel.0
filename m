From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13122] reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
Date: Mon, 18 May 2009 17:36:47 GMT
Message-ID: <200905181736.n4IHalQk003369@demeter.kernel.org>
References: <bug-13122-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13122-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13122





--- Comment #7 from Stefan Richter <stefan-r-bz@s5r6.in-berlin.de>  2009-05-18 17:36:46 ---
Tobias, you are most likely seeing bug 13321.  You can either try current git,
or -rc6 plus extra patches (linked in bug 13321) or wait for -rc7.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
