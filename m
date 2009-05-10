From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 0/4] reiserfs xattr fixups
Date: Sun, 10 May 2009 16:05:35 -0400
Message-ID: <20090510200535.893737918@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ftp.linux.org.uk>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, stefanr@s5r6.in-berlin.de

 Here are my remaining patches for reiserfs in 2.6.30:

 - reiserfs-xattr-fixup: Cleans up some ifdefs
 - reiserfs-xattr-root-fixup: Fixes an oops on open_xa_dir with
			      CONFIG_REISERFS_FS_XATTR=n
 - reiserfs-xattrs-disabled-perms: Fixes warnings on delete with
			      CONFIG_REISERFS_FS_XATTR=n (bko#13122)
 - reiserfs-expose-privroot: Adds a -oexpose_privroot that will allow
			     access to the privroot.

 Please apply.

 -Jeff

--
Jeff Mahoney
SUSE Labs



