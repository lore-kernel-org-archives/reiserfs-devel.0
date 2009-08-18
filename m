From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Tue, 18 Aug 2009 07:56:56 GMT
Message-ID: <200908180756.n7I7uu0C001838@demeter.kernel.org>
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





--- Comment #16 from Elmar Stellnberger <estellnb@gmail.com>  2009-08-18 07:56:54 ---
  My new FS-notebook does not get hot at all (in contrast to others). I have
recently had a comprehensive hardware check (memory, hdd). The only thing I can
not fully exclude by the time is a malware infection though basic tests yielded
negative.
  The posted program does not copy files but only atime records (see Comment
#1). No crash will occur if you just copy a few files. Moreover the problem may
be related to reiserfs. I will read Roland Kletzings howto on creating kernel
core dumps to provide useful information, soon. Nonetheless it would be
momentous if someone else could reproduce it. Use the root-fs of a fully
installed system, two reiserfs partitions and two different sata hard disks for
them (here: SATA_WDC_WD6400AAKS).

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
