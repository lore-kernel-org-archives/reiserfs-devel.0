From: Hans Reiser <reiser@namesys.com>
Subject: Re: fixes/changes to mount options parser
Date: Fri, 04 Apr 2003 20:52:30 +0400
Message-ID: <3E8DB84E.5010401@namesys.com>
References: <20030404200503.A29090@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030404200503.A29090@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, jeffm@suse.com

Oleg Drokin wrote:

>Hello!
>
>   Ok, so after some silence on this front, here is 2.4 and 2.5 versions of
>   mount options parser fixes I propose.
>   These fixes consist of:
>   When you pass some mount options at mount time, default mount options are not reset if what you pass
>      does not change the defaults. (both in 2.4 and 2.5)
>   If you are doing remount and parser detected error, remount fails (2.4 only)
>   If you pass more than one jdev= option, parsers spits out error (2.5 only, as 2.4 does not have this yet)
>   Remount options (better) support (2.5 did not had ability to propagate mount options at all, by Jeff Mahoney).
>
>   What this patch does not do, but was supposed to do:
>     Hans decided that conflicting mount options on one line (like tails=off,tails=small) should produce
>     error on mount/remount. After I implemented this, it turned out this does not work with remounting.
>     if you mount with -o tails=off, and then later do remount with -o tails=small, then the filesystem 
>     will be passed options string like "tails=off,tails=small".
>
ok, well, we tried.....

> This seems to be a feature of mount(8).
>     So the only option that cannot appear on command line twice is "jdev" ("resize" can be met more than once
>     is you enlarged drive twice in a row). So I reverted to the old way of "last option takes effect".
>
ok.

