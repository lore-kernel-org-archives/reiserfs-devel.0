From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14826] jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Tue, 13 Apr 2010 19:19:00 GMT
Message-ID: <201004131919.o3DJJ0nv003483@demeter.kernel.org>
References: <bug-14826-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-14826-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=14826





--- Comment #6 from Jeff Mahoney <jeffm@suse.com>  2010-04-13 19:18:49 ---
Ok, I've found the problem. Turns out expose_privroot is useful after all.

The loss isn't random. It affects xattrs that have been shrunk. The test case
in comment #2 demonstrated the issue perfectly because it removes a single ACL,
which shrinks the xattr, before it removes all of them. The issue is that when
an xattr is shrunk, the size of the header wasn't accounted for, so it's shrunk
by 8 bytes too many.

The test case is sensitive to memory pressure because the ACL is cached with
the in-memory inode. Accesses to it use the cached value until the inode is
dropped from memory and it needs to be re-read from disk. Upon the re-read, the
corruption is noticed and an -EIO results.

Unfortunately, this type of damage I am not going to be able to repair. I'll be
able to fix the checksums but the data inside a shrunken xattr will be lost.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
