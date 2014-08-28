From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 83121] reiserfs silent data corruption
Date: Thu, 28 Aug 2014 15:10:44 +0000
Message-ID: <bug-83121-695-t9lxl5uJld@https.bugzilla.kernel.org/>
References: <bug-83121-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-83121-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=83121

Matthew <jackdachef@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jackdachef@gmail.com

--- Comment #4 from Matthew <jackdachef@gmail.com> ---
the specific fix for this specific issue is probably the latter of the
following two:

Jan Kara (1):
      reiserfs: Fix use after free in journal teardown

Jeff Mahoney (1):
      reiserfs: fix corruption introduced by balance_leaf refactor


source:
http://marc.info/?l=linux-kernel&m=140785640315057&w=2

-- 
You are receiving this mail because:
You are the assignee for the bug.
