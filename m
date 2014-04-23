From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 11/29] reiserfs: cleanup, make hash detection saner
Date: Wed, 23 Apr 2014 10:00:44 -0400
Message-ID: <20140423151140.523418072@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-cleanup-make-hash-detection-saner
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

The hash detection code uses long ugly macros multiple times to get the same
value. This patch cleans it up to be easier to read.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/super.c |  108 ++++++++++++++++++++++++----------------------------
 1 file changed, 50 insertions(+), 58 deletions(-)

--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1668,71 +1668,63 @@ static __u32 find_hash_out(struct super_
 	struct cpu_key key;
 	INITIALIZE_PATH(path);
 	struct reiserfs_dir_entry de;
+	struct reiserfs_de_head *deh;
 	__u32 hash = DEFAULT_HASH;
+	__u32 deh_hashval, teahash, r5hash, yurahash;
 
 	inode = s->s_root->d_inode;
 
-	do {			/* Some serious "goto"-hater was there ;) */
-		u32 teahash, r5hash, yurahash;
+	make_cpu_key(&key, inode, ~0, TYPE_DIRENTRY, 3);
+	retval = search_by_entry_key(s, &key, &path, &de);
+	if (retval == IO_ERROR) {
+		pathrelse(&path);
+		return UNSET_HASH;
+	}
+	if (retval == NAME_NOT_FOUND)
+		de.de_entry_num--;
 
-		make_cpu_key(&key, inode, ~0, TYPE_DIRENTRY, 3);
-		retval = search_by_entry_key(s, &key, &path, &de);
-		if (retval == IO_ERROR) {
-			pathrelse(&path);
-			return UNSET_HASH;
-		}
-		if (retval == NAME_NOT_FOUND)
-			de.de_entry_num--;
-		set_de_name_and_namelen(&de);
-		if (deh_offset(&(de.de_deh[de.de_entry_num])) == DOT_DOT_OFFSET) {
-			/* allow override in this case */
-			if (reiserfs_rupasov_hash(s)) {
-				hash = YURA_HASH;
-			}
-			reiserfs_info(s, "FS seems to be empty, autodetect "
-					 "is using the default hash\n");
-			break;
-		}
-		r5hash = GET_HASH_VALUE(r5_hash(de.de_name, de.de_namelen));
-		teahash = GET_HASH_VALUE(keyed_hash(de.de_name, de.de_namelen));
-		yurahash = GET_HASH_VALUE(yura_hash(de.de_name, de.de_namelen));
-		if (((teahash == r5hash)
-		     &&
-		     (GET_HASH_VALUE(deh_offset(&(de.de_deh[de.de_entry_num])))
-		      == r5hash)) || ((teahash == yurahash)
-				      && (yurahash ==
-					  GET_HASH_VALUE(deh_offset
-							 (&
-							  (de.
-							   de_deh[de.
-								  de_entry_num])))))
-		    || ((r5hash == yurahash)
-			&& (yurahash ==
-			    GET_HASH_VALUE(deh_offset
-					   (&(de.de_deh[de.de_entry_num])))))) {
-			reiserfs_warning(s, "reiserfs-2506", "Unable to "
-					 "automatically detect hash function. "
-					 "Please mount with -o "
-					 "hash={tea,rupasov,r5}");
-			hash = UNSET_HASH;
-			break;
-		}
-		if (GET_HASH_VALUE(deh_offset(&(de.de_deh[de.de_entry_num]))) ==
-		    yurahash)
+	set_de_name_and_namelen(&de);
+	deh = de.de_deh + de.de_entry_num;
+
+	if (deh_offset(deh) == DOT_DOT_OFFSET) {
+		/* allow override in this case */
+		if (reiserfs_rupasov_hash(s))
 			hash = YURA_HASH;
-		else if (GET_HASH_VALUE
-			 (deh_offset(&(de.de_deh[de.de_entry_num]))) == teahash)
-			hash = TEA_HASH;
-		else if (GET_HASH_VALUE
-			 (deh_offset(&(de.de_deh[de.de_entry_num]))) == r5hash)
-			hash = R5_HASH;
-		else {
-			reiserfs_warning(s, "reiserfs-2506",
-					 "Unrecognised hash function");
-			hash = UNSET_HASH;
-		}
-	} while (0);
+		reiserfs_info(s, "FS seems to be empty, autodetect is using the default hash\n");
+		goto out;
+	}
+
+	deh_hashval = GET_HASH_VALUE(deh_offset(deh));
+	r5hash = GET_HASH_VALUE(r5_hash(de.de_name, de.de_namelen));
+	teahash = GET_HASH_VALUE(keyed_hash(de.de_name, de.de_namelen));
+	yurahash = GET_HASH_VALUE(yura_hash(de.de_name, de.de_namelen));
+
+	if ((teahash == r5hash && deh_hashval == r5hash) ||
+	    (teahash == yurahash && deh_hashval == yurahash) ||
+	    (r5hash == yurahash && deh_hashval == yurahash)) {
+		reiserfs_warning(s, "reiserfs-2506",
+				 "Unable to automatically detect hash "
+				 "function. Please mount with -o "
+				 "hash={tea,rupasov,r5}");
+		hash = UNSET_HASH;
+		goto out;
+	}
+
+	if (deh_hashval == yurahash)
+		hash = YURA_HASH;
+	else if (deh_hashval == teahash)
+		hash = TEA_HASH;
+	else if (deh_hashval == r5hash)
+		hash = R5_HASH;
+	else {
+		reiserfs_warning(s, "reiserfs-2506",
+				 "Unrecognised hash function");
+		hash = UNSET_HASH;
+		goto out;
+	}
+	return hash;
 
+out:
 	pathrelse(&path);
 	return hash;
 }


