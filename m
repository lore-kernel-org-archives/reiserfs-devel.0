From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14876] New: umounting reiserFS after many days caused oops
Date: Fri, 25 Dec 2009 13:44:16 GMT
Message-ID: <bug-14876-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14876

           Summary: umounting reiserFS after many days caused oops
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.31.6
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: radimluza@seznam.cz
        Regression: No


Created an attachment (id=24305)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=24305)
Dmesg output

After running reiserFS partition for 23 days it caused oops when umounting and
it couldn't be mounted again. It was necessary to reboot to make partition work
again.

Partition is on LVM2 running on RAID5 - HW is VIA EPIA SN1800G, 3x1TB WD HDD

Patches - c7sensor for integrated thermal and FAN sensors:
http://famvdploeg.com/blog/2009/07/lm-sensors-on-the-via-epia-sn10000eg-and-sn18000g/

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
