From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Getopt improvements
Date: Thu, 27 Feb 2003 10:39:24 -0500
Message-ID: <3E5E312C.50406@suse.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030200000003090400060802"
Return-path: <reiserfs-list-return-12953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030227092551.C28643@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

--------------030200000003090400060802
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Oleg Drokin wrote:
> Hello!
> 
> On Wed, Feb 26, 2003 at 03:42:10PM -0500, Jeff Mahoney wrote:
> 
> 
>>	Here's a patch against the new reiserfs_getopt stuff.
>>	There are a few shortcomings with the existing implementation:
>>	1) There's no easy way to specify the negation of an option. For 
>>example, in the current implementation, you can do -oremount,attrs - but 
>>you can't turn them off again. The only way of handling this would have 
>>been to add another bit.. and then you can't deal with 
>>-oremount,attrs,noattrs,attrs - which is the correct one in that case? 
>>Clearly it's the last one, but there's no way to divine that using the 
>>existing code.
> 
> 
> All this is highly true. And I got highly annoyed by this myself
> That's why I developed similar stuff (my patch is against 2.5, see below).
> Should work with remounting (but necessary two lines are missed in this patch).
> Also I was in need to set or clear two options, so my approach is a bit different.
> (Though initially I was going pretty similar stuff to yours).
> 
> 
>>	2) All of the multiple option sets are mutually exclusive. For example, 
>>-ohash=r5,hash=rupasov would set BOTH FORCE_RUPASOV_HASH and FORCE_R5_HASH.
> 
> 
> My version makes it so that only last one takes effect. In fact I just made it possible
> to specify for each option, what other bits should be cleared when this one is in effect.
> 
> 
>>	The patch addresses both of these problems.
>>	The first shortcoming is solved by adding a "no_prefix" member to 
>>opt_desc_t, which allows the option to be negated by prefixing "no" to 
> 
> 
> Well, I just decided I won't die if I add negated value to description table ;)

	Oleg -
	
	I like the ability to specify the bits that should be cleared. It's 
more flexible than my solution, and doesn't involve looping after each 
option.

	However, I noticed in the stock 2.5.63 code that the bits during 
remount don't get propogated at all to s_mount_opts.
	
	Attached is your patch, updated to set the bits on remount.

	Any chance in getting the getopt update into the next 2.4 release?

	Thanks.

	-Jeff

-- 
jeffm@suse.com
jeffm@csh.rit.edu

--------------030200000003090400060802
Content-Type: text/plain;
 name="linux-2.5.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="linux-2.5.diff"

diff -ruN linux-2.5.63/fs/reiserfs/super.c linux-2.5.63.devel/fs/reiserfs/super.c
--- linux-2.5.63/fs/reiserfs/super.c	2003-02-24 14:05:31.000000000 -0500
+++ linux-2.5.63.devel/fs/reiserfs/super.c	2003-02-27 10:27:56.000000000 -0500
@@ -500,8 +500,11 @@
    mount options that have values rather than being toggles. */
 typedef struct {
     char * value;
-    int bitmask; /* bit which is to be set in mount_options bitmask when this
-                    value is found, 0 is no bits are to be set */
+    int setmask; /* bitmask which is to set on mount_options bitmask when this
+                    value is found, 0 is no bits are to be changed. */
+    int clrmask; /* bitmask which is to clear on mount_options bitmask when this
+		    value is found, 0 is no bits are to be changed. This is
+		    applied BEFORE setmask */
 } arg_desc_t;
 
 
@@ -511,25 +514,30 @@
     char * option_name;
     int arg_required; /* 0 if argument is not required, not 0 otherwise */
     const arg_desc_t * values; /* list of values accepted by an option */
