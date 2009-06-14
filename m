From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] New: crash while copying atime with touch
Date: Sun, 14 Jun 2009 11:33:29 GMT
Message-ID: <bug-13536-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13536

           Summary: crash while copying atime with touch
           Product: File System
           Version: 2.5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: estellnb@gmail.com
        Regression: No


Created an attachment (id=21910)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=21910)
files for which time could be changed + last file on which crash occurred

The system suddenly powers off executing this little scriptlet:
mount -t reiserfs /dev/sdb8 /mnt/ptgsuse
mount -t reiserfs /dev/temp/ptgsuse /mnt/ptgsuse-new/
cd /mnt/ptgsuse
find . -print0| while read -d $'\000' file; do
  echo $file >>/mnt/timestamped.ok
  touch -r "$file" -a "/mnt/ptgsuse-new/$file"
done

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
