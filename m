From: David Nielsen <Lovechild@foolclan.com>
Subject: Re: New reiser4 snapshot (as of August 22, 2003)
Date: Sat, 23 Aug 2003 10:06:06 +0200
Message-ID: <1061625965.4790.11.camel@pilot.stavtrup-st.dk>
References: <20030822150853.GA960@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030822150853.GA960@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Okay I have had the Reiser4 snapshot managing my /home for a good few
hours and while the patch itself was... very experimental... I'm
completely blown away but the exellent speed Reiser4 provides me for
usertasks.

Here's my favorite show off so far:

patch your gtk+-2.2.2 with this: 
http://members1.chello.nl/~h.lai/gtkenhancements/

leave all the exports at their defaults, this way the fileselector will
try to sort filetypes, causing some noticable slowdowns when clicking
open...

That was on ReiserFS3 - then I gave /home Reiser4 goodness and the
slowdown is completely gone it just pops up...

Please note I have a good few 100's of files in my home dir so sorting
is a considerable task.

good job guys, but please compile test next time :)

- David Nielsen



On Fri, 2003-08-22 at 17:08, Oleg Drokin wrote:
> Hello!
> 
>    I have just released new snapshot of reiser4.
>    Release notes follows.
>    Give it a try.
> 
> Reiser4 snapshot for 2003.08.22
> 
> WARNING!!! This code is experimental! WE ARE NOT KIDDING! DO NOT PUT
> ANY VALUABLE DATA ON REISER4 YET!
> 
> Fixed builds for 64bit arches (there are still some warnings, but it
> should work now, I hope). Fixed some bugs.
> There are still some stability problems on SMP machines that we are working on.
> 
> If you used reiser4progs from last snapshot (August 11th), you need to upgrade those
> to fix critical largekeys bug in mkfs.reiser4
> 
> Snapshot is released as a patch against linux-2.6.0-test3-bk9.
> REISER4_NOOPT config option (Disable compiler optimizations for reiser4 code.)
> is known to not compile on x86.
> Enable CONFIG_REISER4_LARGE_KEY, as reiser4progs are creating filesystems with
> large keys by default.
> The reiser4-kernelonly.diff file represents only required kernel modifications if you plan to use our reiser4 bk repository.
>     It does not contains any reiser4 code
> The reiser4.diff is full patch with everything included.
> 2.6.0-test3-bk9.diff.gz is a patch you need to apply on top of vanilla 2.6.0-test3 before applying reiser4 patches.
> 
> Changelog (extracted by "bk changes"):
> 
> ChangeSet@1.1204.1.1, 2003-08-22 00:37:09+04:00, zam@crimson.namesys.com
>   more fixes for the repacker: extent relocation, space reservation, transaction handling.
> 
> ChangeSet@1.1207, 2003-08-21 21:58:17+04:00, green@car.linuxhacker.ru
>   trace.c:
>     Adapt to new mapping_gfp_mask/mapping_set_gfp_mask() way to access mapping's gfp_mask
> 
> ChangeSet@1.1206, 2003-08-21 21:44:44+04:00, edward@theta.namesys.com
>   cryptcompress.c:
>     Added shorten_cryptcompress() for truncate method
> 
> ChangeSet@1.1205, 2003-08-21 18:49:48+04:00, edward@theta.namesys.com
>   cryptcompress.c:
>     Fixed
> 
> ChangeSet@1.1202.1.1, 2003-08-20 22:16:39+04:00, zam@crimson.namesys.com
>   fixing trivial bugs in the repacker code (using of not initialized vars)
> 
> ChangeSet@1.1203, 2003-08-20 22:10:56+04:00, edward@theta.namesys.com
>   cryptcompress.c:
>     Added append_hole_cryptcompress()
>     Cleanups in next_cluster_stat() 
> 
> ChangeSet@1.1201, 2003-08-20 17:27:40+04:00, zam@crimson.namesys.com
>   undo last fix.
> 
> ChangeSet@1.1199.1.1, 2003-08-20 17:04:31+04:00, edward@theta.namesys.com
>   ctail.h:
>     Added prototypes
>   ctail.c:
>     Changed status of cluster index 
>   cryptcompress.c:
>     Changed page_of_cluster(),
>     Added file_to_clust_count(),
>     Cleanups. 
> 
> ChangeSet@1.1198.1.1, 2003-08-19 23:11:45+04:00, zam@crimson.namesys.com
>   a race in renew_sibling_link() fix. 
> 
> ChangeSet@1.1194.1.1, 2003-08-19 22:24:03+04:00, edward@theta.namesys.com
>   cryptcompress.c:
>     Changed update_cluster().
>     write_cryptcompress_flow() was rewritten in accordance
>     with these changes.
>     Cleanups. 
> 
> ChangeSet@1.1198, 2003-08-19 21:18:07+04:00, zam@crimson.namesys.com
>   forgot to remove #endif
> 
> ChangeSet@1.1197, 2003-08-19 21:10:38+04:00, zam@crimson.namesys.com
>   solving FIXMEs
> 
> ChangeSet@1.1196, 2003-08-19 17:34:11+04:00, zam@crimson.namesys.com
>   introducing reiser4 own error codes E_REPEAT, E_DEADLOCK
> 
> ChangeSet@1.1195, 2003-08-19 14:45:30+04:00, zam@crimson.namesys.com
>   comment update 
> 
> ChangeSet@1.1194, 2003-08-18 20:41:55+04:00, edward@theta.namesys.com
>   cryptcompress.c:
>     Cleanups. 
>     Added checking of cluster invariants.  
> 
> ChangeSet@1.1193, 2003-08-18 16:36:41+04:00, edward@theta.namesys.com
>   ctail.h:
>     rename
>   ctail.c, cryptcompress.c:
>     index-offset converting for pages and clusters
> 
> ChangeSet@1.1192, 2003-08-18 15:47:24+04:00, god@laputa.namesys.com
>   Merge god@thebsh:/home/bk/reiser4
>   into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4
> 
> ChangeSet@1.1185.1.3, 2003-08-18 15:45:10+04:00, god@laputa.namesys.com
>   fix "off-by-many" error in new truncate code
> 
> ChangeSet@1.1185.1.2, 2003-08-18 15:44:34+04:00, god@laputa.namesys.com
>   remove wrong assertion
> 
> ChangeSet@1.1191, 2003-08-18 10:57:28+04:00, zam@belka.namesys.com
>   jnode.c:
>     jnode_check stub fix.
> 
> ChangeSet@1.1190, 2003-08-17 23:36:11+04:00, zam@crimson.namesys.com
>   reiser4 compilable again
> 
> ChangeSet@1.1187.1.1, 2003-08-17 23:21:20+04:00, zam@crimson.namesys.com
>   endless loop fix in the repacker code.
> 
> ChangeSet@1.1188, 2003-08-17 21:41:44+04:00, reiser@bitshadow.namesys.com
>   Merge reiser@thebsh.namesys.com:/home/bk/reiser4
>   into bitshadow.namesys.com:/home/reiser/reiser4
> 
> ChangeSet@1.1147.3.2, 2003-08-17 21:40:19+04:00, reiser@bitshadow.namesys.com
>   c
> 
> ChangeSet@1.1147.3.1, 2003-08-17 21:39:36+04:00, reiser@bitshadow.namesys.com
>   c
> 
> ChangeSet@1.1187, 2003-08-15 23:36:42+04:00, zam@crimson.namesys.com
>   Merge zam@bk.namesys.com:/home/bk/reiser4
>   into crimson.namesys.com:/mnt/store/src/reiser4-linux-2.5/fs/reiser4
> 
> ChangeSet@1.1166.1.20, 2003-08-15 23:23:30+04:00, zam@crimson.namesys.com
>   more bitmap code fixes and tree_walk is teached to take write locks on twig level after restart.  
> 
> ChangeSet@1.1185.1.1, 2003-08-15 14:35:11+04:00, god@laputa.namesys.com
>   cleanup
> 
> ChangeSet@1.1186, 2003-08-15 09:34:47+04:00, zam@crimson.namesys.com
>   Merge zam@bk.namesys.com:/home/bk/reiser4
>   into crimson.namesys.com:/mnt/store/src/reiser4-linux-2.5/fs/reiser4
> 
> ChangeSet@1.1166.1.19, 2003-08-15 09:28:41+04:00, zam@crimson.namesys.com
>   bitmap backward scan code fixes.
> 
> ChangeSet@1.1166.1.18, 2003-08-15 09:27:55+04:00, zam@crimson.namesys.com
>   `len' might be used unitialized. 
> 
> ChangeSet@1.1185, 2003-08-14 15:19:16+04:00, god@laputa.namesys.com
>   fix typo.
> 
> ChangeSet@1.1184, 2003-08-14 15:17:21+04:00, god@laputa.namesys.com
>   update
> 
> ChangeSet@1.1183, 2003-08-14 15:15:29+04:00, god@laputa.namesys.com
>   supress warning.
> 
> ChangeSet@1.1182, 2003-08-14 15:14:23+04:00, god@laputa.namesys.com
>   Merge laputa.namesys.com:/home/god/projects/2.5/fs/reiser4
>   into laputa.namesys.com:/home/god/projects/i386/fs/reiser4
> 
> ChangeSet@1.1181, 2003-08-14 15:14:10+04:00, god@laputa.namesys.com
>   tail conversion fixes.
> 
> ChangeSet@1.1180, 2003-08-14 14:51:09+04:00, god@laputa.namesys.com
>   don't update stat data during tail conversion
> 
> ChangeSet@1.1178.1.1, 2003-08-14 14:47:03+04:00, god@laputa.namesys.com
>   Merge god@thebsh:/home/bk/reiser4
>   into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4
> 
> ChangeSet@1.1179, 2003-08-14 14:43:48+04:00, god@laputa.namesys.com
>   add prototype
> 
> ChangeSet@1.1178, 2003-08-14 14:40:54+04:00, god@laputa.namesys.com
>   restore compilability
> 
> ChangeSet@1.1177, 2003-08-14 14:40:06+04:00, god@laputa.namesys.com
>   kill unused code
> 
> ChangeSet@1.1176, 2003-08-14 14:39:15+04:00, god@laputa.namesys.com
>   sync with progs
> 
> ChangeSet@1.1175, 2003-08-14 14:38:58+04:00, god@laputa.namesys.com
>   tail conversion fixes
> 
> ChangeSet@1.1174, 2003-08-14 14:38:34+04:00, god@laputa.namesys.com
>   transaction manager fixes
> 
> ChangeSet@1.1173, 2003-08-14 14:38:20+04:00, god@laputa.namesys.com
>   never mark unloaded znode dirty
> 
> ChangeSet@1.1172, 2003-08-14 14:37:37+04:00, god@laputa.namesys.com
>   cleanup
> 
> ChangeSet@1.1171, 2003-08-14 14:35:42+04:00, god@laputa.namesys.com
>   debugging code for jload()
> 
> ChangeSet@1.1170, 2003-08-14 14:35:20+04:00, god@laputa.namesys.com
>   add znode generation
> 
> ChangeSet@1.1166.1.17, 2003-08-13 22:46:06+04:00, zam@crimson.namesys.com
>   move "debugging" function atom_is_open() to debug.c as Hans asked.
> 
> ChangeSet@1.1166.5.1, 2003-08-13 22:31:40+04:00, zam@crimson.namesys.com
>   wrong set_bits usage in bitmap backward search.
> 
> ChangeSet@1.1166.1.15, 2003-08-13 22:00:54+04:00, edward@theta.namesys.com
>   object.c, cryptcompress.h:
>     rename
>   ctail.h:
>     added lookup_bias argument in find_cluster_items()
>   ctail.c:
>     added append_cluster_key_ctail 
>   file.c:
>     shared setattr_reserve()
>   cryptcompress.c:
>     Added:
>       .setattr_cryptcompress(),
>       .cryptcompress_truncate(),
>       .find_file_idx()
> 
> ChangeSet@1.1166.1.14, 2003-08-13 18:28:46+04:00, green@angband.namesys.com
>   inode.h:
>     fixed parenthesis balance
> 
> ChangeSet@1.1166.1.13, 2003-08-13 18:18:50+04:00, green@angband.namesys.com
>   inode.h:
>     Remove unneded function definitions
> 
> ChangeSet@1.1166.1.12, 2003-08-13 18:15:48+04:00, green@angband.namesys.com
>   inode.h:
>     Prevent loss of databits while shifting
> 
> ChangeSet@1.1166.1.11, 2003-08-13 18:13:15+04:00, green@angband.namesys.com
>   inode.h, inode.c:
>     inode[sg]et_oid only called macroses, so renamed macros and got rid of functions
> 
> ChangeSet@1.1166.1.10, 2003-08-13 18:12:06+04:00, green@angband.namesys.com
>   context.c:
>     Recent fix reintroduced old warning. So fixed the fix.
> 
> ChangeSet@1.1166.4.4, 2003-08-13 17:12:35+04:00, green@angband.namesys.com
>   Makefile:
>     Remove -Wcast-align, as it produces lots of unneeded and confusing warnings
>   plugin_hash.c:
>     replace incorrect casts to __u32 with casts to unsigned long
>   context.c:
>     remove unneeded cast to u32
>   znode.h:
>     Replace wrong cast to int with cast to long
>   plugin_set.h, plugin_set.c:
>     __u32casts are wrong, replace them with unsigned long
>   pseudo.c:
>     Replace erroneous  int casts to casts to long
> 
> ChangeSet@1.1166.4.3, 2003-08-13 15:54:49+04:00, green@angband.namesys.com
>   scint.h:
>     MAde scint_init_once() to return int on 64 bit platforms (to conform to 32bit ones).
>     Made scint_init to return 0 to avoid warning
> 
> ChangeSet@1.1166.4.2, 2003-08-13 15:53:54+04:00, green@angband.namesys.com
>   inode.h, inode.c:
>     introduce inode[sg]et_oid() to fix 64 bit build problems.
> 
> ChangeSet@1.1166.4.1, 2003-08-13 15:16:12+04:00, green@angband.namesys.com
>   inode.c:
>     add FIXME about not checking scint return value
> 
> ChangeSet@1.1166.3.1, 2003-08-13 08:02:18+04:00, zam@crimson.namesys.com
>   bitmap code fixes.
> 
> ChangeSet@1.1166.1.7, 2003-08-11 21:55:08+04:00, edward@theta.namesys.com
>   item.c:
>     changed can_contain_key item method for ctails
>   ctail.h:
>     added prototypes
>   ctail.c:
>     Added:
>       can_contain_key_ctail,
>       init_ctail,
>       overwrite_ctail.
>     Changed: 
>       paste_ctail
>   flush.h:
>     fixed

