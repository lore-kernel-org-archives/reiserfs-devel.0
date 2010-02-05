From: Christian Kujau <lists@nerdbynature.de>
Subject: reiserfs_delete_xattrs: Couldn't delete all xattrs
Date: Fri, 5 Feb 2010 13:06:04 -0800 (PST)
Message-ID: <alpine.DEB.2.01.1002051301030.3483@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: jeffm@suse.com

Hi,

although #13122 [0] has been closed with CODE_FIX, I'm still seeing this 
with 2.6.33-rc6 (vanilla, sparc64):

# mount -t reiserfs -o user_xattr /dev/loop0 /mnt/test
# dbench -t 600 -D /mnt/test/bench/ -x 50

A few minutes later, with dbench still running:

  REISERFS warning (device loop0): jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-2)

However, contrary to the report in #13122, REISERFS_FS_XATTR *are* enabled 
on this setup:

CONFIG_REISERFS_FS=m
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
# CONFIG_REISERFS_FS_SECURITY is not set

Full dmesg and .config: http://nerdbynature.de/bits/2.6.33-rc6/reiserfs/

Is anyone able to reopen the bug or should I file a new one?

Thanks,
Christian.

[0] http://bugzilla.kernel.org/show_bug.cgi?id=13122
-- 
BOFH excuse #233:

TCP/IP UDP alarm threshold is set too low.
