From: <doiggl@velocitynet.com.au>
Subject: [conclusion]2017-02-22  tar up files on Reiser4 disk to another disk [/dev/sdb -> sdc]
Date: Wed, 22 Feb 2017 20:48:29 +1100
Message-ID: <325e87dae7f3113fcc4ba8973fa59ee6@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

FYI

[still in progress]
In another try, the disk '/dev/sdb' was accessed.
using 'tar' to make a copy of the files it could access to another disk..
.
tar error-ed on some files and kept going to next file. [till end of files
on disk]
At least I could get a copy of accessible files that way.
So some metadata has worked.

space:
# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb        1.8T  747G  1.0T  43% /media/disk  [entire disk reiser4]
/dev/sdc1       932G  443G  489G  48% /media/disk2


# command used:
# tar -cvf /media/disk2/r4files.tar /media/disk | tee
/media/disk2/r4files-sdb.log

--Glenn

example:

/media/disk/opensuse/11.4/rpms/kdesvn-1.5.5-3.2.i586.rpm
/media/disk/opensuse/11.4/rpms/kdesvn-1.5.5-3.2.x86_64.rpm
tar: /media/disk/opensuse/11.4/rpms/kdetoys4-4.6.0-3.1.i586.rpm: File
removed before we read it
tar: /media/disk/opensuse/11.4/rpms/kdetoys4-4.6.0-3.1.x86_64.rpm: File
removed before we read it
/media/disk/opensuse/11.4/rpms/kdeutils4-4.6.0-3.4.i586.rpm
/media/disk/opensuse/11.4/rpms/kdeutils4-4.6.0-3.4.x86_64.rpm
/media/disk/opensuse/11.4/rpms/kdevelop4-4.2.0-3.6.1.x86_64.rpm
/media/disk/opensuse/11.4/rpms/kdevelop4-4.2.0-3.6.1.i586.rpm
tar: /media/disk/opensuse/11.4/rpms/kdevelop4-devel-4.2.0-3.6.1.i586.rpm:
File removed before we read it
tar:
/media/disk/opensuse/11.4/rpms/kdevelop4-devel-4.2.0-3.6.1.x86_64.rpm: File
removed before we read it
/media/disk/opensuse/11.4/rpms/kdevelop4-lang-4.2.0-3.6.1.noarch.rpm
tar:
/media/disk/opensuse/11.4/rpms/kdevelop4-pg-qt-devel-0.9.0-3.1.x86_64.rpm:
File removed before we read it
tar:
/media/disk/opensuse/11.4/rpms/kdevelop4-pg-qt-devel-0.9.0-3.1.i586.rpm:
File removed before we read it
/media/disk/opensuse/11.4/rpms/kdevelop4-pg-qt-0.9.0-3.1.x86_64.rpm
/media/disk/opensuse/11.4/rpms/kdevelop4-pg-qt-0.9.0-3.1.i586.rpm
/media/disk/opensuse/11.4/rpms/kdevelop4-plugins-php-1.2.0-2.2.i586.rpm
/media/disk/opensuse/11.4/rpms/kdevelop4-plugins-php-1.2.0-2.2.x86_64.rpm
tar:
/media/disk/opensuse/11.4/rpms/kdevelop4-plugins-php-doc-1.2.0-2.2.x86_64.rpm:
File removed before we read it
tar:
/media/disk/opensuse/11.4/rpms/kdevelop4-plugins-php-doc-1.2.0-2.2.i586.rpm:
File removed before we read it
/media/disk/opensuse/11.4/rpms/kdevplatform-1.2.0-2.2.i586.rpm
/media/disk/opensuse/11.4/rpms/kdevplatform-1.2.0-2.2.x86_64.rpm
/media/disk/opensuse/11.4/rpms/kdevplatform-lang-1.2.0-2.2.noarch.rpm
tar: /media/disk/opensuse/11.4/rpms/kdewebdev3-3.5.10-26.1.i586.rpm: File
removed before we read it
tar: /media/disk/opensuse/11.4/rpms/kdewebdev3-3.5.10-26.1.x86_64.rpm:
File removed before we read it



