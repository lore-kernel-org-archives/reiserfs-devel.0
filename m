From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 error
Date: Tue, 23 Dec 2003 20:07:24 +0300
Message-ID: <200312232007.24126.vitaly@namesys.com>
References: <20031223160715.26652.qmail@ninja.dynup.net>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_MZH6/JI0LyEzn/c"
Return-path: <reiserfs-list-return-16396-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031223160715.26652.qmail@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <jedi@ninja.dynup.net>
Cc: reiserfs-list@namesys.com

--Boundary-00=_MZH6/JI0LyEzn/c
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello, David.

On Tuesday 23 December 2003 19:07, David Masover wrote:
> # fsck.reiser4 /dev/hda8
> *** lots of warnings ***
> Fscking the /dev/hda8 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): Yes
> ***** Openning the fs.
> umka-2198: Assertion (oid != NULL) at oid.c:161 in function
> reiser4_oid_layout() failed.
> Aborted
>
> Can this fs be saved easily?

what reiser4progs version do you use? 0.4.20?
Probably this patch will solve the problem, would you try it?

-- 
Thanks,
Vitaly Fertman
--Boundary-00=_MZH6/JI0LyEzn/c
Content-Type: text/x-diff;
  charset="windows-1251";
  name="repair_fs_open.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repair_fs_open.patch"

===== librepair/filesystem.c 1.83 vs edited =====
--- 1.83/librepair/filesystem.c	Sat Dec 20 16:52:10 2003
+++ edited/librepair/filesystem.c	Tue Dec 23 20:04:52 2003
@@ -48,28 +48,6 @@
 		goto error_format_close;
 	}
 	
-	res |= repair_journal_open(repair->fs, journal_device, repair->mode);
-	
-	if (repair_error_fatal(res)) {
-		aal_fatal("Failed to open the journal.");
-		goto error_status_close;
-	}
-	
-	res |= repair_journal_replay(repair->fs->journal, repair->fs->device);
-	
-	if (repair_error_fatal(res)) {
-		aal_fatal("Failed to replay the journal.");
-		goto error_journal_close;
-	}
-	
-	res |= repair_format_update(repair->fs->format);
-	
-	if (repair_error_fatal(res)) {
-		aal_fatal("Failed to update the format after journal "
-			  "replaying.");
-		goto error_journal_close;
-	}
-
 	len = reiser4_format_get_len(repair->fs->format);
 
 	/* Block and oid allocator plugins are specified by format plugin 
@@ -77,7 +55,7 @@
 	if (!(repair->fs->alloc = reiser4_alloc_open(repair->fs, len))) {
 		aal_fatal("Failed to open a block allocator.");
 		res = -EINVAL;
-		goto error_journal_close;
+		goto error_status_close;
 	}
 	
 	if ((res |= error = reiser4_alloc_valid(repair->fs->alloc)) < 0)
@@ -92,25 +70,46 @@
 		goto error_alloc_close;
 	}
 
+	res |= repair_journal_open(repair->fs, journal_device, repair->mode);
+	
+	if (repair_error_fatal(res)) {
+		aal_fatal("Failed to open the journal.");
+		goto error_oid_close;
+	}
+	
+	res |= repair_journal_replay(repair->fs->journal, repair->fs->device);
+	
+	if (repair_error_fatal(res)) {
+		aal_fatal("Failed to replay the journal.");
+		goto error_journal_close;
+	}
+	
+	res |= repair_format_update(repair->fs->format);
+	
+	if (repair_error_fatal(res)) {
+		aal_fatal("Failed to update the format after journal "
+			  "replaying.");
+		goto error_journal_close;
+	}
+	
 	if (!(repair->fs->tree = reiser4_tree_init(repair->fs))) {
 		res = -ENOMEM;
-		goto error_oid_close;
+		goto error_journal_close;
 	}
 		
-	
 	repair_error_count(repair, res);
 	return 0;
 
+error_journal_close:
+	reiser4_journal_close(repair->fs->journal);
+	repair->fs->journal = NULL;
+
  error_oid_close:
 	reiser4_tree_fini(repair->fs->tree);
 	
  error_alloc_close:
 	reiser4_alloc_close(repair->fs->alloc);
 	repair->fs->alloc = NULL;
-    
- error_journal_close:
-	reiser4_journal_close(repair->fs->journal);
-	repair->fs->journal = NULL;
 
  error_status_close:
 	reiser4_status_close(repair->fs->status);

--Boundary-00=_MZH6/JI0LyEzn/c--