-    int bitmask;  /* bit which is to be set in mount_options bitmask when this
-		     option is selected, 0 is not bits are to be set */
+    int setmask; /* bitmask which is to set on mount_options bitmask when this
+                    value is found, 0 is no bits are to be changed. */
+    int clrmask; /* bitmask which is to clear on mount_options bitmask when this
+		    value is found, 0 is no bits are to be changed. This is
+		    applied BEFORE setmask */
 } opt_desc_t;
 
 /* possible values for "-o block-allocator=" and bits which are to be set in
    s_mount_opt of reiserfs specific part of in-core super block */
 static const arg_desc_t balloc[] = {
-    {"noborder", REISERFS_NO_BORDER},
-    {"no_unhashed_relocation", REISERFS_NO_UNHASHED_RELOCATION},
-    {"hashed_relocation", REISERFS_HASHED_RELOCATION},
-    {"test4", REISERFS_TEST4},
-    {NULL, -1}
+    {"noborder", 1<<REISERFS_NO_BORDER, 0},
+    {"border", 0, 1<<REISERFS_NO_BORDER},
+    {"no_unhashed_relocation", 1<<REISERFS_NO_UNHASHED_RELOCATION, 0},
+    {"hashed_relocation", 1<<REISERFS_HASHED_RELOCATION, 0},
+    {"test4", 1<<REISERFS_TEST4, 0},
+    {"notest4", 0, 1<<REISERFS_TEST4},
+    {NULL, 0, 0}
 };
 
 static const arg_desc_t tails[] = {
-    {"on", REISERFS_LARGETAIL},
-    {"off", -1},
-    {"small", REISERFS_SMALLTAIL},
-    {NULL, 0}
+    {"on", 1<<REISERFS_LARGETAIL, 1<<REISERFS_SMALLTAIL},
+    {"off", 0, (1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
+    {"small", 1<<REISERFS_SMALLTAIL, 1<<REISERFS_LARGETAIL},
+    {NULL, 0, 0}
 };
 
 
@@ -574,8 +582,10 @@
     /* for every option in the list */
     for (opt = opts; opt->option_name; opt ++) {
 	if (!strncmp (p, opt->option_name, strlen (opt->option_name))) {
-	    if (bit_flags && opt->bitmask != -1)
-		set_bit (opt->bitmask, bit_flags);
+	    if (bit_flags) {
+		*bit_flags &= ~opt->clrmask;
+		*bit_flags |= opt->setmask;
+	    }
 	    break;
 	}
     }
@@ -623,8 +633,10 @@
     /* values possible for this option are listed in opt->values */
     for (arg = opt->values; arg->value; arg ++) {
 	if (!strcmp (p, arg->value)) {
-	    if (bit_flags && arg->bitmask != -1 )
-		set_bit (arg->bitmask, bit_flags);
+	    if (bit_flags) {
+		*bit_flags &= ~arg->clrmask;
+		*bit_flags |= arg->setmask;
+	    }
 	    return opt->arg_required;
 	}
     }
@@ -633,7 +645,6 @@
     return -1;
 }
 
-
 /* returns 0 if something is wrong in option string, 1 - otherwise */
 static int reiserfs_parse_options (struct super_block * s, char * options, /* string given via mount's -o */
 				   unsigned long * mount_options,
@@ -647,17 +658,19 @@
     char * arg = NULL;
     char * pos;
     opt_desc_t opts[] = {
-		{"tails", 't', tails, -1},
-		{"notail", 0, 0, -1}, /* Compatibility stuff, so that -o notail
-for old setups still work */
-		{"conv", 0, 0, REISERFS_CONVERT}, 
-		{"attrs", 0, 0, REISERFS_ATTRS}, 
-		{"nolog", 0, 0, -1},
-		{"replayonly", 0, 0, REPLAYONLY},
-		{"block-allocator", 'a', balloc, -1}, 
-		{"resize", 'r', 0, -1},
-		{"jdev", 'j', 0, -1},
-		{NULL, 0, 0, -1}
+		{"tails", 't', tails, 0, 0},
+		/* Compatibility stuff, so that -o notail
+		   for old setups still work */
+		{"notail", 0, 0, 0, (1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
+		{"conv", 0, 0, 1<<REISERFS_CONVERT, 0}, 
+		{"attrs", 0, 0, 1<<REISERFS_ATTRS, 0}, 
+		{"noattrs", 0, 0, 0, 1<<REISERFS_ATTRS}, 
+		{"nolog", 0, 0, 0, 0}, /* This is unsupported */
+		{"replayonly", 0, 0, 1<<REPLAYONLY, 0},
+		{"block-allocator", 'a', balloc, 0, 0}, 
+		{"resize", 'r', 0, 0, 0},
+		{"jdev", 'j', 0, 0, 0},
+		{NULL, 0, 0, 0, 0}
     };
 	
     *blocks = 0;
@@ -665,9 +678,6 @@
 	/* use default configuration: create tails, journaling on, no
 	   conversion to newest format */
 	return 1;
-    else
-	/* Drop defaults to zeroes */
-	*mount_options = 0;
     
     for (pos = options; pos; ) {
 	c = reiserfs_getopt (s, &pos, opts, &arg, mount_options);
@@ -703,13 +713,27 @@
   struct reiserfs_super_block * rs;
   struct reiserfs_transaction_handle th ;
   unsigned long blocks;
-  unsigned long mount_options;
+  unsigned long mount_options = s->u.reiserfs_sb.s_mount_opt;
+  unsigned long safe_mask = 0;
 
   rs = SB_DISK_SUPER_BLOCK (s);
 
   if (!reiserfs_parse_options(s, arg, &mount_options, &blocks, NULL))
     return -EINVAL;
-  
+
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
+
   if(blocks) {
     int rc = reiserfs_resize(s, blocks);
     if (rc != 0)

--------------030200000003090400060802--

