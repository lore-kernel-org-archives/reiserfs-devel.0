From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 27/8] init_super.c cleanup
Date: Wed, 24 Oct 2007 15:18:15 +0200
Message-ID: <1193231895.24225.30.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-sDjHZjvZq0zVurAROIbs"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-sDjHZjvZq0zVurAROIbs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 13 errors, 9 warnings, 752 lines checked
patched:total: 1 errors, 8 warnings, 752 lines checked

Left:

WARNING: do not add new typedefs
#64: FILE: init_super.c:64:
+typedef enum {

ERROR: need space one side of that '++' (ctx:WxW)
#368: FILE: init_super.c:368:
+       *p ++ = o;                              \
           ^

WARNING: line over 80 characters
#540: FILE: init_super.c:540:
+                                   (sector_t)(sbinfo->altsuper /
super->s_blocksize));

WARNING: line over 80 characters
#545: FILE: init_super.c:545:
+                                   (sector_t)(REISER4_MAGIC_OFFSET /
super->s_blocksize));

WARNING: line over 80 characters
#563: FILE: init_super.c:563:
+                                       "%s: wrong block size %ld\n",
super->s_id,

WARNING: line over 80 characters
#581: FILE: init_super.c:581:
+
le16_to_cpu(get_unaligned(&master_sb->disk_plugin_id)));

WARNING: line over 80 characters
#587: FILE: init_super.c:587:
+
le16_to_cpu(get_unaligned(&master_sb->disk_plugin_id)));

WARNING: line over 80 characters
#591: FILE: init_super.c:591:
+               sbinfo->diskmap_block =
le64_to_cpu(get_unaligned(&master_sb->diskmap));

WARNING: line over 80 characters
#730: FILE: init_super.c:730:
+
inode_file_plugin(inode)->estimate.update(inode),

--=-sDjHZjvZq0zVurAROIbs
Content-Disposition: attachment; filename=init_super.c.patch
Content-Type: text/x-patch; name=init_super.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- init_super.c.orig	2007-10-24 15:11:20.000000000 +0200
+++ init_super.c	2007-10-24 15:16:00.000000000 +0200
@@ -126,7 +126,7 @@ struct opt_desc {
 		struct {
 			void *addr;
 			int nr_bits;
-			//struct opt_bitmask_bit *bits;
+			/* struct opt_bitmask_bit *bits; */
 		} bitmask;
 	} u;
 };
@@ -261,15 +261,15 @@ static int parse_options(char *opt_strin
 	return result;
 }
 
-#define NUM_OPT( label, fmt, addr )				\
+#define NUM_OPT(label, fmt, addr)				\
 		{						\
-			.name = ( label ),			\
+			.name = (label),			\
 			.type = OPT_FORMAT,			\
 			.u = {					\
 				.f = {				\
-					.format  = ( fmt ),	\
+					.format  = (fmt),	\
 					.nr_args = 1,		\
-					.arg1 = ( addr ),	\
+					.arg1 = (addr),		\
 					.arg2 = NULL,		\
 					.arg3 = NULL,		\
 					.arg4 = NULL		\
@@ -277,7 +277,7 @@ static int parse_options(char *opt_strin
 			}					\
 		}
 
-#define SB_FIELD_OPT( field, fmt ) NUM_OPT( #field, fmt, &sbinfo -> field )
+#define SB_FIELD_OPT(field, fmt) NUM_OPT(#field, fmt, &sbinfo->field)
 
 #define BIT_OPT(label, bitnr)					\
 	{							\
@@ -355,7 +355,7 @@ int reiser4_init_super_data(struct super
 
 #if REISER4_DEBUG
 #  define OPT_ARRAY_CHECK if ((p) > (opts) + MAX_NR_OPTIONS) {		\
-		warning ("zam-1046", "opt array is overloaded"); break;	\
+		warning("zam-1046", "opt array is overloaded"); break;	\
 	}
 #else
 #   define OPT_ARRAY_CHECK noop

--=-sDjHZjvZq0zVurAROIbs--

