From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 27972] Null pointer dereference at shutdown time
Date: Wed, 2 Feb 2011 15:54:36 GMT
Message-ID: <201102021554.p12FsaWY022247@demeter1.kernel.org>
References: <bug-27972-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-27972-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=27972





--- Comment #2 from Jeff Mahoney <jeffm@suse.com>  2011-02-02 15:54:19 ---
Created an attachment (id=46052)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=46052)
reiserfs: Fix crash during umount

 There is a conflict between shrink_dcache_for_umount_subtree and how
 xattrs are cleaned up for deleted files at umount.

 shrink_dcache_for_umount_subtree wants to ensure that all dentries for a
 file system have been evicted and it walks the dentry tree from the root
 of the file system to do this. It will BUG if there are any dentries
 left with elevated counts.

 The reiserfs xattr infrastructure caches two dentries. One is for
 .reiserfs_priv and the other is for .reiserfs_priv/xattrs. When
 shrink_dcache_for_umount_subtree goes through, it will BUG on these dentries
 if they aren't freed. OTOH, it will Oops in reiserfs_delete_xattrs if
 they are due to the xattr code needing to walk the list of xattrs for
 a file undergoing delayed deletion. This will end up loading up other
 dentries and possibly queue up more delayed deletions.

 This patch detaches the tree under .reiserfs_priv during ->kill_sb. This
 allows shrink_dcache_for_umount_subtree to complete successfully as well
 as keeps around the .reiserfs_priv tree for deletion handling. After
 the regular cycle is completed, it will call shrink_dcache_for_umount_subtree
 again itself to ensure that the xattrs are cleaned up.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
