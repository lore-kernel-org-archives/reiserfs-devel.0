From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13122] reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
Date: Sun, 17 May 2009 21:29:11 GMT
Message-ID: <200905172129.n4HLTBvH007009@demeter.kernel.org>
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


Tobias Jakobi <liquid.acid@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |liquid.acid@gmx.net




--- Comment #5 from Tobias Jakobi <liquid.acid@gmx.net>  2009-05-17 21:29:11 ---
Hmm, I encountered the problem in 2.6.30_rc5 (didn't check the previous RCs)
and updated today to rc6 only to find that the kernel segfaults now (in a
reiserfs call).

Going back to rc5 removes the segfaults, but the warnings come back.

I fixed this for rc6 by enabling xattr support for reiserfs in the kernel
config (I had it disabled).

I'm going to try to log the segfault somehow. I didn't seem to be written to
the system log when it occured.

I don't know how this is handled on kernel.org. Should I open a new bug for
this problem or does someone have to reopen this one here?

Greets,
Tobias

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
