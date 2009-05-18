From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13122] reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
Date: Mon, 18 May 2009 20:23:45 GMT
Message-ID: <200905182023.n4IKNjkZ018023@demeter.kernel.org>
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





--- Comment #9 from Tobias Jakobi <liquid.acid@gmx.net>  2009-05-18 20:23:45 ---
Thanks Stefan for the info! I'm pretty sure it's bug #13321. I just removed
xattr support for reiserfs from kernel config again and it also crashes in
reiserfs_for_each_xattr on boot. Going to wait for rc7 though :)

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
