From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 83121] reiserfs silent data corruption
Date: Sat, 20 Sep 2014 12:28:35 +0000
Message-ID: <bug-83121-695-a9xiM7segh@https.bugzilla.kernel.org/>
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

--- Comment #9 from Alexander Bezrukov <phmagic@mail.ru> ---
I can confirm that with 3.16.3 (which contains abovementioned, see comment #4,
reiserfs set of patches) the issue went out, I cannot reproduce it anymore.

-- 
You are receiving this mail because:
You are the assignee for the bug.
