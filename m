From: Jeff Mahoney <jeffm@suse.com>
Subject: Getopt improvements
Date: Wed, 26 Feb 2003 15:42:10 -0500
Message-ID: <3E5D26A2.7010804@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020607030206070207010208"
Return-path: <reiserfs-list-return-12944-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs List <reiserfs-list@namesys.com>

--------------020607030206070207010208
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


	Hey guys -

	Here's a patch against the new reiserfs_getopt stuff.

	There are a few shortcomings with the existing implementation:
	1) There's no easy way to specify the negation of an option. For 
example, in the current implementation, you can do -oremount,attrs - but 
you can't turn them off again. The only way of handling this would have 
been to add another bit.. and then you can't deal with 
-oremount,attrs,noattrs,attrs - which is the correct one in that case? 
Clearly it's the last one, but there's no way to divine that using the 
existing code.

	2) All of the multiple option sets are mutually exclusive. For example, 
-ohash=r5,hash=rupasov would set BOTH FORCE_RUPASOV_HASH and FORCE_R5_HASH.

	The patch addresses both of these problems.
	The first shortcoming is solved by adding a "no_prefix" member to 
opt_desc_t, which allows the option to be negated by prefixing "no" to 
the option text. In addition, I pass in a populated mount_options so 
that bits can be set and cleared on the current running options. The 
result is that as the options are parsed, they are set or cleared in 
order, so -oattrs,noattrs,attrs results in REISERFS_ATTRS being set, but 
-oattrs,noattrs,attrs,noattrs results in it being cleared. This may seem 
silly, but -oremount prepends the mount options from fstab to the mount 
strings, so a filesytem mounted initially with -oattrs, when remounted 
with -oremount,noattrs will actually parse -oremount,attrs,noattrs. I've 
removed the SET_OPT mechanism, since it only sets bits, it doesn't clear 
them. Also, since some options aren't valid during remount (like hashes, 
conversion, etc), I've added a "safe_mask" that only allows the bits 
contained in it to be updated in s_mount_opts.

	The second shortcoming is addressed by clearing all of the bits 
contained in an arg_desc_t array before setting the final value if one 
exists. As with the above solution, the last one on the command line is 
the one that is kept. If, in the future, some multivalue options aren't 
mutually exclusive, it would be trivial to add a "opt_mutex" flag or 
similar to skip this behavior on a per-option basis.

	The end result is this: Except for the addition of "noattrs" as a 
demonstration, the behavior of existing options is unchanged. 
Multi-value options are now handled correctly such that only one of the 
bits can be set at any given time.

	Please apply.

	-Jeff

-- 
jeffm@suse.com
jeffm@csh.rit.edu

--------------020607030206070207010208
Content-Type: text/plain;
 name="vanilla.getopt.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="vanilla.getopt.diff"

Binary files linux-2.4.20.vanilla/fs/reiserfs/.super.c.swp and linux-2.4.20.vanilla.getopt/fs/reiserfs/.super.c.swp differ
diff -ruN linux-2.4.20.vanilla/fs/reiserfs/super.c linux-2.4.20.vanilla.getopt/fs/reiserfs/super.c
--- linux-2.4.20.vanilla/fs/reiserfs/super.c	2002-11-28 18:53:15.000000000 -0500
+++ linux-2.4.20.vanilla.getopt/fs/reiserfs/super.c	2003-02-26 15:03:33.000000000 -0500
@@ -415,6 +415,7 @@
     const arg_desc_t * values; /* list of values accepted by an option */
     int bitmask;  /* bit which is to be set in mount_options bitmask when this
 		     option is selected, 0 is not bits are to be set */
+    int no_prefix : 1; /* "no" can be prefixed to clear this option */
 } opt_desc_t;
 
 
@@ -490,7 +491,13 @@
 	    if (bit_flags && opt->bitmask != -1 )
 		set_bit (opt->bitmask, bit_flags);
 	    break;
