From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14826] jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Mon, 12 Apr 2010 18:52:06 GMT
Message-ID: <201004121852.o3CIq6uO027227@demeter.kernel.org>
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


Greg Surbey <gregsurbey@hotmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gregsurbey@hotmail.com




--- Comment #2 from Greg Surbey <gregsurbey@hotmail.com>  2010-04-12 18:51:53 ---
My organization's main file server started experiencing this issue when we
upgraded from 2.6.24-gentoo-r8 to 2.6.31-gentoo-r6.

This is how the error manifests itself on our server's console:
fs1 Equipment # pwd
/home/share/Projects/Equipment
fs1 Equipment # cat Equipment\ List.xls
cat: Equipment List.xls: Input/output error
fs1 Equipment # dmesg
REISERFS warning (device dm-0): jdm-20002 reiserfs_xattr_get: Invalid hash for
xattr (system.posix_acl_access) associated with [1953724787 1882090853
0x7869736f UNKNOWN]

We can fix each of these errors individually:
# For directories we need to run this extra first step
# setfattr -x system.posix_acl_default Equipment\ Directory
setfattr -x system.posix_acl_access Equipment\ List.xls
# copy permissions from current directory to fix file
getfacl . | setfacl -M - Equipment\ List.xls

For many instances within a directory structure:
# This will find corrupted ACLs recursively starting from where you are
getfattr -Rd -m '.*' . 2>&1 | grep 'Input/output error' | cut -d: -f1

I slapped together a poor man's recursive function since setfattr does not
support a '-R' option:
# first, find a good ACL and then back it up
getfacl . > backup.acl
# These next two commands are almost equivalent to "setfacl -Rb ."
# Note: you may need to run these two commands several times to fix everything
# Note: it will fail on files with apostrophes, but you could temporarily
rename them...
find . -name '*' | xargs -i setfattr -x system.posix_acl_default "{}"
find . -name '*' | xargs -i setfattr -x system.posix_acl_access "{}"
# now we recursively restore all the ACLs from the good ACL
cat backup.acl | setfacl -RM - .

Google shows me that this issue is not new:
http://old.nabble.com/jdm-20002-reiserfs_xattr_get:-Invalid-hash-for-xattr-td26786353.html

It might be caused by a locking error:
http://markmail.org/thread/zrrenmncxisqlooc

Looking towards a permanent solution, I e-mailed Jeff Mahoney at SUSE who was
the last one to work with the reiserfs xattr code:
http://ftp.suse.com/pub/people/jeffm/reiserfs/xattr-rework/

Linus committed Jeff's new code to the mainline "stable" kernel on March 30,
2009:
http://kerneltrap.org/mailarchive/git-commits-head/2009/3/30/5337714

And it got implemented with this patch:
http://www.kernel.org/pub/linux/kernel/v2.6/snapshots/patch-2.6.29-git7.log

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
