From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sun, 22 May 2011 11:06:25 GMT
Message-ID: <201105221106.p4MB6P60027120@demeter1.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162





--- Comment #18 from Maximilian Decker <burbon04@gmx.de>  2011-05-22 11:06:19 ---
Bastien,

could you please provide some additional information about your system ?
Maybe it helps finding some appropriate setup for Frederic to reproduce.

Here some specs about my openSuSE that crashed reiserfs twice
(2.6.37.1 after about 6 hours, 2.6.38.4 after about 14 days, now back on
2.6.34)

CPU: Dual-Code AMD running at 800MHz - 3 GHz
GPU: Radeon HD 4200 (shared mem)
RAM: 7 GB
Kernel: Desktop-Kernel (i.e. PREEMPT) 64bits

reiserfs-Partitions:
 /dev/sda7 61GB, dm-crypted, 74% usage, mounted "rw,relatime" (home-partition)
 LVM2-pooled 160G volume (PV /dev/sdb1), ~90% usage, mounted "rw,noatime,acl"
(data-partition)

I tried to create some proof-of-concept setup with VMWare and direct mapped old
(i.e. intentionally slow) USB-harddrive (2,5G), using 96MB RAM for the guest OS 
(to force more hdd activity and less cache), using 8 parallel tests and 2 
reiserfs partitions, running on 2.6.37.1 for 2 days without problems.

Another test setup running on native Intel hardware with same kernel and 2
reiserfs partitions on one fast local SATA drive also did not crash within 1,5
days.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
