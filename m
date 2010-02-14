From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14826] jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Sun, 14 Feb 2010 00:37:50 GMT
Message-ID: <201002140037.o1E0boSp005597@demeter.kernel.org>
References: <bug-14826-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-14826-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14826


Jethro Beekman <kernel@jbeekman.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel@jbeekman.nl




--- Comment #1 from Jethro Beekman <kernel@jbeekman.nl>  2010-02-14 00:37:47 ---
I can confirm that these messages keep popping up, seemingly at random, since I
upgraded to 2.6.32. This is a *huge* problem when using ACLs, as the file
becomes inaccessible.

$cat thefile.xlsx 
cat: thefile.xlsx: Input/output error
$

And in the logs:
Feb 14 01:24:58 victoria [1149610.665902] REISERFS warning (device dm-0):
jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (system.posix_acl_access)
associated with [1953724787 1882090853 0x7869736f UNKNOWN]

I first noticed this because my automated backups failed. At first it seems
this problem happened to a file only for a short period, because the backup
would not complain about the same file twice in a row and I can access the
failing files now, but for some time now I'm getting the error on one
particular file.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
