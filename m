From: "Jack Byer" <ojbyer@usa.net>
Subject: Re: can not compile reiser4
Date: Sun, 10 Aug 2003 20:05:22 -0400
Message-ID: <003901c35f9c$420fbb50$0200a8c0@zel>
References: <002601c35f5d$689442d0$0200a8c0@zel> <200308101527.35667.marcelo@macp.eti.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I don't understand how the patch could be the problem. It doesn't change
anything in the fs/reiser4 directory at all. The file that won't compile is
fs/reiser4/entd.c, which is the most recent version from
bk://bk.namesys.com/bk/reiser4

----- Original Message ----- 
From: "Marcelo Pacheco" <marcelo@macp.eti.br>
To: "Jack Byer" <ojbyer@usa.net>
Sent: Sunday, August 10, 2003 2:27 PM
Subject: Re: can not compile reiser4


> That patch is old and outdated.
> All you need is on the bk trees, except for the attached small compilation
patch that namesys hasn't took action yet.
>
> Marcelo
>
> On Sunday 10 August 2003 13:35, Jack Byer wrote:
> > I'm trying to compile a 2.6.0-test2 kernel with reiser4 on a spare
system.
> > I downloaded the latest reiser 4 sources from bitkeeper into the fs
> > directory of a vanilla 2.6.0-test2 tree using the instructions on your
web
> > site ( bk clone bk://bk.namesys.com/bk/reiser4)
> > Then I applied the 2.6.0-test2-reiser4-2.6.0-test2.diff patch from your
ftp
> > site.
> > When I try to compile, I get the following error:
> >
> >   CC      fs/reiser4/entd.o
> > In file included from include/asm/hardirq.h:6,
> >                  from fs/reiser4/debug.h:17,
> >                  from fs/reiser4/entd.c:5:
> > include/linux/irq.h:69: warning: size of `irq_desc' is 28672 bytes
> > fs/reiser4/entd.c: In function `wait_for_flush':
> > fs/reiser4/entd.c:387: structure has no member named `pressure'
> > make[2]: *** [fs/reiser4/entd.o] Error 1
> > make[1]: *** [fs/reiser4] Error 2
> > make: *** [fs] Error 2
> >
> > Also, the "size of `irq_desc' is 28672 bytes" warning was printed for
every
> > file in the reiser4 directory up to that point.
>
> linux 2.6.0 and reiser4 (patch/bugfix)
> Date: 2003-08-02 07:58
> From: "Pillars.NET" <bobvin@pillars.net>
> To: reiserfs-list@namesys.com
>
> Figured out how to use bk to pull in the latest trees from
> linux.bkbits.net and bk.namesys.com and merge the two.
>
> Tried compiling a linux 2.6.0-test2 kernel with reiser4 built-in (not
> as a module)
>
> Ran into a compile-time error: "undefined reference to _udivdi3",
> which is described by one LKML author as "somebody is doing a 64-bit
> integer divide without pulling in the relevant gcc library."
>
> Poked around and found in "include/div64.h" a helper function called
> "div_long_long_rem" which appears to be custom-made for this type of
> problem.
>
> Here's what I changed to make the compiler happy:
>
> root@pillars:/usr/src/linux-2.6.0# diff -u
fs/reiser4/plugin/item/ctail.c.orig fs/reiser4/plugin/item/ctail.c
> --- ctail.c.orig        2003-08-02 06:53:07.000000000 -0400
> +++ fs/reiser4/plugin/item/ctail.c      2003-08-02
06:41:15.000000000 -0400
> @@ -55,7 +55,8 @@
>  cluster_index_by_coord(const coord_t * coord)
>  {
>         reiser4_key  key;
> -       return get_key_offset(item_key_by_coord(coord, &key)) /
cluster_size_by_coord(coord),&rem;
> +       unsigned long rem;
> +       return div_long_long_rem(get_key_offset(item_key_by_coord(coord,
&key)),cluster_size_by_coord(coord),&rem);
>  }
>
>  static char *
> @@ -764,13 +765,14 @@
>  utmost_child_ctail(const coord_t * coord, sideof side, jnode ** child)
>  {
>         reiser4_key key;
> +       long unsigned rem;
>
>         assert("edward-257", coord != NULL);
>         assert("edward-258", child != NULL);
>         assert("edward-259", side == LEFT_SIDE);
>         assert("edward-260", item_plugin_by_coord(coord) ==
item_plugin_by_id(CTAIL_ID));
>
> -       if (get_key_offset(&key) != cluster_size_by_coord(coord) *
(get_key_offset(&key) / cluster_size_by_coord(coord)))
> +       if (get_key_offset(&key) != cluster_size_by_coord(coord) *
div_long_long_rem(get_key_offset(&key),cluster_size_by_coord(coord),&rem))
>                 *child = NULL;
>         else
>                 *child = jlook_lock(current_tree,
get_key_objectid(item_key_by_coord(coord, &key)),
cluster_index_by_coord(coord));
>
>
>

