From: Hans Reiser <reiser@namesys.com>
Subject: Re: [Fwd: [PATCH] reiser4: fix a use after free bug in reiser4_parse_options]
Date: Mon, 22 Nov 2004 21:21:36 -0800
Message-ID: <41A2C8E0.8020808@namesys.com>
References: <41A2523F.2050201@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22519-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41A2523F.2050201@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, vs <vs@thebsh.namesys.com>

Apologies, things have been hectic at Namesys.

Vs, please review tomorrow and comment.

Hans

Laurent Riffard wrote:

> Hello,
>
> I posted this patch last week and nobody replied.
>
> So, if there is no objections, Andrew please apply.
>
> Thank you.
>
> -------- Message original --------
> Sujet: [PATCH] reiser4: fix a use after free bug in
> reiser4_parse_options
> Date: Thu, 18 Nov 2004 00:09:36 +0100
> De: Laurent Riffard <laurent.riffard@free.fr>
> Pour: reiserfs-list@namesys.com
>
> This patch fix a "use after kfree" bug in reiser4_parse_options.
>
> Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>
> ---
>
> diff -u linux-2.6-orig/fs/reiser4/vfs_ops.c
> linux-2.6/fs/reiser4/vfs_ops.c
> --- linux-2.6-orig/fs/reiser4/vfs_ops.c    2004-11-17
> 23:43:22.186242952 +0100
> +++ linux-2.6/fs/reiser4/vfs_ops.c    2004-11-17 23:39:15.935678728 +0100
> @@ -1060,8 +1060,6 @@
>      });
>  #endif
>
> -    kfree(opts);
> -
>      sbinfo->tmgr.atom_max_size = txnmgr_get_max_atom_size(s);
>      sbinfo->tmgr.atom_max_age = REISER4_ATOM_MAX_AGE / HZ;
>      sbinfo->tmgr.atom_max_flushers = ATOM_MAX_FLUSHERS;
> @@ -1089,6 +1087,9 @@
>      sbinfo->ra_params.flags = 0;
>
>      result = parse_options(opt_string, opts, p - opts);
> +
> +    kfree(opts);
> +
>      if (result != 0)
>          return result;
>
>

