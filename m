From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: [patch 6/7] reiser4: writeback_inodes implementation
Date: Sat, 06 Feb 2010 02:07:48 +0100
Message-ID: <4B6CC0E4.1010105@free.fr>
References: <201002020256.27208.edward.shishkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201002020256.27208.edward.shishkin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Hi Edward,

Le 02/02/2010 02:56, Edward Shishkin a =E9crit :
> . add reiser4 implementation of ->writeback_inodes()
>   super operation;
> . cleanup comments.
>=20
> Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
> ---
>  fs/reiser4/context.c    |    3 +-
>  fs/reiser4/context.h    |    2 -
>  fs/reiser4/entd.c       |    7 ++++--
>  fs/reiser4/page_cache.c |   12 +++++------
>  fs/reiser4/super_ops.c  |   49 +++++++++++++++++++++++++++++--------=
-----------
>  fs/reiser4/txnmgr.c     |    2 -
>  6 files changed, 45 insertions(+), 30 deletions(-)
>=20
[...]
> =20
> Index: linux-2.6.33-rc5-mm1/fs/reiser4/super_ops.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.33-rc5-mm1.orig/fs/reiser4/super_ops.c
> +++ linux-2.6.33-rc5-mm1/fs/reiser4/super_ops.c
> @@ -379,48 +379,59 @@ static void reiser4_clear_inode(struct i
[...]
> -static void reiser4_sync_inodes(struct super_block *super,
> -			       struct writeback_control *wbc)
> +static int reiser4_writeback_inodes(struct super_block *super,
> +				    struct bdi_writeback *wb,
> +				    struct writeback_control *wbc)
>  {
> -	reiser4_context *ctx;
> +	int ret;
>  	long to_write;
> +	reiser4_context *ctx;
> =20
>  	if (wbc->for_kupdate)
>  		/* reiser4 has its own means of periodical write-out */
> -		return;
> -
> -	to_write =3D wbc->nr_to_write;
> +		goto skip;
>  	assert("vs-49", wbc->older_than_this =3D=3D NULL);
> =20
> +	spin_unlock(&inode_lock);

It seems that reiser4 can't be built as a module because of these acces=
s to inode_lock...

Kernel: arch/x86/boot/bzImage is ready  (#13)
  Building modules, stage 2.
  MODPOST 188 modules
ERROR: "inode_lock" [fs/reiser4/reiser4.ko] undefined!
make[1]: *** [__modpost] Erreur 1
make: *** [modules] Erreur 2

~~
laurent

