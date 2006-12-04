From: Guilherme Covolo <smyows@youare.not.br>
Subject: Re: Reiser4 for 2.6.19
Date: Mon, 4 Dec 2006 08:53:37 -0200
Message-ID: <200612040853.37449.smyows@youare.not.br>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

great job :)

Em Domingo 03 Dezembro 2006 11:49, Laurent Riffard escreveu:
> [this is a repost, since half of my previous mails didn't reach
>  reiserfs mailing-list]
>
> Hi,
>
> There is 10 patches in this series, first one is "Reiser4 for 2.6.18
> version 3". It's made up from the last Namesys Reiser4 patch for vanilla
> kernel
> (http://ftp.namesys.com/pub/reiser4-for-2.6/2.6.18/reiser4-for-2.6.18-3.pat
>ch.gz), updated to apply cleanly on top of 2.6.19 kernel. One can
> alternatively apply the original patch from Namesys
> (reiser4-for-2.6.18-3.patch.gz) on top of 2.6.19 kernel, it will
> successfully apply with some oddities.
>
> The 9 next patches are compile-fixes for 2.6.19 or bug-fixes I picked up
> from reiserfs mailing-list.
>
> Andrew Wade (3):
>     Reiser4: fix use after free in jrelse_tail
>     Reiser4: release d_ref
>     Reiser4: release d_ref (fix)
>
> Edward Shishkin (2):
>     Reiser4 for 2.6.18 version 3
>     reiser4-generic_file_read-fix
>
> Laurent Riffard (5):
>     Reiser4: cometics changes in mm/filemap.c.
>     Reiser4: fix calls to kmem_cache_destroy
>     Reiser4: Replace inode.u.generic_ip with inode.i_private
>     Reiser4: inode.i_blksize suppression
>     Reiser4: remove unnecessary config.h includes.
>
> The whole series is available as in a single patch:
> http://laurent.riffard.free.fr/reiser4/reiser4-for-2.6.19.patch.gz.
>
> I'm not a filesystem guru, nor I'm affiliated with Namesys. These
> patches just suit my needs. It works for me and I hope it will help
> somebody else.
>
> ~~
> laurent
