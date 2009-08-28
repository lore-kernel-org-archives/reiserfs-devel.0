From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Fri, 28 Aug 2009 12:19:16 GMT
Message-ID: <200908281219.n7SCJGWv002980@demeter.kernel.org>
References: <bug-13536-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13536-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13536





--- Comment #28 from Elmar Stellnberger <estellnb@gmail.com>  2009-08-28 12:19:10 ---
  Unfortunately my latest tests with noatime have alltogether evoked crashes.
noatime, data=journal & noatime, data=ordered, both with kernel 2.6.31rc7 as
well as kernel 2.6.30 (as mentioned above).
  Had forgotten to tell that target volume is a LVM-LV. With 2.6.31rc7-vanilla
I could not access the LVM-LV any more (it must have worked with vanilla
kernels before).
  Very starnge; can`t tell why it has not crashed with any setting one time.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
