From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 207971] New: Wrong permissions with cp -a and reiserfs mounted
 with acl
Date: Fri, 29 May 2020 12:42:25 +0000
Message-ID: <bug-207971-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207971

            Bug ID: 207971
           Summary: Wrong permissions with cp -a and reiserfs mounted with
                    acl
           Product: File System
           Version: 2.5
    Kernel Version: >=4.13.0
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: marco@nucleus.it
        Regression: No

Copying files with the command
cp -a source destination
where destination is a filesystem with reiserfs format "3.6" with mount options
noatime,user_xattr,acl failed to preserve permissions.

I tested this behaviour with Ubuntu 16.04.6 LTS, Ubuntu 18.04.4 LTS and some
Gentoo custom installations.

Ubuntu kernel tested:
4.4.0-157-generic       ok
4.8.0-58-generic        ok
4.10.0-42-generic       ok
4.12.14-041214-generic  ok
4.13.0-45-generic       broken permissions
4.13.1-041301-generic   broken permissions
4.15.0-76-generic       broken permissions
4.15.0-101-generic      broken permissions
5.3.0-53-generic        broken permissions
5.6.14-050614-generic   broken permissions

Steps to reproduce the problem (you need lot of files and i used kernel
sources) and a device /dev/sdb formatted with reierfs:
apt-get install --no-install-recommends linux-source-4.15.0 
tar -jxf /usr/src/linux-source-4.15.0/linux-source-4.15.0.tar.bz2 -C /usr/src/
mkfs.reiserfs -f /dev/sdb
mount -o noatime,user_xattr,acl /dev/sdb /mnt
myk=/usr/src/linux-source-4.15.0
#Next command should return no files
find $myk -type f -perm 600
myt=/mnt/test2
#Copy the files
cp -a $myk $myt
#Next command should return some files
find $myt -type f -perm 600
#example of differences
tempfile=`find $myt -type f -perm 600 | head -n 1` 
ls -la ${myk}${tempfile#$myt} $tempfile

Example of broken permissions:
-rw------- 1 root root 67421 May 11 12:07 /mnt/test2/fs/nfs/dir.c
-rw-r--r-- 1 root root 67421 May 11 12:07
/usr/src/linux-source-4.15.0/fs/nfs/dir.c

Expected permissions:
-rw-r--r-- 1 root root 67421 May 11 12:07 /mnt/test2/fs/nfs/dir.c
-rw-r--r-- 1 root root 67421 May 11 12:07
/usr/src/linux-source-4.15.0/fs/nfs/dir.c

-- 
You are receiving this mail because:
You are the assignee for the bug.
