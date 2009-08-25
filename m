From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14055] New: crash on NFS umount
Date: Tue, 25 Aug 2009 12:52:55 GMT
Message-ID: <bug-14055-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14055

           Summary: crash on NFS umount
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.30.5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: harald.dunkel@t-online.de
        Regression: No


Created an attachment (id=22841)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=22841)
kern.log

I have set up a Linux-HA cluster (2 hosts) using kernel 2.6.30.5, drbd 8.3.2
and Heartbeat. The data partition is formatted in reiserfs. It is exported via
NFSv3 to 3 other Linux hosts.

For a stress test I run a loop to shutdown heartbeat on the current primary,
wait 5 minutes for the other host to take over and to make sure the NFS
timeouts on the clients have expired, startup the local heartbeat again, and
wait
another 30 seconds. A complete cycle takes 11 minutes.

To put some load on the cluster I have started 3 kernel builds in parallel on
each of the 3 NFS clients.


After some time I got the attached crash. It seems that it happened when
heartbeat tried to unmount the data partition. I had to reboot, check the file
system (it was dirty), and start heartbeat again. After a few cycles I got the
same problem again, but this time on the other host. After that I stopped
testing.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
