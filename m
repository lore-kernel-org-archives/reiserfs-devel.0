From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: [PATCH] Fix for reiserfsck mishandling hash=0
Date: Thu, 16 Sep 2004 16:35:49 +0400
Message-ID: <200409161635.49848.vitaly@namesys.com>
References: <41484914.1000109@suse.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_liYSBen9H7hm0tZ"
Return-path: <reiserfs-list-return-21808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41484914.1000109@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

--Boundary-00=_liYSBen9H7hm0tZ
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 September 2004 17:52, Jeff Mahoney wrote:
> Hey all -
>
> When reiserfsck traverses the tree looking for errors, one of the checks
> it performs is to see if the hash on disk matches the expected hash,
> computed from the filename.
>
> However, the handling of hash = 0 is broken in reiserfsck. In the
> kernel, hash = 0 is considered special and is adjusted to 0x80.
> reiserfsck doesn't perform this adjustment, and yields fatal errors with
> ~ instructions to use --rebuild-tree, even though no such error exists.
>
> reiserfs_add_entry() in the semantic rebuild uses the correct
> adjustment, from hash_value()
>
> This filename has hash = 0:
> G60V0AAT6HJ0000000000000001IC8TRGDUN604xDOCCM2IFN304Q~GM~M2
>
> Attached is a patch to good_name(), allowing reiserfsprogs to properly
> handle filenames with hash = 0.
>
> Please apply.

Thank you for hitting the bug. The problem seems a bit larger,
the attached patch fixes rebuild-tree behaviour also.

-- 
Thanks,
Vitaly Fertman

--Boundary-00=_liYSBen9H7hm0tZ
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiserfsprogs_hash.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfsprogs_hash.patch"

diff -Nru a/reiserfsprogs/debugreiserfs/unpack.c b/reiserfsprogs/debugreiserfs/unpack.c
--- a/reiserfsprogs/debugreiserfs/unpack.c	Thu Sep 16 16:14:40 2004
+++ b/reiserfsprogs/debugreiserfs/unpack.c	Thu Sep 16 16:14:40 2004
@@ -128,8 +128,7 @@
 	    /* old or new ".." */
 	    set_deh_offset (deh, DOT_DOT_OFFSET);
 	else if (hash_func)