-	}
+	} else if (opt->no_prefix && !strncmp (p, "no", 2) &&
+                !strncmp (p + 2, opt->option_name, strlen (opt->option_name))) {
+            if (bit_flags && opt->bitmask != -1)
+                clear_bit (opt->bitmask, bit_flags);
+            p += 2; /* Skip the "no" */
+            break;
+        }
     }
     if (!opt->option_name) {
 	printk ("reiserfs_getopt: unknown option \"%s\"\n", p);
@@ -536,6 +543,14 @@
     /* values possible for this option are listed in opt->values */
     for (arg = opt->values; arg->value; arg ++) {
 	if (!strcmp (p, arg->value)) {
+            const arg_desc_t * arg_clear;
+            /* Clear all the values from this descriptor */
+            for (arg_clear = opt->values; arg_clear->value; arg_clear++) {
+                if (arg_clear->bitmask != -1)
+                    clear_bit (arg_clear->bitmask, bit_flags);
+            }
+
+            /* The the option we found has a bit.. set that */
 	    if (bit_flags && arg->bitmask != -1 )
 		set_bit (arg->bitmask, bit_flags);
 	    return opt->arg_required;
@@ -548,6 +563,7 @@
 
 
 /* returns 0 if something is wrong in option string, 1 - otherwise */
+/* Caller is responsible for clearing mount_options before use if desired */
 static int reiserfs_parse_options (struct super_block * s, char * options, /* string given via mount's -o */
 				   unsigned long * mount_options,
 				   /* after the parsing phase, contains the
@@ -559,18 +575,18 @@
     char * arg = NULL;
     char * pos;
     opt_desc_t opts[] = {
-		{"tails", 't', tails, -1},
-		{"notail", 0, 0, -1}, /* Compatibility stuff, so that -o notail for old setups still work */
-		{"conv", 0, 0, REISERFS_CONVERT}, 
-		{"nolog", 0, 0, -1},
-		{"replayonly", 0, 0, REPLAYONLY},
+		{"tails", 't', tails, -1, 0},
+		{"notail", 0, 0, -1, 0}, /* Compatibility stuff, so that -o notail for old setups still work */
+		{"conv", 0, 0, REISERFS_CONVERT, 0}, 
+		{"nolog", 0, 0, -1, 0},
+		{"replayonly", 0, 0, REPLAYONLY, 0},
 		
-		{"block-allocator", 'a', balloc, -1}, 
-		{"hash", 'h', hash, FORCE_HASH_DETECT},
+		{"block-allocator", 'a', balloc, -1, 0}, 
+		{"hash", 'h', hash, FORCE_HASH_DETECT, 0},
 		
-		{"resize", 'r', 0, -1},
-		{"attrs", 0, 0, REISERFS_ATTRS},
-		{NULL, 0, 0, 0}
+		{"resize", 'r', 0, -1, 0},
+		{"attrs", 0, 0, REISERFS_ATTRS, 1},
+		{NULL, 0, 0, 0, 0}
     };
 	
     *blocks = 0;
@@ -578,9 +594,6 @@
 	/* use default configuration: create tails, journaling on, no
 	   conversion to newest format */
 	return 1;
-    else
-	/* Drop defaults to zeroes */
-	*mount_options = 0;
     
     for (pos = options; pos; ) {
 	c = reiserfs_getopt (s, &pos, opts, &arg, mount_options);
@@ -634,26 +647,26 @@
   struct reiserfs_super_block * rs;
   struct reiserfs_transaction_handle th ;
   unsigned long blocks;
-  unsigned long mount_options = 0;
+  unsigned long mount_options = s->u.reiserfs_sb.s_mount_opt;
+  unsigned long safe_mask = 0;
 
   rs = SB_DISK_SUPER_BLOCK (s);
 
   if (!reiserfs_parse_options(s, data, &mount_options, &blocks))
   	return 0;
 
-#define SET_OPT( opt, bits, super )					\
-    if( ( bits ) & ( 1 << ( opt ) ) )					\
-	    ( super ) -> u.reiserfs_sb.s_mount_opt |= ( 1 << ( opt ) )
-
-  /* set options in the super-block bitmask */
-  SET_OPT( REISERFS_SMALLTAIL, mount_options, s );
-  SET_OPT( REISERFS_LARGETAIL, mount_options, s );
-  SET_OPT( REISERFS_NO_BORDER, mount_options, s );
-  SET_OPT( REISERFS_NO_UNHASHED_RELOCATION, mount_options, s );
-  SET_OPT( REISERFS_HASHED_RELOCATION, mount_options, s );
-  SET_OPT( REISERFS_TEST4, mount_options, s );
-  SET_OPT( REISERFS_ATTRS, mount_options, s );
-#undef SET_OPT
+  /* Add options that are safe here */
+  safe_mask |= 1 << REISERFS_SMALLTAIL;
+  safe_mask |= 1 << REISERFS_LARGETAIL;
+  safe_mask |= 1 << REISERFS_NO_BORDER;
+  safe_mask |= 1 << REISERFS_NO_UNHASHED_RELOCATION;
+  safe_mask |= 1 << REISERFS_HASHED_RELOCATION;
+  safe_mask |= 1 << REISERFS_TEST4;
+  safe_mask |= 1 << REISERFS_ATTRS;
+
+  /* Update the bitmask, taking care to keep
+   * the bits we're not allowed to change here */
+  s->u.reiserfs_sb.s_mount_opt = (s->u.reiserfs_sb.s_mount_opt & ~safe_mask) | (mount_options & safe_mask);
 
   handle_attrs( s );
 

--------------020607030206070207010208--

