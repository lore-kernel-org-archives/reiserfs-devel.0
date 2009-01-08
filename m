From: Oliver Neukum <oliver@neukum.org>
Subject: problems with xattr in 2.6.28 and 2.6.27
Date: Thu, 8 Jan 2009 11:04:40 +0100
Message-ID: <200901081104.40980.oliver@neukum.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Hi,

I am getting entries like this in syslog, but reiserfsck finds no errors
in the filesystem.

	Regards
		Oliver
2.6.28:

Jan  8 08:55:14 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
iated with [266558 266621 0x0 SD]
Jan  8 08:55:14 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
iated with [266558 266631 0x0 SD]
Jan  8 08:55:14 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
iated with [266558 266669 0x0 SD]
Jan  8 08:55:15 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
iated with [266558 266691 0x0 SD]
Jan  8 08:55:16 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
iated with [266558 266621 0x0 SD]
Jan  8 08:55:16 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
iated with [266558 266631 0x0 SD]
Jan  8 08:55:16 vanamonde kernel: REISERFS warning (device sda7): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (user.Beagle) assoc
iated with [266558 266669 0x0 SD]

2.6.27:

Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
Jan  7 16:33:06 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 3158320 0x0 SD]
Jan  7 16:33:07 vanamonde kernel: ReiserFS: sda7: warning: Invalid hash for xattr (user.Beagle) associated with [959459378 892350768 892548608(49) DIR]
