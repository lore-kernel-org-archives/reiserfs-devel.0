From: Christian Kujau <lists@nerdbynature.de>
Subject: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Mon, 14 Dec 2009 14:44:33 -0800 (PST)
Message-ID: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi there,

I've just noticed the following in my logs:

REISERFS warning (device xvda3): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr 
(user.{http:%2F%2Ftwistedmatrix.com%2Fxml_namespace%2Fdav%2Fprivate%2F}quota-used) 
associated with [765 72063 0x0 SD]

and one minute later:

REISERFS warning (device xvda3): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr 
(user.{http:%2F%2Ftwistedmatrix.com%2Fxml_namespace%2Fdav%2Fprivate%2F}quota-used) 
associated with [765 72063 0x0 SD]

# find /var/ -inum 72063
/var/spool/caldavd/calendars/__uids__/afebe2f1-f51a-5859-af15-f22312ad6634

# grep xvda3 /proc/mounts
/dev/xvda3 /var reiserfs rw,nosuid,nodev,noexec,relatime,user_xattr,notail 0 0

Accessing the filesystem is still fine (lsattr(1) fails, but it's 
supposed to fail anyway, right?). This is a x86-64 Xen DomU running 
2.6.32-rc8 with:

CONFIG_REISERFS_FS=m
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y

Thanks,
Christian.
-- 
BOFH excuse #382:

Someone was smoking in the computer room and set off the halon systems.
