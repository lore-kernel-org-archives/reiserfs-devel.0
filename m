From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Thu, 18 Jun 2009 13:53:03 GMT
Message-ID: <200906181353.n5IDr365014325@demeter.kernel.org>
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





--- Comment #8 from Elmar Stellnberger <estellnb@gmail.com>  2009-06-18 13:53:02 ---
  Lately I tried to infringe the problem by unloading all possibly unloadable
kernel modules (up to 9) and see it suddenly worked without any problem.
Unexpectedly the vmware&virualbox modules did not harm. However finding the
kernel module that causes the crash by binary search is almost impossible since
there is no crash as soon as all requests can be satisfied from the cache
memory. Nonetheless I can provide a minimal module list the script has been
working with and a maximal module list that is sure to cause a crash.
  I wonder if there is any way to forge ahead to a backtrace/core file. At
FreeBSD there is always a core-dump hanging around after a crash.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
