From: system_lists@nullzone.org
Subject: Urgent: problems after crush
Date: Sun, 01 Dec 2002 13:58:59 +0100
Message-ID: <5.1.1.6.2.20021201134854.00ce13b8@192.168.2.131>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi there,

    i have a problem on my web server. Trying to star the apache-web-daemon 
i get always this message (in a reiserfs x.xx.xx partition).

Dec  1 14:37:01 server01 kernel: attempt to access beyond end of device
Dec  1 14:37:01 server01 kernel: 03:04: rw=0, want=0, limit=2185344
Dec  1 14:37:01 server01 kernel: attempt to access beyond end of device
Dec  1 14:37:01 server01 kernel: 03:04: rw=0, want=0, limit=2185344
Dec  1 14:37:10 server01 kernel: init_special_inode: bogus imode (2000)


It'is so after a hardware problem which halted the system.
After fixing the problem i cannot start the daemon.

I have recompiled the daemon, created new log files (re-done all which 
apache access in a boot (pid files, directories..)).
I have done a reiserfsck and all is ok ..

im a bit lost...

Please help