>     As I do not want to split the code to determine whenever this is mount or remount, this behaviour
>     will take place in case of both mount and umount.
>
>     Attached are three patches:
>     2.4.20_parsefix.diff is patch for 2.4.20
>     2.4_parsefix.diff is patch against latest Marchelo's bk tree. (2.4)
>     2.5_parsefix.diff is patch against latest Linus' bk tree. (2.5)
>
>     This code was only tested by me, and I want to hear any opinions on ways to improve before I pass
>     it to our tester and start to try to submit it upstream. So if you want to try the code, treat it
>     as experimental one. (BTW, I wonder how often people do actually pass any mount options at all
>     and how often remount is made wit hany additional options?)
>
>Bye,
>    Oleg
>  
>
>------------------------------------------------------------------------
>
>--- fs/reiserfs/super.c.1	Fri Apr  4 18:39:16 2003
>+++ fs/reiserfs/super.c	Fri Apr  4 19:31:39 2003
>@@ -402,8 +402,11 @@
>    mount options that have values rather than being toggles. */
> typedef struct {
>     char * value;
>-    int bitmask; /* bit which is to be set in mount_options bitmask when this
>-                    value is found, 0 is no bits are to be set */
>+    int setmask; /* bitmask which is to set on mount_options bitmask when this
>+                    value is found, 0 is no bits are to be changed. */
>+    int clrmask; /* bitmask which is to clear on mount_options bitmask when this
>+		    value is found, 0 is no bits are to be changed. This is
>+		    applied BEFORE setmask */
> } arg_desc_t;
> 
> 
>@@ -413,37 +416,42 @@
>     char * option_name;
>     int arg_required; /* 0 is argument is not required, not 0 otherwise */
>     const arg_desc_t * values; /* list of values accepted by an option */
>-    int bitmask;  /* bit which is to be set in mount_options bitmask when this
>-		     option is selected, 0 is not bits are to be set */
>+    int setmask; /* bitmask which is to set on mount_options bitmask when this
>+		    value is found, 0 is no bits are to be changed. */
>+    int clrmask; /* bitmask which is to clear on mount_options bitmask when this
>+		    value is found, 0 is no bits are to be changed. This is
>+		    applied BEFORE setmask */
> } opt_desc_t;
> 
> 
> /* possible values for "-o hash=" and bits which are to be set in s_mount_opt
>    of reiserfs specific part of in-core super block */
> const arg_desc_t hash[] = {
>-    {"rupasov", FORCE_RUPASOV_HASH},
>-    {"tea", FORCE_TEA_HASH},
>-    {"r5", FORCE_R5_HASH},
>-    {"detect", FORCE_HASH_DETECT},
>-    {NULL, 0}
>+    {"rupasov", 1<<FORCE_RUPASOV_HASH,(1<<FORCE_TEA_HASH)|(1<<FORCE_R5_HASH)},
>+    {"tea", 1<<FORCE_TEA_HASH,(1<<FORCE_RUPASOV_HASH)|(1<<FORCE_R5_HASH)},
>+    {"r5", 1<<FORCE_R5_HASH,(1<<FORCE_RUPASOV_HASH)|(1<<FORCE_TEA_HASH)},
>+    {"detect", 1<<FORCE_HASH_DETECT, (1<<FORCE_RUPASOV_HASH)|(1<<FORCE_TEA_HASH)|(1<<FORCE_R5_HASH)},
>+    {NULL, 0, 0}
> };
> 
> 
> /* possible values for "-o block-allocator=" and bits which are to be set in
>    s_mount_opt of reiserfs specific part of in-core super block */
> const arg_desc_t balloc[] = {
>-    {"noborder", REISERFS_NO_BORDER},
>-    {"no_unhashed_relocation", REISERFS_NO_UNHASHED_RELOCATION},
>-    {"hashed_relocation", REISERFS_HASHED_RELOCATION},
>-    {"test4", REISERFS_TEST4},
>-    {NULL, 0}
>+    {"noborder", 1<<REISERFS_NO_BORDER, 0},
>+    {"border", 0, 1<<REISERFS_NO_BORDER},
>+    {"no_unhashed_relocation", 1<<REISERFS_NO_UNHASHED_RELOCATION, 0},
>+    {"hashed_relocation", 1<<REISERFS_HASHED_RELOCATION, 0},
>+    {"test4", 1<<REISERFS_TEST4, 0},
>+    {"notest4", 0, 1<<REISERFS_TEST4},
>+    {NULL, 0, 0}
> };
> 
> const arg_desc_t tails[] = {
>-    {"on", REISERFS_LARGETAIL},
>-    {"off", -1},
>-    {"small", REISERFS_SMALLTAIL},
>-    {NULL, 0}
>+    {"on", 1<<REISERFS_LARGETAIL, 1<<REISERFS_SMALLTAIL},
>+    {"off", 0, (1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
>+    {"small", 1<<REISERFS_SMALLTAIL, 1<<REISERFS_LARGETAIL},
>+    {NULL, 0, 0}
> };
> 
> 
>@@ -487,8 +495,10 @@
>     /* for every option in the list */
>     for (opt = opts; opt->option_name; opt ++) {
> 	if (!strncmp (p, opt->option_name, strlen (opt->option_name))) {
>-	    if (bit_flags && opt->bitmask != -1 )
>-		set_bit (opt->bitmask, bit_flags);
>+	    if (bit_flags) {
>+		*bit_flags &= ~opt->clrmask;
>+		*bit_flags |= opt->setmask;
>+	    }
> 	    break;
> 	}
>     }
>@@ -528,7 +538,7 @@
>     }
>     
>     if (!opt->values) {
>-	/* *opt_arg contains pointer to argument */
>+	/* *=NULLopt_arg contains pointer to argument */
> 	*opt_arg = p;
> 	return opt->arg_required;
>     }
>@@ -536,8 +546,10 @@
>     /* values possible for this option are listed in opt->values */
>     for (arg = opt->values; arg->value; arg ++) {
> 	if (!strcmp (p, arg->value)) {
>-	    if (bit_flags && arg->bitmask != -1 )
>-		set_bit (arg->bitmask, bit_flags);
>+	    if (bit_flags) {
>+		*bit_flags &= ~arg->clrmask;
>+		*bit_flags |= arg->setmask;
>+	    }
> 	    return opt->arg_required;
> 	}
>     }
>@@ -546,7 +558,6 @@
>     return -1;
> }
> 
>-
> /* returns 0 if something is wrong in option string, 1 - otherwise */
> static int reiserfs_parse_options (struct super_block * s, char * options, /* string given via mount's -o */
> 				   unsigned long * mount_options,
>@@ -559,18 +570,21 @@
>     char * arg = NULL;
>     char * pos;
>     opt_desc_t opts[] = {
>-		{"tails", 't', tails, -1},
>-		{"notail", 0, 0, -1}, /* Compatibility stuff, so that -o notail for old setups still work */
>-		{"conv", 0, 0, REISERFS_CONVERT}, 
>-		{"nolog", 0, 0, -1},
>-		{"replayonly", 0, 0, REPLAYONLY},
>+		{"tails", 't', tails, 0, 0},
>+		/* Compatibility stuff, so that -o notail
>+		   for old setups still work */
>+		{"notail", 0, 0, 0, (1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
>+		{"conv", 0, 0, 1<<REISERFS_CONVERT, 0},
>+		{"nolog", 0, 0, 0, 0}, /* This is unsupported */
>+		{"replayonly", 0, 0, 1<<REPLAYONLY, 0},
> 		
>-		{"block-allocator", 'a', balloc, -1}, 
>-		{"hash", 'h', hash, FORCE_HASH_DETECT},
>+		{"block-allocator", 'a', balloc, 0, 0},
>+		{"hash", 'h', hash, 1<<FORCE_HASH_DETECT, 0},
> 		
>-		{"resize", 'r', 0, -1},
>-		{"attrs", 0, 0, REISERFS_ATTRS},
>-		{NULL, 0, 0, 0}
>+		{"resize", 'r', 0, 0, 0},
>+		{"attrs", 0, 0, 1<<REISERFS_ATTRS, 0},
>+		{"noattrs", 0, 0, 0, 1<<REISERFS_ATTRS},
>+		{NULL, 0, 0, 0, 0}
>     };
> 	
>     *blocks = 0;
>@@ -578,9 +592,6 @@
> 	/* use default configuration: create tails, journaling on, no
> 	   conversion to newest format */
> 	return 1;
>-    else
>-	/* Drop defaults to zeroes */
>-	*mount_options = 0;
>     
>     for (pos = options; pos; ) {
> 	c = reiserfs_getopt (s, &pos, opts, &arg, mount_options);
>@@ -634,26 +645,26 @@
>   struct reiserfs_super_block * rs;
>   struct reiserfs_transaction_handle th ;
>   unsigned long blocks;
>-  unsigned long mount_options = 0;
>+  unsigned long mount_options = s->u.reiserfs_sb.s_mount_opt;
>+  unsigned long safe_mask = 0;
> 
>   rs = SB_DISK_SUPER_BLOCK (s);
> 
>   if (!reiserfs_parse_options(s, data, &mount_options, &blocks))
>-  	return 0;
>+  	return -EINVAL;
> 
>-#define SET_OPT( opt, bits, super )					\
>-    if( ( bits ) & ( 1 << ( opt ) ) )					\
>-	    ( super ) -> u.reiserfs_sb.s_mount_opt |= ( 1 << ( opt ) )
>-
>-  /* set options in the super-block bitmask */
>-  SET_OPT( REISERFS_SMALLTAIL, mount_options, s );
>-  SET_OPT( REISERFS_LARGETAIL, mount_options, s );
>-  SET_OPT( REISERFS_NO_BORDER, mount_options, s );
>-  SET_OPT( REISERFS_NO_UNHASHED_RELOCATION, mount_options, s );
>-  SET_OPT( REISERFS_HASHED_RELOCATION, mount_options, s );
>-  SET_OPT( REISERFS_TEST4, mount_options, s );
>-  SET_OPT( REISERFS_ATTRS, mount_options, s );
>-#undef SET_OPT
>+  /* Add options that are safe here */
>+  safe_mask |= 1 << REISERFS_SMALLTAIL;
>+  safe_mask |= 1 << REISERFS_LARGETAIL;
>+  safe_mask |= 1 << REISERFS_NO_BORDER;
>+  safe_mask |= 1 << REISERFS_NO_UNHASHED_RELOCATION;
>+  safe_mask |= 1 << REISERFS_HASHED_RELOCATION;
>+  safe_mask |= 1 << REISERFS_TEST4;
>+  safe_mask |= 1 << REISERFS_ATTRS;
>+
>+  /* Update the bitmask, taking care to keep
>+   * the bits we're not allowed to change here */
>+  s->u.reiserfs_sb.s_mount_opt = (s->u.reiserfs_sb.s_mount_opt & ~safe_mask) | (mount_options & safe_mask);
> 
>   handle_attrs( s );
> 
>  
>
>------------------------------------------------------------------------
>
>===== fs/reiserfs/super.c 1.31 vs edited =====
>--- 1.31/fs/reiserfs/super.c	Thu Mar 13 14:52:15 2003
>+++ edited/fs/reiserfs/super.c	Fri Apr  4 19:37:42 2003
>@@ -403,8 +403,11 @@
>    mount options that have values rather than being toggles. */
> typedef struct {
>     char * value;
>-    int bitmask; /* bit which is to be set in mount_options bitmask when this
>-                    value is found, 0 is no bits are to be set */
>+    int setmask; /* bitmask which is to set on mount_options bitmask when this
>+                    value is found, 0 is no bits are to be changed. */
>+    int clrmask; /* bitmask which is to clear on mount_options bitmask when this
>+		    value is found, 0 is no bits are to be changed. This is
>+		    applied BEFORE setmask */
> } arg_desc_t;
> 
> 
>@@ -414,37 +417,42 @@
>     char * option_name;
>     int arg_required; /* 0 is argument is not required, not 0 otherwise */
>     const arg_desc_t * values; /* list of values accepted by an option */
>-    int bitmask;  /* bit which is to be set in mount_options bitmask when this
>-		     option is selected, 0 is not bits are to be set */
>+    int setmask; /* bitmask which is to set on mount_options bitmask when this
>+		    value is found, 0 is no bits are to be changed. */
>+    int clrmask; /* bitmask which is to clear on mount_options bitmask when this
>+		    value is found, 0 is no bits are to be changed. This is
>+		    applied BEFORE setmask */
> } opt_desc_t;
> 
> 
> /* possible values for "-o hash=" and bits which are to be set in s_mount_opt
>    of reiserfs specific part of in-core super block */
> static const arg_desc_t hash[] = {
>-    {"rupasov", FORCE_RUPASOV_HASH},
>-    {"tea", FORCE_TEA_HASH},
>-    {"r5", FORCE_R5_HASH},
>-    {"detect", FORCE_HASH_DETECT},
>-    {NULL, 0}
>+    {"rupasov", 1<<FORCE_RUPASOV_HASH,(1<<FORCE_TEA_HASH)|(1<<FORCE_R5_HASH)},
>+    {"tea", 1<<FORCE_TEA_HASH,(1<<FORCE_RUPASOV_HASH)|(1<<FORCE_R5_HASH)},
>+    {"r5", 1<<FORCE_R5_HASH,(1<<FORCE_RUPASOV_HASH)|(1<<FORCE_TEA_HASH)},
>+    {"detect", 1<<FORCE_HASH_DETECT, (1<<FORCE_RUPASOV_HASH)|(1<<FORCE_TEA_HASH)|(1<<FORCE_R5_HASH)},
>+    {NULL, 0, 0}
> };
> 
> 
> /* possible values for "-o block-allocator=" and bits which are to be set in
>    s_mount_opt of reiserfs specific part of in-core super block */
> static const arg_desc_t balloc[] = {
>-    {"noborder", REISERFS_NO_BORDER},
>-    {"no_unhashed_relocation", REISERFS_NO_UNHASHED_RELOCATION},
>-    {"hashed_relocation", REISERFS_HASHED_RELOCATION},
>-    {"test4", REISERFS_TEST4},
>-    {NULL, 0}
>+    {"noborder", 1<<REISERFS_NO_BORDER, 0},
>+    {"border", 0, 1<<REISERFS_NO_BORDER},
>+    {"no_unhashed_relocation", 1<<REISERFS_NO_UNHASHED_RELOCATION, 0},
>+    {"hashed_relocation", 1<<REISERFS_HASHED_RELOCATION, 0},
>+    {"test4", 1<<REISERFS_TEST4, 0},
>+    {"notest4", 0, 1<<REISERFS_TEST4},
>+    {NULL, 0, 0}
> };
> 
> static const arg_desc_t tails[] = {
>-    {"on", REISERFS_LARGETAIL},
>-    {"off", -1},
>-    {"small", REISERFS_SMALLTAIL},
>-    {NULL, 0}
>+    {"on", 1<<REISERFS_LARGETAIL, 1<<REISERFS_SMALLTAIL},
>+    {"off", 0, (1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
>+    {"small", 1<<REISERFS_SMALLTAIL, 1<<REISERFS_LARGETAIL},
>+    {NULL, 0, 0}
> };
> 
> 
>@@ -488,8 +496,10 @@
>     /* for every option in the list */
>     for (opt = opts; opt->option_name; opt ++) {
> 	if (!strncmp (p, opt->option_name, strlen (opt->option_name))) {
>-	    if (bit_flags && opt->bitmask != -1 )
>-		set_bit (opt->bitmask, bit_flags);
>+	    if (bit_flags) {
>+		*bit_flags &= ~opt->clrmask;
>+		*bit_flags |= opt->setmask;
>+	    }
> 	    break;
> 	}
>     }
>@@ -529,7 +539,7 @@
>     }
>     
>     if (!opt->values) {
>-	/* *opt_arg contains pointer to argument */
>+	/* *=NULLopt_arg contains pointer to argument */
> 	*opt_arg = p;
> 	return opt->arg_required;
>     }
>@@ -537,8 +547,10 @@
>     /* values possible for this option are listed in opt->values */
>     for (arg = opt->values; arg->value; arg ++) {
> 	if (!strcmp (p, arg->value)) {
>-	    if (bit_flags && arg->bitmask != -1 )
>-		set_bit (arg->bitmask, bit_flags);
>+	    if (bit_flags) {
>+		*bit_flags &= ~arg->clrmask;
>+		*bit_flags |= arg->setmask;
>+	    }
> 	    return opt->arg_required;
> 	}
>     }
>@@ -547,7 +559,6 @@
>     return -1;
> }
> 
>-
> /* returns 0 if something is wrong in option string, 1 - otherwise */
> static int reiserfs_parse_options (struct super_block * s, char * options, /* string given via mount's -o */
> 				   unsigned long * mount_options,
>@@ -560,18 +571,21 @@
>     char * arg = NULL;
>     char * pos;
>     opt_desc_t opts[] = {
>-		{"tails", 't', tails, -1},
>-		{"notail", 0, 0, -1}, /* Compatibility stuff, so that -o notail for old setups still work */
>-		{"conv", 0, 0, REISERFS_CONVERT}, 
>-		{"nolog", 0, 0, -1},
>-		{"replayonly", 0, 0, REPLAYONLY},
>+		{"tails", 't', tails, 0, 0},
>+		/* Compatibility stuff, so that -o notail
>+		   for old setups still work */
>+		{"notail", 0, 0, 0, (1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
>+		{"conv", 0, 0, 1<<REISERFS_CONVERT, 0},
>+		{"nolog", 0, 0, 0, 0}, /* This is unsupported */
>+		{"replayonly", 0, 0, 1<<REPLAYONLY, 0},
> 		
>-		{"block-allocator", 'a', balloc, -1}, 
>-		{"hash", 'h', hash, FORCE_HASH_DETECT},
>+		{"block-allocator", 'a', balloc, 0, 0},
>+		{"hash", 'h', hash, 1<<FORCE_HASH_DETECT, 0},
> 		
>-		{"resize", 'r', 0, -1},
>-		{"attrs", 0, 0, REISERFS_ATTRS},
>-		{NULL, 0, 0, 0}
>+		{"resize", 'r', 0, 0, 0},
>+		{"attrs", 0, 0, 1<<REISERFS_ATTRS, 0},
>+		{"noattrs", 0, 0, 0, 1<<REISERFS_ATTRS},
>+		{NULL, 0, 0, 0, 0}
>     };
> 	
>     *blocks = 0;
>@@ -579,9 +593,6 @@
> 	/* use default configuration: create tails, journaling on, no
> 	   conversion to newest format */
> 	return 1;
>-    else
>-	/* Drop defaults to zeroes */
>-	*mount_options = 0;
>     
>     for (pos = options; pos; ) {
> 	c = reiserfs_getopt (s, &pos, opts, &arg, mount_options);
>@@ -635,26 +646,26 @@
>   struct reiserfs_super_block * rs;
>   struct reiserfs_transaction_handle th ;
>   unsigned long blocks;
>-  unsigned long mount_options = 0;
>+  unsigned long mount_options = s->u.reiserfs_sb.s_mount_opt;
>+  unsigned long safe_mask = 0;
> 
>   rs = SB_DISK_SUPER_BLOCK (s);
> 
>   if (!reiserfs_parse_options(s, data, &mount_options, &blocks))
>-  	return 0;
>+  	return -EINVAL;
> 
>-#define SET_OPT( opt, bits, super )					\
>-    if( ( bits ) & ( 1 << ( opt ) ) )					\
>-	    ( super ) -> u.reiserfs_sb.s_mount_opt |= ( 1 << ( opt ) )
>-
>-  /* set options in the super-block bitmask */
>-  SET_OPT( REISERFS_SMALLTAIL, mount_options, s );
>-  SET_OPT( REISERFS_LARGETAIL, mount_options, s );
>-  SET_OPT( REISERFS_NO_BORDER, mount_options, s );
>-  SET_OPT( REISERFS_NO_UNHASHED_RELOCATION, mount_options, s );
>-  SET_OPT( REISERFS_HASHED_RELOCATION, mount_options, s );
>-  SET_OPT( REISERFS_TEST4, mount_options, s );
>-  SET_OPT( REISERFS_ATTRS, mount_options, s );
>-#undef SET_OPT
>+  /* Add options that are safe here */
>+  safe_mask |= 1 << REISERFS_SMALLTAIL;
>+  safe_mask |= 1 << REISERFS_LARGETAIL;
>+  safe_mask |= 1 << REISERFS_NO_BORDER;
>+  safe_mask |= 1 << REISERFS_NO_UNHASHED_RELOCATION;
>+  safe_mask |= 1 << REISERFS_HASHED_RELOCATION;
>+  safe_mask |= 1 << REISERFS_TEST4;
>+  safe_mask |= 1 << REISERFS_ATTRS;
>+
>+  /* Update the bitmask, taking care to keep
>+   * the bits we're not allowed to change here */
>+  s->u.reiserfs_sb.s_mount_opt = (s->u.reiserfs_sb.s_mount_opt & ~safe_mask) | (mount_options & safe_mask);
> 
>   handle_attrs( s );
> 
>  
>
>------------------------------------------------------------------------
>
>===== fs/reiserfs/super.c 1.59 vs edited =====
>--- 1.59/fs/reiserfs/super.c	Tue Feb 25 20:45:25 2003
>+++ edited/fs/reiserfs/super.c	Fri Apr  4 18:15:34 2003
>@@ -500,8 +500,11 @@
>    mount options that have values rather than being toggles. */
> typedef struct {
>     char * value;
>-    int bitmask; /* bit which is to be set in mount_options bitmask when this
>-                    value is found, 0 is no bits are to be set */
>+    int setmask; /* bitmask which is to set on mount_options bitmask when this
>+                    value is found, 0 is no bits are to be changed. */
>+    int clrmask; /* bitmask which is to clear on mount_options bitmask when this
>+		    value is found, 0 is no bits are to be changed. This is
>+		    applied BEFORE setmask */
> } arg_desc_t;
> 
> 
>@@ -511,25 +514,30 @@
>     char * option_name;
>     int arg_required; /* 0 if argument is not required, not 0 otherwise */
>     const arg_desc_t * values; /* list of values accepted by an option */
>-    int bitmask;  /* bit which is to be set in mount_options bitmask when this
>-		     option is selected, 0 is not bits are to be set */
>+    int setmask; /* bitmask which is to set on mount_options bitmask when this
>+                    value is found, 0 is no bits are to be changed. */
>+    int clrmask; /* bitmask which is to clear on mount_options bitmask when this
>+		    value is found, 0 is no bits are to be changed. This is
>+		    applied BEFORE setmask */
> } opt_desc_t;
> 
> /* possible values for "-o block-allocator=" and bits which are to be set in
>    s_mount_opt of reiserfs specific part of in-core super block */
> static const arg_desc_t balloc[] = {
>-    {"noborder", REISERFS_NO_BORDER},
>-    {"no_unhashed_relocation", REISERFS_NO_UNHASHED_RELOCATION},
>-    {"hashed_relocation", REISERFS_HASHED_RELOCATION},
>-    {"test4", REISERFS_TEST4},
>-    {NULL, -1}
>+    {"noborder", 1<<REISERFS_NO_BORDER, 0},
>+    {"border", 0, 1<<REISERFS_NO_BORDER},
>+    {"no_unhashed_relocation", 1<<REISERFS_NO_UNHASHED_RELOCATION, 0},
>+    {"hashed_relocation", 1<<REISERFS_HASHED_RELOCATION, 0},
>+    {"test4", 1<<REISERFS_TEST4, 0},
>+    {"notest4", 0, 1<<REISERFS_TEST4},
>+    {NULL, 0, 0}
> };
> 
> static const arg_desc_t tails[] = {
>-    {"on", REISERFS_LARGETAIL},
>-    {"off", -1},
>-    {"small", REISERFS_SMALLTAIL},
>-    {NULL, 0}
>+    {"on", 1<<REISERFS_LARGETAIL, 1<<REISERFS_SMALLTAIL},
>+    {"off", 0, (1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
>+    {"small", 1<<REISERFS_SMALLTAIL, 1<<REISERFS_LARGETAIL},
>+    {NULL, 0, 0}
> };
> 
> 
>@@ -574,8 +582,10 @@
>     /* for every option in the list */
>     for (opt = opts; opt->option_name; opt ++) {
> 	if (!strncmp (p, opt->option_name, strlen (opt->option_name))) {
>-	    if (bit_flags && opt->bitmask != -1)
>-		set_bit (opt->bitmask, bit_flags);
>+	    if (bit_flags) {
>+		*bit_flags &= ~opt->clrmask;
>+		*bit_flags |= opt->setmask;
>+	    }
> 	    break;
> 	}
>     }
>@@ -615,7 +625,7 @@
>     }
>     
>     if (!opt->values) {
>-	/* *opt_arg contains pointer to argument */
>+	/* *=NULLopt_arg contains pointer to argument */
> 	*opt_arg = p;
> 	return opt->arg_required;
>     }
>@@ -623,8 +633,10 @@
>     /* values possible for this option are listed in opt->values */
>     for (arg = opt->values; arg->value; arg ++) {
> 	if (!strcmp (p, arg->value)) {
>-	    if (bit_flags && arg->bitmask != -1 )
>-		set_bit (arg->bitmask, bit_flags);
>+	    if (bit_flags) {
>+		*bit_flags &= ~arg->clrmask;
>+		*bit_flags |= arg->setmask;
>+	    }
> 	    return opt->arg_required;
> 	}
>     }
>@@ -633,7 +645,6 @@
>     return -1;
> }
> 
>-
> /* returns 0 if something is wrong in option string, 1 - otherwise */
> static int reiserfs_parse_options (struct super_block * s, char * options, /* string given via mount's -o */
> 				   unsigned long * mount_options,
>@@ -647,17 +658,19 @@
>     char * arg = NULL;
>     char * pos;
>     opt_desc_t opts[] = {
>-		{"tails", 't', tails, -1},
>-		{"notail", 0, 0, -1}, /* Compatibility stuff, so that -o notail
>-for old setups still work */
>-		{"conv", 0, 0, REISERFS_CONVERT}, 
>-		{"attrs", 0, 0, REISERFS_ATTRS}, 
>-		{"nolog", 0, 0, -1},
>-		{"replayonly", 0, 0, REPLAYONLY},
>-		{"block-allocator", 'a', balloc, -1}, 
>-		{"resize", 'r', 0, -1},
>-		{"jdev", 'j', 0, -1},
>-		{NULL, 0, 0, -1}
>+		{"tails", 't', tails, 0, 0},
>+		/* Compatibility stuff, so that -o notail
>+		   for old setups still work */
>+		{"notail", 0, 0, 0, (1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
>+		{"conv", 0, 0, 1<<REISERFS_CONVERT, 0}, 
>+		{"attrs", 0, 0, 1<<REISERFS_ATTRS, 0}, 
>+		{"noattrs", 0, 0, 0, 1<<REISERFS_ATTRS}, 
>+		{"nolog", 0, 0, 0, 0}, /* This is unsupported */
>+		{"replayonly", 0, 0, 1<<REPLAYONLY, 0},
>+		{"block-allocator", 'a', balloc, 0, 0}, 
>+		{"resize", 'r', 0, 0, 0},
>+		{"jdev", 'j', 0, 0, 0},
>+		{NULL, 0, 0, 0, 0}
>     };
> 	
>     *blocks = 0;
>@@ -665,9 +678,6 @@
> 	/* use default configuration: create tails, journaling on, no
> 	   conversion to newest format */
> 	return 1;
>-    else
>-	/* Drop defaults to zeroes */
>-	*mount_options = 0;
>     
>     for (pos = options; pos; ) {
> 	c = reiserfs_getopt (s, &pos, opts, &arg, mount_options);
>@@ -690,6 +700,10 @@
> 
> 	if (c == 'j') {
> 	    if (arg && *arg && jdev_name) {
>+		if ( *jdev_name ) { //Hm, already assigned?
>+		    printk("reiserfs_parse_options: journal device was already specified to be %s\n", *jdev_name);
>+		    return 0;
>+		}
> 		*jdev_name = arg;
> 	    }
> 	}
>@@ -703,13 +717,27 @@
>   struct reiserfs_super_block * rs;
>   struct reiserfs_transaction_handle th ;
>   unsigned long blocks;
>-  unsigned long mount_options;
>+  unsigned long mount_options = REISERFS_SB(s)->s_mount_opt;
>+  unsigned long safe_mask = 0;
> 
>   rs = SB_DISK_SUPER_BLOCK (s);
> 
>   if (!reiserfs_parse_options(s, arg, &mount_options, &blocks, NULL))
>     return -EINVAL;
>-  
>+
>+  /* Add options that are safe here */
>+  safe_mask |= 1 << REISERFS_SMALLTAIL;
>+  safe_mask |= 1 << REISERFS_LARGETAIL;
>+  safe_mask |= 1 << REISERFS_NO_BORDER;
>+  safe_mask |= 1 << REISERFS_NO_UNHASHED_RELOCATION;
>+  safe_mask |= 1 << REISERFS_HASHED_RELOCATION;
>+  safe_mask |= 1 << REISERFS_TEST4;
>+  safe_mask |= 1 << REISERFS_ATTRS;
>+
>+  /* Update the bitmask, taking care to keep
>+   * the bits we're not allowed to change here */
>+  REISERFS_SB(s)->s_mount_opt = (REISERFS_SB(s)->s_mount_opt & ~safe_mask) | (mount_options & safe_mask);
>+
>   if(blocks) {
>     int rc = reiserfs_resize(s, blocks);
>     if (rc != 0)
>  
>


-- 
Hans


