From: Oleg Drokin <green@namesys.com>
Subject: Re: need attrs patch for 2.5.44-ac3
Date: Wed, 30 Oct 2002 09:16:50 +0300
Message-ID: <20021030091650.A4480@namesys.com>
References: <20021026230215.GA3258@yzero> <20021028193322.C1171@namesys.com> <20021029000923.GA527@yzero> <20021029090433.A5090@namesys.com> <20021029220130.GA9007@yzero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021029220130.GA9007@yzero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Oct 29, 2002 at 05:01:30PM -0500, Tom Vier wrote:
> > In order for attributes to work you need to mount the volume with -o attrs.
> > Without that you can only get/set attributes value.
> i'm using the same /etc/fstab with attrs for 2.4 and it works. i haven't
> tried mounting another reiserfs, so i don't know if it's just the rootfs
> that's affected.

Ah, so it's the rootfs, that explains. Patch for remounting options is not
included in 2.5, see below for the patch.

Bye,
    Oleg

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.664   -> 1.665  
#	 fs/reiserfs/super.c	1.56    -> 1.57   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 02/10/02	green@angband.namesys.com	1.665
# reiserfs: Allow for remount options to take effect.
# --------------------------------------------
#
diff -Nru a/fs/reiserfs/super.c b/fs/reiserfs/super.c
--- a/fs/reiserfs/super.c	Wed Oct 30 09:16:24 2002
+++ b/fs/reiserfs/super.c	Wed Oct 30 09:16:24 2002
@@ -726,6 +726,20 @@
 
   if (!reiserfs_parse_options(s, arg, &mount_options, &blocks, NULL))
     return -EINVAL;
+
+#define SET_OPT( opt, bits, super )                                     \
+    if( ( bits ) & ( 1 << ( opt ) ) )                                   \
+            REISERFS_SB( super ) -> s_mount_opt |= ( 1 << ( opt ) )
+
+  /* set options in the super-block bitmask */
+  SET_OPT( REISERFS_LARGETAIL, mount_options, s );
+  SET_OPT( REISERFS_SMALLTAIL, mount_options, s );
+  SET_OPT( REISERFS_NO_BORDER, mount_options, s );
+  SET_OPT( REISERFS_NO_UNHASHED_RELOCATION, mount_options, s );
+  SET_OPT( REISERFS_HASHED_RELOCATION, mount_options, s );
+  SET_OPT( REISERFS_TEST4, mount_options, s );
+  SET_OPT( REISERFS_ATTRS, mount_options, s );
+#undef SET_OPT
   
   handle_attrs( s );
 
