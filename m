From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.31
Date: Tue, 06 Oct 2009 18:59:45 +0200
Message-ID: <4ACB7781.9050206@gmail.com>
References: <4AC947C6.40005@gmail.com> <e85b9d30910060328r7deea7dak4bba307fcf995aeb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040804070009040003070209"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <e85b9d30910060328r7deea7dak4bba307fcf995aeb@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Mat <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------040804070009040003070209
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Mat wrote:
> Hi Edward,
>   

Hello, Mat.

> thank you very much for the 2.6.31 patch !
>
> Since using this patch I've observed kind of a strange behavior with
> mount-options:
>
> most of them don't work anymore !
>   

Yes, sorry,
please, apply the attached patch, or use the
updated stuff on kernel.org

Thanks!
Edward.

> fortunately
>
> noatime,nodiratime,dont_load_bitmap
>
> works
>
>
> unfortunately most of the others don't:
>
> [ 4995.449031] reiser4[mount(15761)]: parse_options
> (fs/reiser4/init_super.c:253)[nikita-2307]:
> [ 4995.449033] WARNING: Unrecognized option: "tree.cbk_cache.nr_slots=48"
>   


--------------040804070009040003070209
Content-Type: text/plain;
 name="reiser4-reduce-frame-size-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-reduce-frame-size-fix.patch"

. Fix up the bug in reiser4_init_super_data():
  The pointer "p" to opt_desc structure is not
  incremented.
  Pass "&p" instead of "p" to push_sb_field_opts(),
  which is supposed to increment the pointer.
. Modify macros PUSH_OPT, OPT_ARRAY_CHECK to accept
  arguments.

Signed-off-by Edward Shsihkin <edward.shishkin@gmail.com>
---
 fs/reiser4/init_super.c |   28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

--- mmotm.orig/fs/reiser4/init_super.c
+++ mmotm/fs/reiser4/init_super.c
@@ -293,27 +293,27 @@ static int parse_options(char *opt_strin
 #define MAX_NR_OPTIONS (30)
 
 #if REISER4_DEBUG
-#  define OPT_ARRAY_CHECK if ((p) > (opts) + MAX_NR_OPTIONS) {		\
+#  define OPT_ARRAY_CHECK(opt, array)					\
+	if ((opt) > (array) + MAX_NR_OPTIONS) {				\
 		warning("zam-1046", "opt array is overloaded"); break;	\
 	}
 #else
-#   define OPT_ARRAY_CHECK noop
+#   define OPT_ARRAY_CHECK(opt, array) noop
 #endif
 
-#define PUSH_OPT(...)				\
+#define PUSH_OPT(opt, array, ...)		\
 do {						\
 	struct opt_desc o = __VA_ARGS__;	\
-	OPT_ARRAY_CHECK;			\
-	*p ++ = o;				\
+	OPT_ARRAY_CHECK(opt, array);		\
+	*(opt) ++ = o;				\
 } while (0)
 
-#define PUSH_SB_FIELD_OPT(field, format) PUSH_OPT(SB_FIELD_OPT(field, format))
-#define PUSH_BIT_OPT(name, bit) PUSH_OPT(BIT_OPT(name, bit))
-
-static noinline void push_sb_field_opts(struct opt_desc *p,
+static noinline void push_sb_field_opts(struct opt_desc **p,
 					struct opt_desc *opts,
 					reiser4_super_info_data *sbinfo)
 {
+#define PUSH_SB_FIELD_OPT(field, format)		\
+	PUSH_OPT(*p, opts, SB_FIELD_OPT(field, format))
 	/*
 	 * tmgr.atom_max_size=N
 	 * Atoms containing more than N blocks will be forced to commit. N is
@@ -441,8 +441,12 @@ int reiser4_init_super_data(struct super
 	/* initialize structure describing reiser4 mount options */
 	p = opts;
 
-	push_sb_field_opts(p, opts, sbinfo);
+	push_sb_field_opts(&p, opts, sbinfo);
 	/* turn on BSD-style gid assignment */
+
+#define PUSH_BIT_OPT(name, bit)			\
+	PUSH_OPT(p, opts, BIT_OPT(name, bit))
+
 	PUSH_BIT_OPT("bsdgroups", REISER4_BSD_GID);
 	/* turn on 32 bit times */
 	PUSH_BIT_OPT("32bittimes", REISER4_32_BIT_TIMES);
@@ -456,7 +460,7 @@ int reiser4_init_super_data(struct super
 	/* disable use of write barriers in the reiser4 log writer. */
 	PUSH_BIT_OPT("no_write_barrier", REISER4_NO_WRITE_BARRIER);
 
-	PUSH_OPT(
+	PUSH_OPT(p, opts,
 	{
 		/*
 		 * tree traversal readahead parameters:
@@ -482,7 +486,7 @@ int reiser4_init_super_data(struct super
 	);
 
 	/* What to do in case of fs error */
-	PUSH_OPT(
+	PUSH_OPT(p, opts,
 	{
 		.name = "onerror",
 		.type = OPT_ONEOF,

--------------040804070009040003070209--
