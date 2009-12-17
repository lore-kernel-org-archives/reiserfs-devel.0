From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14055] crash on NFS umount
Date: Thu, 17 Dec 2009 09:01:50 GMT
Message-ID: <200912170901.nBH91oDE004941@demeter.kernel.org>
References: <bug-14055-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-14055-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14055





--- Comment #2 from Pawel Zawora <pzawora@gmail.com>  2009-12-17 09:01:32 ---
2.6.32.1: If there was open file (on any client) before closing NFSD process  -
unmount fails causes kernel error. It seems that something is not correctly
disposed when nfsd is killed.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
