From: Jeff Mahoney <jeffm@novell.com>
Subject: [PATCH] Support for unsupported options.
Date: Fri, 08 Oct 2004 16:41:32 -0400
Message-ID: <4166FB7C.9040707@novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050306060500060006080506"
Return-path: <reiserfs-list-return-22031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------050306060500060006080506
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Yes, the subject sounds silly, but it's needed.

The set of allowable mount options shouldn't change based on the running
kernel configuration. The feature that the option corresponds to may be
unavailable, but it should be sufficient to warn the user that the the
feature is disabled, but the mount has succeeded.

Ext3 does this for things like acl/xattr, and I feel that we should as well.

Fortunately, the code to implement it is trivial.

Attached are two patches.
* reiserfs-unsupported-opts.diff
~  - Adds a REISERFS_UNSUPPORTED_OPT mount flag, and uses it to denote
~    when a mount option is allowed, but not supported in the running
~    configuration.
~  - Rather than setting/clearing this bit, it's treated as special
~    and issues a warning using the name of the mount option.
* reiserfs-unsupported-acl.diff
~  - Uses the above flag to denote ACLs and user xattrs as unsupported
~    when support is not compiled in.

Currently, if a filesystem is mounted with -oacl and they are not
compiled in, the filesystem will fail to mount.

Hans - Please take a quick look, I'd like to get this one upstream ASAP.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBZvt8LPWxlyuTD7IRAkVsAKCSEcslVXF9PUSQpP9DAUGgYzKCawCfeG8W
ZvCfZtmxZlmdxs6cU7AzOh4=
=iQbU
-----END PGP SIGNATURE-----

--------------050306060500060006080506
Content-Type: text/plain;
 name="reiserfs-unsupported-acl.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-unsupported-acl.diff"

This patch uses the REISERFS_UNSUPPORTED_OPT flag to denote -o(no)acl, and
-o(no)user_xattr as unsupported, but allowable, when support isn't built into
the kernel.

Signed-off-by: Jeff Mahoney <jeffm@novell.com>

diff -ruPX dontdiff linux-2.6.8/fs/reiserfs/super.c linux-2.6.8.fix/fs/reiserfs/super.c
--- linux-2.6.8/fs/reiserfs/super.c	2004-10-08 16:46:09.070660248 -0400
+++ linux-2.6.8.fix/fs/reiserfs/super.c	2004-10-08 16:42:59.896419104 -0400
@@ -741,11 +747,19 @@
 	{"conv",	.setmask = 1<<REISERFS_CONVERT},
 	{"attrs",	.setmask = 1<<REISERFS_ATTRS},
 	{"noattrs",	.clrmask = 1<<REISERFS_ATTRS},
+#ifdef CONFIG_REISERFS_FS_XATTR
 	{"user_xattr",	.setmask = 1<<REISERFS_XATTRS_USER},
 	{"nouser_xattr",.clrmask = 1<<REISERFS_XATTRS_USER},
+#else
+	{"user_xattr",	.setmask = 1<<REISERFS_UNSUPPORTED_OPT},
+	{"nouser_xattr",.clrmask = 1<<REISERFS_UNSUPPORTED_OPT},
+#endif
 #ifdef CONFIG_REISERFS_FS_POSIX_ACL
 	{"acl",		.setmask = 1<<REISERFS_POSIXACL},
 	{"noacl",	.clrmask = 1<<REISERFS_POSIXACL},
+#else
+	{"acl",		.setmask = 1<<REISERFS_UNSUPPORTED_OPT},
+	{"noacl",	.clrmask = 1<<REISERFS_UNSUPPORTED_OPT},
 #endif
 	{"nolog",},	 /* This is unsupported */
 	{"replayonly",	.setmask = 1<<REPLAYONLY},

--------------050306060500060006080506
Content-Type: text/plain;
 name="reiserfs-unsupported-opts.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-unsupported-opts.diff"

This patch adds a REISERFS_UNSUPPORTED_OPT flag to denote when a mount option
is allowable, but is unsupported in the running configuration. This allows
the potential for the set of mount options to be consistent, regardless of
what features the kernel is compiled with.

Rather than failing the mount, a warning is issued and the mount succeeds.

Signed-off-by: Jeff Mahoney <jeffm@novell.com>

diff -ruPX dontdiff linux-2.6.8/fs/reiserfs/super.c linux-2.6.8.fix/fs/reiserfs/super.c
--- linux-2.6.8/fs/reiserfs/super.c	2004-10-08 16:46:09.070660248 -0400
+++ linux-2.6.8.fix/fs/reiserfs/super.c	2004-10-08 16:42:59.896419104 -0400
@@ -659,8 +659,14 @@
     for (opt = opts; opt->option_name; opt ++) {
 	if (!strncmp (p, opt->option_name, strlen (opt->option_name))) {
 	    if (bit_flags) {
-		*bit_flags &= ~opt->clrmask;
-		*bit_flags |= opt->setmask;
+                if (opt->clrmask == (1 << REISERFS_UNSUPPORTED_OPT))
+                    reiserfs_warning (s, "%s not supported.", p);
+                else
+                    *bit_flags &= ~opt->clrmask;
+                if (opt->setmask == (1 << REISERFS_UNSUPPORTED_OPT))
+                    reiserfs_warning (s, "%s not supported.", p);
+                else
+                    *bit_flags |= opt->setmask;
 	    }
 	    break;
 	}
diff -ruPX dontdiff linux-2.6.8/include/linux/reiserfs_fs_sb.h linux-2.6.8.fix/include/linux/reiserfs_fs_sb.h
--- linux-2.6.8/include/linux/reiserfs_fs_sb.h	2004-10-08 16:46:04.541348808 -0400
+++ linux-2.6.8.fix/include/linux/reiserfs_fs_sb.h	2004-10-08 16:31:50.641161368 -0400
@@ -467,6 +467,7 @@
     REISERFS_TEST2,
     REISERFS_TEST3,
     REISERFS_TEST4,
+    REISERFS_UNSUPPORTED_OPT,
 };
 
 #define reiserfs_r5_hash(s) (REISERFS_SB(s)->s_mount_opt & (1 << FORCE_R5_HASH))

--------------050306060500060006080506--
