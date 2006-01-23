From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: stale dk warning
Date: Tue, 24 Jan 2006 01:50:17 +0300
Message-ID: <200601240150.18414.zam@namesys.com>
References: <1137788919.22212.7.camel@gentoo> <43D49AFC.3000807@namesys.com> <43D49B4C.5080406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27840-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43D49B4C.5080406@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Jake Maciejewski <maciejej@msoe.edu>, reiserfs-list@namesys.com

On Monday 23 January 2006 12:01, Hans Reiser wrote:
> Hans Reiser wrote:
> >Vladimir V. Saveliev wrote:
> >>Hello
> >>
> >>On Fri, 2006-01-20 at 14:28 -0600, Jake Maciejewski wrote:
> >>>In addition to the disable write barrier warning reported by Louis-David
> >>>Mitterrand on January 10th, with 2.6.15-1 I'm getting:
> >>>
> >>>       <4>reiser4[dd(25448)]: update_stale_dk
> >>> (fs/reiser4/search.c:1363)[nikita-38210]: WARNING: stale dk
> >>>
> >>>The process varies. I've also seen the stale dk warning triggered by
> >>> rsync and rm.
> >>
> >>This is harmless. I think we should remove this warning as well as the
> >>one about write barrier.
> >
> >Zam said he would change it
>
> by "it" I refer to the write barrier warning, sorry for my imprecision....
>
> > to a notice.  Zam, what happened to the patch?

1. re-phrase "disabling write barrier" warning which confuses users and
   make it KERN_NOTICE instead of KERN_WARNING.
2. remove the "[nikita-38210]: WARNING: stale dk" at fs/reiser4/search.c 
   which does not indicate any reiser4 tree or fs problems.

Signed-off-by: Alex Zarochentsev <zam@namesys.com>
---

 fs/reiser4/debug.h  |    5 ++++-
 fs/reiser4/search.c |    2 --
 fs/reiser4/wander.c |    3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

--- linux-2.6.x.orig/fs/reiser4/debug.h
+++ linux-2.6.x/fs/reiser4/debug.h
@@ -205,10 +205,13 @@ extern int is_in_reiser4_context(void);
 #define wrong_return_value( label, function )				\
 	impossible( label, "wrong return value from " function )
 
-/* Issue warning message to the console */
+/* Issue different types of reiser4 messages to the console */
 #define warning( label, format, ... )					\
 	DCALL( KERN_WARNING, 						\
 	       printk, 1, label, "WARNING: " format , ## __VA_ARGS__ )
+#define notice( label, format, ... )					\
+	DCALL( KERN_NOTICE, 						\
+	       printk, 1, label, "NOTICE: " format , ## __VA_ARGS__ )
 
 /* mark not yet implemented functionality */
 #define not_yet( label, format, ... )				\
--- linux-2.6.x.orig/fs/reiser4/search.c
+++ linux-2.6.x/fs/reiser4/search.c
@@ -1359,8 +1359,6 @@ static void update_stale_dk(reiser4_tree
 	if (unlikely(ZF_ISSET(node, JNODE_RIGHT_CONNECTED) &&
 		     right && ZF_ISSET(right, JNODE_DKSET) &&
 		     !keyeq(&rd, znode_get_ld_key(right)))) {
-		/* does this ever happen? */
-		warning("nikita-38210", "stale dk");
 		assert("nikita-38211", ZF_ISSET(node, JNODE_DKSET));
 		read_unlock_dk(tree);
 		read_unlock_tree(tree);
--- linux-2.6.x.orig/fs/reiser4/wander.c
+++ linux-2.6.x/fs/reiser4/wander.c
@@ -230,7 +230,8 @@ static inline int reiser4_use_write_barr
 
 static void disable_write_barrier(struct super_block * s)
 {
-	warning("zam-1055", "disabling write barrier\n");
+	notice("zam-1055", "%s does not support write barriers,"
+	       " using synchronous write instead.\n", s->s_id);
 	set_bit((int)REISER4_NO_WRITE_BARRIER, &get_super_private(s)->fs_flags);
 }
 
