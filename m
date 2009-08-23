From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Sun, 23 Aug 2009 20:44:16 GMT
Message-ID: <200908232044.n7NKiGCu028072@demeter.kernel.org>
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





--- Comment #21 from Elmar Stellnberger <estellnb@gmail.com>  2009-08-23 20:44:13 ---
Good news; the bug seems having already been resolved with kernel
2.6.30-master_20090610141226_1b1ebc88-default. Could not evoke a crash either
by using mount options as before (defaults,noauto,users) or by adding
noatime,data=journal or data=ordered respectively.
I can still evoke the crash when booting into kernel 2.6.27.23-0.1.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
