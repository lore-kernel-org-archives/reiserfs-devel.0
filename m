From: Grant Miner <mine0057@mrs.umn.edu>
Subject: link error [was Re: Autoconf error]
Date: Wed, 30 Jul 2003 18:04:49 -0500
Message-ID: <3F284F11.1080104@mrs.umn.edu>
References: <3F255543.8010409@mrs.umn.edu>	<3F255920.3070804@mrs.umn.edu>	<1059455220.7235.13.camel@haron.namesys.com>	<1059459151.14479.5.camel@localhost>	<1059459291.27547.3.camel@haron.namesys.com>	<1059460212.1881.1.camel@localhost>	<1059460229.10291.0.camel@haron.namesys.com>	<3F26C062.4070409@mrs.umn.edu>	<1059542267.14095.11.camel@haron.namesys.com>	<16168.4042.555742.436499@laputa.namesys.com>	<16168.4402.451095.462365@laputa.namesys.com> <16168.4948.764071.889907@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16168.4948.764071.889907@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

> 
> Try this:
> ----------------------------------------------------------------------
> ===== fs/reiser4/context.h 1.28 vs edited =====
> --- 1.28/context.h	Tue Jul 29 20:06:27 2003
> +++ edited/fs/reiser4/context.h	Wed Jul 30 22:42:09 2003
> @@ -229,8 +229,11 @@
>   * directory. Commit will be performed by ktxnmgrd. */
>  static inline void context_set_commit_async(reiser4_context * ctx)
>  {
> -	ctx->nobalance = 1;
> -	ctx->trans->flags |= TXNH_DONT_COMMIT;
> +	reiser4_context *context;
> +
> +	context = ctx->parent;
> +	context->nobalance = 1;
> +	context->trans->flags |= TXNH_DONT_COMMIT;
>  }
>  
>  extern int reiser4_exit_context(reiser4_context * context);
> ----------------------------------------------------------------------
>

I didn't get a chance to test your patch yet, since after pulling
changes to the reiser4-linux-2.5 tree I received this link error (I
might try going back a changeset):

make[1]: `arch/i386/kernel/asm-offsets.s' is up to date.
   CHK     include/linux/compile.h
./scripts/pnmtologo -t clut224 -n logo_linux_clut224 -o
drivers/video/logo/logo_linux_clut224.c
drivers/video/logo/logo_linux_clut224.ppm
   CC      drivers/video/logo/logo_linux_clut224.o
   LD      drivers/video/logo/built-in.o
   LD      drivers/video/built-in.o
   LD      drivers/built-in.o
   GEN     .version
   CHK     include/linux/compile.h
   UPD     include/linux/compile.h
   CC      init/version.o
   LD      init/built-in.o
   LD      .tmp_vmlinux1
fs/built-in.o(.text+0x100d55): In function `cluster_index_by_coord':
: undefined reference to `__udivdi3'
fs/built-in.o(.text+0x101ee9): In function `utmost_child_ctail':
: undefined reference to `__umoddi3'
make: *** [.tmp_vmlinux1] Error 1

Hopefully that is useful to you


