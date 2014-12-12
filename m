From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 1/1] reiserfs: destroy allocated commit workqueue
Date: Fri, 12 Dec 2014 22:27:27 +0100
Message-ID: <20141212212727.GB18669@quack.suse.cz>
References: <1418398169-19820-1-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1418398169-19820-1-git-send-email-jslaby@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jiri Slaby <jslaby@suse.cz>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, All Versions <stable@vger.kernel.org>

On Fri 12-12-14 16:29:29, Jiri Slaby wrote:
> When resirefs is trying to mount a partition, it creates a commit
> workqueue (sbi->commit_wq). But when mount fails later, the workqueue
> is not freed.
>=20
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Reported-by: auxsvr@gmail.com
> Reported-by: Beno=EEt Monin <benoit.monin@gmx.fr>
> Cc: Jan Kara <jack@suse.cz>
> Cc: All Versions <stable@vger.kernel.org>
> Cc: reiserfs-devel@vger.kernel.org
  Thanks, I've added the patch to my tree and will send it to Linus soo=
n.

								Honza
> ---
>  fs/reiserfs/super.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index ea63ab13ef92..71fbbe3e2dab 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -2172,6 +2172,9 @@ error_unlocked:
>  		reiserfs_write_unlock(s);
>  	}
> =20
> +	if (sbi->commit_wq)
> +		destroy_workqueue(sbi->commit_wq);
> +
>  	cancel_delayed_work_sync(&REISERFS_SB(s)->old_work);
> =20
>  	reiserfs_free_bitmap_cache(s);
> --=20
> 2.2.0
>=20
--=20
Jan Kara <jack@suse.cz>
SUSE Labs, CR
