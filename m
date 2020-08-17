From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 208719] PROBLEM: IO lockup on reiserfs FS.
Date: Mon, 17 Aug 2020 14:55:41 +0000
Message-ID: <bug-208719-695-iT5xaHnTFw@https.bugzilla.kernel.org/>
References: <bug-208719-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-208719-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208719

deference@null.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #6 from deference@null.net ---
This bug appears to have been fixed some where between 4.14.X and the 5.17.X
series.
I don't know why the fix wasn't backported, but it doesn't really matter to me
as I can run the newer kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.