-	    set_deh_offset (deh, GET_HASH_VALUE (hash_func (item + location,
-							    namelen)));
+	    set_deh_offset (deh, hash_value(hash_func, item + location, namelen));
 	if (mask & HAS_GEN_COUNTER) {
 	    fread_le16 (&gen_counter);
 	    set_deh_offset (deh, get_deh_offset (deh) | gen_counter);
diff -Nru a/reiserfsprogs/fsck/pass0.c b/reiserfsprogs/fsck/pass0.c
--- a/reiserfsprogs/fsck/pass0.c	Thu Sep 16 16:14:40 2004
+++ b/reiserfsprogs/fsck/pass0.c	Thu Sep 16 16:14:40 2004
@@ -365,8 +365,7 @@
 	    hash_code = 0;
 
 	    for (j = min_length; j <= max_length; j ++) {
-		hash_code = find_hash_in_use (name, j,
-					      GET_HASH_VALUE (get_deh_offset (deh + i)),
+		hash_code = find_hash_in_use (name, j, get_deh_offset (deh + i),
 					      get_sb_hash_code (fs->fs_ondisk_sb));
 /*		add_hash_hit (fs, hash_code);*/
 		if (code2func (hash_code) != 0) {
diff -Nru a/reiserfsprogs/fsck/pass1.c b/reiserfsprogs/fsck/pass1.c
--- a/reiserfsprogs/fsck/pass1.c	Thu Sep 16 16:14:40 2004
+++ b/reiserfsprogs/fsck/pass1.c	Thu Sep 16 16:14:40 2004
@@ -363,8 +363,7 @@
 		    continue;
 		}
 
-		hash_code = find_hash_in_use (name, name_len,
-					      GET_HASH_VALUE (get_deh_offset (deh + j)),
+		hash_code = find_hash_in_use (name, name_len, get_deh_offset (deh + j),
 					      get_sb_hash_code (fs->fs_ondisk_sb));
 		if (hash_code != get_sb_hash_code (fs->fs_ondisk_sb)) {
 		    fsck_log ("pass1: block %lu, item %d, entry %d: The entry \"%.*s\" of the %k is hashed with %s "
diff -Nru a/reiserfsprogs/include/reiserfs_lib.h b/reiserfsprogs/include/reiserfs_lib.h
--- a/reiserfsprogs/include/reiserfs_lib.h	Thu Sep 16 16:14:40 2004
+++ b/reiserfsprogs/include/reiserfs_lib.h	Thu Sep 16 16:14:40 2004
@@ -135,6 +135,8 @@
 int  comp_short_keys (const void * p_s_key1, const void * p_s_key2);
 int comp_items (struct item_head  * p_s_ih, struct path * p_s_path);
 
+__u32 hash_value (hashf_t func, char * name, int namelen);
+
 int create_dir_sd (reiserfs_filsys_t * fs,
 		    struct path * path, struct key * key,
 		    void (*modify_item)(struct item_head *, void *));
@@ -279,7 +281,7 @@
 int func2code (hashf_t func);
 hashf_t code2func (unsigned int code);
 hashf_t name2func (char * hash);
-int find_hash_in_use (char * name, int namelen, __u32 hash_value_masked, unsigned int code_to_try_first);
+int find_hash_in_use (char * name, int namelen, __u32 deh_offset, unsigned int code_to_try_first);
 
 int entry_length (struct item_head * ih, struct reiserfs_de_head * deh,
 		  int pos_in_item);
diff -Nru a/reiserfsprogs/reiserfscore/node_formats.c b/reiserfsprogs/reiserfscore/node_formats.c
--- a/reiserfsprogs/reiserfscore/node_formats.c	Thu Sep 16 16:14:40 2004
+++ b/reiserfsprogs/reiserfscore/node_formats.c	Thu Sep 16 16:14:40 2004
@@ -528,7 +528,7 @@
 
 
 #define good_name(hashfn,name,namelen,deh_offset) \
-(GET_HASH_VALUE ((hashfn) (name, namelen)) == GET_HASH_VALUE (deh_offset))
+(hash_value (hashfn, name, namelen) == GET_HASH_VALUE (deh_offset))
 
 
 /* this also sets hash function */
@@ -579,7 +579,7 @@
 }
 
 
-int find_hash_in_use (char * name, int namelen, __u32 hash_value_masked, unsigned int code_to_try_first)
+int find_hash_in_use (char * name, int namelen, __u32 offset, unsigned int code_to_try_first)
 {
     unsigned int i;
 
@@ -587,14 +587,14 @@
 	return UNSET_HASH;
 
     if (code_to_try_first) {
-	if (hash_value_masked == GET_HASH_VALUE (hashes [code_to_try_first].func (name, namelen)))
+	if (good_name (hashes [code_to_try_first].func, name, namelen, offset))
 	    return code_to_try_first;
     }
     
     for (i = 1; i < HASH_AMOUNT; i ++) {
 	if (i == code_to_try_first)
 	    continue;
-	if (hash_value_masked == GET_HASH_VALUE (hashes [i].func (name, namelen)))
+	if (good_name (hashes [i].func, name, namelen, offset))
 	    return i;
     }
 
diff -Nru a/reiserfsprogs/reiserfscore/prints.c b/reiserfsprogs/reiserfscore/prints.c
--- a/reiserfsprogs/reiserfscore/prints.c	Thu Sep 16 16:14:40 2004
+++ b/reiserfsprogs/reiserfscore/prints.c	Thu Sep 16 16:14:40 2004
@@ -332,8 +332,7 @@
 			  GET_HASH_VALUE (get_deh_offset (deh)),
 			  GET_GENERATION_NUMBER (get_deh_offset (deh)),
 			  get_deh_location (deh), get_deh_state (deh),
-			  code2name (find_hash_in_use (name, namelen, 
-						       GET_HASH_VALUE (get_deh_offset (deh)),
+			  code2name (find_hash_in_use (name, namelen, get_deh_offset (deh),
 						       fs ? get_sb_hash_code (fs->fs_ondisk_sb) : UNSET_HASH)));
 	/*fs ? (is_properly_hashed (fs, name, namelen, deh_offset (deh)) ? "" : "(BROKEN)") : "??");*/
     }
diff -Nru a/reiserfsprogs/reiserfscore/reiserfslib.c b/reiserfsprogs/reiserfscore/reiserfslib.c
--- a/reiserfsprogs/reiserfscore/reiserfslib.c	Thu Sep 16 16:14:40 2004
+++ b/reiserfsprogs/reiserfscore/reiserfslib.c	Thu Sep 16 16:14:40 2004
@@ -839,16 +839,11 @@
 
 /*===========================================================================*/
 
-static __u32 hash_value (reiserfs_filsys_t * fs, char * name)
+__u32 hash_value (hashf_t func, char * name, int namelen)
 {
     __u32 res;
 
-    if (!strcmp (name, "."))
-	return DOT_OFFSET;
-    if (!strcmp (name, ".."))
-	return DOT_DOT_OFFSET;
-
-    res = reiserfs_hash (fs) (name, strlen (name));    
+    res = func (name, namelen);
     res = GET_HASH_VALUE(res);
     if (res == 0)
 	res = 128;
@@ -871,7 +866,12 @@
     
     set_key_dirid (&entry_key, get_key_dirid (dir));
     set_key_objectid (&entry_key, get_key_objectid (dir));
-    hash = hash_value (fs, name);
+    if (!strcmp (name, "."))
+	hash = DOT_OFFSET;
+    else if (!strcmp (name, ".."))
+	hash = DOT_DOT_OFFSET;
+    else
+	hash = hash_value (reiserfs_hash (fs), name, strlen (name));
     set_key_offset_v1 (&entry_key, hash);
     set_key_uniqueness (&entry_key, DIRENTRY_UNIQUENESS);
 
@@ -948,7 +948,12 @@
 
     set_key_dirid (&entry_key, get_key_dirid (dir));
     set_key_objectid (&entry_key, get_key_objectid (dir));
-    hash = hash_value (fs, name);
+    if (!strcmp (name, "."))
+	hash = DOT_OFFSET;
+    else if (!strcmp (name, ".."))
+	hash = DOT_DOT_OFFSET;
+    else
+	hash = hash_value (reiserfs_hash (fs), name, strlen (name));
     set_key_offset_v1 (&entry_key, hash);
     set_key_uniqueness (&entry_key, DIRENTRY_UNIQUENESS);
 
@@ -1060,11 +1065,12 @@
     /* compose entry key to look for its place in the tree */
     set_key_dirid (&(entry_ih.ih_key), get_key_dirid (dir));
     set_key_objectid (&(entry_ih.ih_key), get_key_objectid (dir));
-    hash = hash_value (fs, name) + gen_counter;
     if (!strcmp (name, "."))
 	hash = DOT_OFFSET;
-    if (!strcmp (name, ".."))
+    else if (!strcmp (name, ".."))
 	hash = DOT_DOT_OFFSET;
+    else
+	hash = hash_value (reiserfs_hash (fs), name, strlen (name)) + gen_counter;
     set_key_offset_v1 (&(entry_ih.ih_key), hash);
     set_key_uniqueness (&(entry_ih.ih_key), DIRENTRY_UNIQUENESS);
 

--Boundary-00=_liYSBen9H7hm0tZ--

