From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Wed, 12 Mar 2003 23:51:47 +0300
Message-ID: <3E6F9DE3.2070902@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com>	 <20030311194205.A4493@namesys.com> <1047499021.8219.604.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1047499021.8219.604.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Chris Mason wrote:

>[ dirid based grouping spreads things out too much on the disk ]
>
>So, trying to summarize so far, we know we want to group things on the
>disk somehow, but we don't really have a good metric to use.  Using the
>parent directory objectid as the grouping metric spreads things evenly
>out on the disk, resulting in lots of seeks when we read a given
>directory tree.  There are some cases where this breaks down badly,
>like  lots of directories with just a few files each.
>
>defragmenting tools are nice and all, but before we can write one we
>actually have to pick a disk layout for the tool to create ;-)
>
>The btree already has a metric for grouping, it's the packing locality. 
>I realized this morning that we just aren't being very smart about how
>we use it.  If one directory has 1 thousand subdirs with 1 file each,
>should they all be in different packing localities? 
>
> probably not.
>
I would also like an API for letting users/apps choose packing 
localities, that way an rpm package can all go into the same packing 
locality even though semantically it scatters files across ten 
directories.  What do you think?

>
>So I played around with the patch below, it tries to define a span over
>which a given packing locality used.  When new files or directories are
>created, their packing locality is chosen based on how much of the tree
>the packing locality of their parent directory is using.
>
This is cool.  Good heuristic!

>
>If the span is small, the packing locality of the parent dir is used as
>the packing locality of the new file/dir.  If the span is large, the
>objectid of the parent dir is used as the packing locality of the new
>file/dir.
>
>The patch below is really rough, but when used with the dirid_group
>allocator, it performs the same as skip_busy alone for reading a
>recently created directory.  I need to make sure it doesn't have the
>same fragmentation problems as skip_busy alone though.
>
>(this was against a data logging tree, it is meant for review only and
>not to be applied)
>
>--- linux.beta3.2/fs/reiserfs/inode.c	2003-03-12 14:32:41.000000000
>-0500
>+++ linux.beta3/fs/reiserfs/inode.c	2003-03-12 14:30:35.000000000 -0500
>@@ -1646,6 +1646,8 @@
>     struct cpu_key key;
>     struct item_head ih;
>     struct stat_data sd;
>+    __u32 packing;
>+    __u32 checked_packing = 0;
>     int retval;
>     int err ;
>   
>@@ -1663,9 +1665,12 @@
>     if( S_ISLNK( inode -> i_mode ) )
> 	    inode -> i_flags &= ~ ( S_IMMUTABLE | S_APPEND );
> 
>-    /* item head of new item */
>-    ih.ih_key.k_dir_id = INODE_PKEY (dir)->k_objectid;
>+    packing = INODE_PKEY(dir)->k_dir_id;
>     ih.ih_key.k_objectid = cpu_to_le32 (reiserfs_get_unused_objectid
>(th));
>+
>+packing_restart:
>+    /* item head of new item */
>+    ih.ih_key.k_dir_id = packing;
>     if (!ih.ih_key.k_objectid) {
> 	err = -ENOMEM ;
> 	goto out_bad_inode ;
>@@ -1718,6 +1723,14 @@
> 	err = -EEXIST;
> 	goto out_bad_inode;
>     }
>+    if (!checked_packing) {
>+	checked_packing = choose_packing(dir, &path_to_key);
>+	if (checked_packing != packing) {
>+	    packing = checked_packing;
>+	    pathrelse(&path_to_key);
>+	    goto packing_restart;
>+	}
>+    }
> 
>     if (old_format_only (sb)) {
> 	if (inode->i_uid & ~0xffff || inode->i_gid & ~0xffff) {
>diff -ur linux.beta3.2/fs/reiserfs/stree.c
>linux.beta3/fs/reiserfs/stree.c
>--- linux.beta3.2/fs/reiserfs/stree.c	2003-03-12 14:32:41.000000000
>-0500
>+++ linux.beta3/fs/reiserfs/stree.c	2003-03-12 14:31:43.000000000 -0500
>@@ -296,6 +296,56 @@
> /* Maximal possible key. It is never in the tree. */
> const struct key  MAX_KEY = {0xffffffff, 0xffffffff, {{0xffffffff,
>0xffffffff},}};
> 
>+static int packing_locality_span(struct super_block *sb, 
>+                                 struct path *path, __u32 cpu_packing) 
>+{
>+    int path_offset;
>+    int pos;
>+    int levels = 1;
>+    struct buffer_head *bh;
>+    struct key *key;
>+
>+    path_offset = path->path_length;
>+
>+    while ( path_offset-- > FIRST_PATH_ELEMENT_OFFSET ) {
>+        pos = PATH_OFFSET_POSITION(path, path_offset);
>+	bh = PATH_OFFSET_PBUFFER(path, path_offset);
>+
>+	if (!B_IS_IN_TREE(bh))
>+	    break;
>+
>+	if (pos) {
>+	    /* check left */
>+	    key = B_N_PDELIM_KEY(bh, pos - 1);
>+	    if (le32_to_cpu(key->k_dir_id) != cpu_packing) {
>+	        return levels;
>+	    }
>+	}
>+	if (pos != B_NR_ITEMS(bh)) {
>+	    key = B_N_PDELIM_KEY(bh, pos + 1);
>+	    if (le32_to_cpu(key->k_dir_id) != cpu_packing) {
>+	        return levels;
>+	    }
>+	}
>+        levels++;
>+    }
>+    return levels;
>+}
>+
>+/* returns an le32 packing locality */
>+__u32 choose_packing(struct inode *parent, struct path *path)
>+{
>+    __u32 grandparent;
>+    int levels;
>+
>+    grandparent = le32_to_cpu(INODE_PKEY(parent)->k_dir_id);
>+
>+    levels = packing_locality_span(parent->i_sb, path, grandparent);
>+    if (levels <= 2) {
>+        return INODE_PKEY(parent)->k_dir_id;
>+    }
>+    return INODE_PKEY(parent)->k_objectid;
>+}
> 
> /* Get delimiting key of the buffer by looking for it in the buffers in
>the path, starting from the bottom
>    of the path, and going upwards.  We must check the path's validity
>at each step.  If the key is not in
>
>
>
>
>
>  
>


-- 
Hans


