From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Wed, 12 Aug 2009 09:10:15 GMT
Message-ID: <200908120910.n7C9AFT0024535@demeter.kernel.org>
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





--- Comment #12 from Elmar Stellnberger <estellnb@gmail.com>  2009-08-12 09:09:11 ---
  This is exactly what I have been doing. Very cumbersome and tedious since not
only booting takes a while but even much worse the looped touch consumes a lot
of time and hdd activity so that my hard disk will have to suffer. Logarithmic
search is far not as fast here as I would wish it to be.
  Besides this I am really in wonder if there is no way to debug the Linux
kernel. It is so easy to analyze an auto-created backtrace under FreeBSD.
Furthermore I have no idea how you will find the bug just knowing the offensive
kernel module. It could hide anywhere. Is there really no possibility to get a
Linux kernel core dump?

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
