From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfsprogs: Warn on block sizes > 4k
Date: Wed, 29 Jun 2005 15:40:49 -0700
Message-ID: <42C32371.5080307@namesys.com>
References: <42B9AAAB.2030208@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B9AAAB.2030208@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, vitaly@thebsh.namesys.com
Cc: ReiserFS List <reiserfs-list@namesys.com>

Vitaly, please reply.  Thanks much Jeff, we needed this.

Hans

Jeff Mahoney wrote:

>
> Hello all -
>
> Filesystems created with block size > page size will not work until that
> support is added to the kernel. Filesystems with block size > 4k (lowest
> page size supported in Linux) will not work on all systems. This patch
> adds a check and a warning in those conditions, informing the user of
> the caveats of using a larger block size. It can be overridden with -f.
>
> Patch attached, please apply.
>
> -Jeff
>
> --
> Jeff Mahoney
> SuSE Labs


-------------------------

Subject: [PATCH] reiserfsprogs: Warn on block sizes > 4k
From: Jeff Mahoney <jeffm@suse.com>

 Filesystems created with block size > page size will not work until that
 support is added to the kernel. Filesystems with block size > 4k (lowest
 page size supported in Linux) will not work on all systems. This patch
 adds a check and a warning in those conditions, informing the user of the
 caveats of using a larger block size. It can be overridden with -f.

diff -ruNp reiserfsprogs-3.6.19/mkreiserfs/mkreiserfs.c
reiserfsprogs-3.6.19.devel/mkreiserfs/mkreiserfs.c
--- reiserfsprogs-3.6.19/mkreiserfs/mkreiserfs.c    2004-09-30
23:04:21.000000000 +0200
+++ reiserfsprogs-3.6.19.devel/mkreiserfs/mkreiserfs.c    2005-06-22
19:26:58.221711866 +0200
@@ -684,6 +684,9 @@ int main (int argc, char **argv)
     
     if (!(mode & QUIET_MODE) && !can_we_format_it (device_name, force))
         return 1;
+
+    if (!(mode & QUIET_MODE) && !block_size_ok (Block_size, force))
+        return 1;
     
     if (jdevice_name)
         if (!(mode & QUIET_MODE) && !can_we_format_it (jdevice_name,
force))
diff -ruNp reiserfsprogs-3.6.19/reiserfscore/reiserfslib.c
reiserfsprogs-3.6.19.devel/reiserfscore/reiserfslib.c
--- reiserfsprogs-3.6.19/reiserfscore/reiserfslib.c    2004-10-04
22:39:35.000000000 +0200
+++ reiserfsprogs-3.6.19.devel/reiserfscore/reiserfslib.c    2005-06-22
20:07:38.015345826 +0200
@@ -1175,6 +1175,24 @@ void make_sure_root_dir_exists (reiserfs
             &parent_root_dir_key, ih_flags);
 }
 
+int block_size_ok (int blocksize, int force)
+{
+    int pagesize = getpagesize();
+    if (blocksize > 4096) {
+        reiserfs_warning (stderr, "Block sizes larger than 4k are not "
+                          "supported on all architectures.\n");
+        if (blocksize > pagesize)
+            reiserfs_warning (stderr, "The newly created filesystem
will not "
+                              "be mountable on this system.\n");
+        else
+            reiserfs_warning (stderr, "The newly created filesystem may
not "
+                              "be mountable on other systems.\n");
+        check_forcing_ask_confirmation (force);
+    }
+
+    return 1;
+}
+
 
 /* we only can use a file for filesystem or journal if it is either not
    mounted block device or regular file and we are forced to use it */


