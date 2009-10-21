From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Wed, 21 Oct 2009 11:00:50 GMT
Message-ID: <200910211100.n9LB0oxG002874@demeter.kernel.org>
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





--- Comment #29 from Elmar Stellnberger <estellnb@gmail.com>  2009-10-21 11:00:46 ---
  Atime-setting seems having been totally rewritten with
vmlinuz-2.6.31.1-3-debug. It is now much faster and does not crash any more
during atime-setting. 
  However after having executed the atime-set-script multiple times and after
waiting a while my computer has crashed again. Trying to get a backtrace I had
no success. It was possible to load the crash kernel at crashkernel=64M@32M but
not before as recommended (64M@16M rejected). However by doing an 'echo c
>/proc/sysrq-trigger' I got a crash rather than entering the crash handler
kernel even though kexec had success in loading the crash-kernel before.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
