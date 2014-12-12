From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH 1/1] reiserfs: destroy allocated commit workqueue
Date: Fri, 12 Dec 2014 17:02:07 +0100
Message-ID: <548B117F.7090509@suse.cz>
References: <1418398169-19820-1-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=v506WAYP2Tvtp3v8d9DeeeCngwYvl2CbgrgWBvQHtQg=;
        b=KgQGNfdhUXzr3NEySOP0R0yMFvH3rz9yaVgOXvG99JqiOdukoYgKT8BlIjeVBl3p3L
         tcM45sMVGmJwBaOhntT8ZJfOHscQacCf0nDfz0b3YVH5SfmXUcH0L+DVrrysf4V96y9S
         b/YpS5gt1ZFaQ6LI8wM41U3F02FBhfUDCD11P9ZhFY7v7TU2zTZm7u82ZLiSI4nZK93d
         IQMLI/YyoMicImWoQsQq7D7Zj3QeTVT6lQcsNMMm3aiq5y5/57aLYJYMPO03JcnkdBpH
         +qUqb93HULVF7HSV5asrdkwH77FUMW4QtToOncBvsfFD8JbHhJ6kfYyiBfsMewitd+7v
         bnjA==
In-Reply-To: <1418398169-19820-1-git-send-email-jslaby@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, All Versions <stable@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>

On 12/12/2014, 04:29 PM, Jiri Slaby wrote:
> When resirefs is trying to mount a partition, it creates a commit
> workqueue (sbi->commit_wq). But when mount fails later, the workqueue
> is not freed.
>=20
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Reported-by: auxsvr@gmail.com
> Reported-by: Beno=C3=AEt Monin <benoit.monin@gmx.fr>
> Cc: Jan Kara <jack@suse.cz>
> Cc: All Versions <stable@vger.kernel.org>

This is not quite correct. It was introduced in commit
797d9016ceca69879bb273218810fa0beef46aac (reiserfs: use per-fs commit
workqueues), so only 3.16+ is affected.

> Cc: reiserfs-devel@vger.kernel.org
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
>=20


--=20
js
suse labs
