From: Pekka Enberg <penberg@gmail.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 09:22:00 +0300
Message-ID: <84144f0205062223226d560e41@mail.gmail.com>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>
	 <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com>
	 <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com>
Reply-To: Pekka Enberg <penberg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B8C0FF.2010800@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andi Kleen <ak@suse.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Hi Hans,

On 6/22/05, Hans Reiser <reiser@namesys.com> wrote:
> I would in particular love to have you Andi Kleen do a full review of V4
> if you could be that generous with your time, as I liked much of the
> advice you gave us on V3.

Well, I am not Andi Kleen and this is not even in the ballpark of a full
review but here goes...

P.S. Would it be possible to have a version without the plugin stuff
submitted (and perhaps file as directory)? It would make much more
sense for the rest of us to review reiser4 without the most controversial
bits and get the bits that people agree on merged.

                                     Pekka

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/pool.c=092005-06-03 17:49:38.668204642 +04=
00
> +/* initialise new pool */
> +reiser4_internal void
> +reiser4_init_pool(reiser4_pool * pool /* pool to initialise */ ,
> +=09=09  size_t obj_size /* size of objects in @pool */ ,
> +=09=09  int num_of_objs /* number of preallocated objects */ ,
> +=09=09  char *data /* area for preallocated objects */ )
> +{
> +=09reiser4_pool_header *h;
> +=09int i;
> +
> +=09assert("nikita-955", pool !=3D NULL);

These assertion codes are meaningless to the rest of us so please drop
them.

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/type_safe_hash.h=092005-06-03 17:49:38.751=
209197 +0400
> @@ -0,0 +1,320 @@
> +/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
> + * reiser4/README */
> +
> +/* A hash table class that uses hash chains (singly-linked) and is
> +   parametrized to provide type safety.  */

This belongs to include/linux, not reiser4.

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/type_safe_list.h=092005-06-03 17:49:38.755=
209417 +0400
> @@ -0,0 +1,436 @@
> +/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reis=
er4/README */
> +
> +#ifndef __REISER4_TYPE_SAFE_LIST_H__
> +#define __REISER4_TYPE_SAFE_LIST_H__
> +
> +#include "debug.h"
> +/* A circular doubly linked list that differs from the previous
> +   <linux/list.h> implementation because it is parametrized to provide
> +   type safety.  This data structure is also useful as a queue or stack.

This belongs to include/linux, not reiser4.

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/vfs_ops.c=092005-06-03 17:51:28.110210237 =
+0400
> +/* ->get_sb() method of file_system operations. */
> +static struct super_block *
> +reiser4_get_sb(struct file_system_type *fs_type=09/* file
> +=09=09=09=09=09=09 * system
> +=09=09=09=09=09=09 * type */ ,
> +=09       int flags /* flags */ ,
> +=09       const char *dev_name /* device name */ ,
> +=09       void *data /* mount options */ )

Please drop the useless parameter comments.

> +/*
> + * Initialization stages for reiser4.
> + *
> + * These enumerate various things that have to be done during reiser4
> + * startup. Initialization code (init_reiser4()) keeps track of what sta=
ge was
> + * reached, so that proper undo can be done if error occurs during
> + * initialization.
> + */
> +typedef enum {
> +=09INIT_NONE,               /* nothing is initialized yet */
> +=09INIT_INODECACHE,         /* inode cache created */
> +=09INIT_CONTEXT_MGR,        /* list of active contexts created */
> +=09INIT_ZNODES,             /* znode slab created */
> +=09INIT_PLUGINS,            /* plugins initialized */
> +=09INIT_PLUGIN_SET,         /* psets initialized */
> +=09INIT_TXN,                /* transaction manager initialized */
> +=09INIT_FAKES,              /* fake inode initialized */
> +=09INIT_JNODES,             /* jnode slab initialized */
> +=09INIT_EFLUSH,             /* emergency flush initialized */
> +=09INIT_FQS,                /* flush queues initialized */
> +=09INIT_DENTRY_FSDATA,      /* dentry_fsdata slab initialized */
> +=09INIT_FILE_FSDATA,        /* file_fsdata slab initialized */
> +=09INIT_D_CURSOR,           /* d_cursor suport initialized */
> +=09INIT_FS_REGISTERED,      /* reiser4 file system type registered */
> +} reiser4_init_stage;

Please use regular gotos instead. This is a silly hack especially since you
don't have release function for all of the stages.

> +reiser4_internal void reiser4_handle_error(void)
> +{
> +=09struct super_block *sb =3D reiser4_get_current_sb();
> +
> +=09if ( !sb )
> +=09=09return;
> +=09reiser4_status_write(REISER4_STATUS_DAMAGED, 0, "Filesystem error occ=
ured");
> +=09switch ( get_super_private(sb)->onerror ) {
> +=09case 0:
> +=09=09reiser4_panic("foobar-42", "Filesystem error occured\n");
> +=09case 1:
> +=09=09if ( sb->s_flags & MS_RDONLY )
> +=09=09=09return;
> +=09=09sb->s_flags |=3D MS_RDONLY;
> +=09=09break;
> +=09case 2:
> +=09=09machine_restart(NULL);

Probably not something you should do at fs level.

> +/* free this znode */
> +reiser4_internal void
> +zfree(znode * node /* znode to free */ )
> +{
> +=09assert("nikita-465", node !=3D NULL);
> +=09assert("nikita-2120", znode_page(node) =3D=3D NULL);
> +=09assert("nikita-2301", owners_list_empty(&node->lock.owners));
> +=09assert("nikita-2302", requestors_list_empty(&node->lock.requestors));
> +=09assert("nikita-2663", capture_list_is_clean(ZJNODE(node)) && NODE_LIS=
T(ZJNODE(node)) =3D=3D NOT_CAPTURED);
> +=09assert("nikita-2773", !JF_ISSET(ZJNODE(node), JNODE_EFLUSH));
> +=09assert("nikita-3220", list_empty(&ZJNODE(node)->jnodes));
> +=09assert("nikita-3293", !znode_is_right_connected(node));
> +=09assert("nikita-3294", !znode_is_left_connected(node));
> +=09assert("nikita-3295", node->left =3D=3D NULL);
> +=09assert("nikita-3296", node->right =3D=3D NULL);

Are all these still required? Seems bit too defensive for the kernel.

> +
> +
> +=09/* not yet phash_jnode_destroy(ZJNODE(node)); */
> +
> +=09/* poison memory. */
> +=09ON_DEBUG(memset(node, 0xde, sizeof *node));

Poisoning belongs to slab, not fs.

> +/* allocate fresh znode */
> +reiser4_internal znode *
> +zalloc(int gfp_flag /* allocation flag */ )
> +{
> +=09znode *node;
> +
> +=09node =3D kmem_cache_alloc(znode_slab, gfp_flag);
> +=09return node;
> +}

Please drop this useless wrapper.

> +reiser4_internal void
> +znode_remove(znode * node /* znode to remove */ , reiser4_tree * tree)
> +{
> +=09assert("nikita-2108", node !=3D NULL);
> +=09assert("nikita-470", node->c_count =3D=3D 0);
> +=09assert("zam-879", rw_tree_is_write_locked(tree));
> +
> +=09/* remove reference to this znode from cbk cache */
> +=09cbk_cache_invalidate(node, tree);
> +
> +=09/* update c_count of parent */
> +=09if (znode_parent(node) !=3D NULL) {
> +=09=09assert("nikita-472", znode_parent(node)->c_count > 0);
> +=09=09/* father, onto your hands I forward my spirit... */
> +=09=09znode_parent(node)->c_count --;
> +=09=09node->in_parent.node =3D NULL;
> +=09} else {
> +=09=09/* orphaned znode?! Root? */

Drop the useless else branch.

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/debug.c=092005-06-03 17:49:38.293184063 +0=
400
> @@ -0,0 +1,447 @@
> +/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
> + * reiser4/README */
> +
> +/* Debugging facilities. */
> +
> +/*
> + * This file contains generic debugging functions used by reiser4. Rough=
ly
> + * following:
> + *
> + *     panicking: reiser4_do_panic(), reiser4_print_prefix().
> + *
> + *     locking: schedulable(), lock_counters(), print_lock_counters(),
> + *     no_counters_are_held(), commit_check_locks()
> + *
> + *     {debug,trace,log}_flags: reiser4_are_all_debugged(),
> + *     reiser4_is_debugged(), get_current_trace_flags(),
> + *     get_current_log_flags().
> + *
> + *     kmalloc/kfree leak detection: reiser4_kmalloc(), reiser4_kfree(),
> + *     reiser4_kfree_in_sb().

Please don't do this! We've had enough trouble trying to get the
current subsystem specific allocators out, so do not introduce a new one. I=
f
you need memory leak detection, make it generic and submit that. Reiser4, l=
ike
all other subsystems, should use kmalloc() and friends directly.

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/debug.h=092005-06-03 17:49:38.297184283 +0=
400
> +
> +/*
> + * Error code tracing facility. (Idea is borrowed from XFS code.)

Could this be turned into a generic facility?

> + *
> + * Suppose some strange and/or unexpected code is returned from some fun=
ction
> + * (for example, write(2) returns -EEXIST). It is possible to place a
> + * breakpoint in the reiser4_write(), but it is too late here. How to fi=
nd out
--
> +#define RETERR(code) =09=09=09=09\
> +({=09=09=09=09=09=09\
> +=09typeof(code) __code;=09=09=09\
> +=09=09=09=09=09=09\
> +=09__code =3D (code);=09=09=09\
> +=09return_err(__code, __FILE__, __LINE__);=09\
> +=09__code;=09=09=09=09=09\
> +})

> +#define reiser4_internal

Please drop the above useless #define.

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/emergency_flush.c=092005-06-03 17:51:59.00=
0905353 +0400
> @@ -0,0 +1,913 @@
> +/* Copyright 2002, 2003 by Hans Reiser, licensing governed by reiser4/RE=
ADME */
> +
> +/* This file exists only until VM gets fixed to reserve pages properly, =
which
> + * might or might not be very political. */

Please fix vm instead of working around it in fs.

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/init_super.c=092005-06-03 17:51:27.9592019=
50 +0400
> +
> +#define _INIT_PARAM_LIST (struct super_block * s, reiser4_context * ctx,=
 void * data, int silent)
> +#define _DONE_PARAM_LIST (struct super_block * s)
> +
> +#define _INIT_(subsys) static int _init_##subsys _INIT_PARAM_LIST
> +#define _DONE_(subsys) static void _done_##subsys _DONE_PARAM_LIST

Please remove this macro obfuscation.

> +
> +_DONE_EMPTY(exit_context)
> +
> +struct reiser4_subsys {
> +=09int  (*init) _INIT_PARAM_LIST;
> +=09void (*done) _DONE_PARAM_LIST;
> +};
> +
> +#define _SUBSYS(subsys) {.init =3D &_init_##subsys, .done =3D &_done_##s=
ubsys}
> +static struct reiser4_subsys subsys_array[] =3D {
> +=09_SUBSYS(mount_flags_check),
> +=09_SUBSYS(sinfo),
> +=09_SUBSYS(context),
> +=09_SUBSYS(parse_options),
> +=09_SUBSYS(object_ops),
> +=09_SUBSYS(read_super),
> +=09_SUBSYS(tree0),
> +=09_SUBSYS(txnmgr),
> +=09_SUBSYS(ktxnmgrd_context),
> +=09_SUBSYS(ktxnmgrd),
> +=09_SUBSYS(entd),
> +=09_SUBSYS(formatted_fake),
> +=09_SUBSYS(disk_format),
> +=09_SUBSYS(sb_counters),
> +=09_SUBSYS(d_cursor),
> +=09_SUBSYS(fs_root),
> +=09_SUBSYS(safelink),
> +=09_SUBSYS(exit_context)
> +};

The above is overkill and silly. parse_options and read_super, for
example, are _not_ a subsystem inits but regular fs ops. Please consider
dropping this altogether but at least trim it down to something sane.

> --- /dev/null=092003-09-23 21:59:22.000000000 +0400
> +++ linux-2.6.11-vs/fs/reiser4/page_cache.c=092005-06-03 17:51:59.0039055=
18 +0400
> +/* one-time initialization of fake inodes handling functions. */
> +reiser4_internal int
> +init_fakes()
> +{
> +=09return 0;
> +}

Please drop this empty function.
