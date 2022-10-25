From: "NeilBrown" <neilb@suse.de>
Subject: Re: [PATCH] reiserfs: journal: Increase jl pointer check
Date: Wed, 26 Oct 2022 08:30:13 +1100
Message-ID: <166673341340.7585.173987927705263434@noble.neil.brown.name>
References: <20221025084704.3922-1-zeming@nfschina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666733419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GsChx+MZJNG5dXDKs99vdVY/KWr9zZZnfSpLrLhebqA=;
        b=1Q1d+7Rr51d6MYXDNZD5NSRsd+RrBP3t89UkSIFI4OXho3Mx53DsfYJDC2Mx5tP8+eHEVw
        XxVyDYvsWem9SkJU2bpIfyQXhkpTCPI4HnyM3guNyQeKF4AjtXMxRRCN2H+mVEqUIoot7P
        zykaHxIu+d+8/0b2ksEoHLgKf3ObLpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666733419;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GsChx+MZJNG5dXDKs99vdVY/KWr9zZZnfSpLrLhebqA=;
        b=nwqV8LR6vkXw2FIVIHBJT++eqLS73KWJjC5AoPKaZaV7rXbMGb3MU4ils8pyvbQaQQ5q8D
        fS6HQAyGJbuC8JBw==
In-reply-to: <20221025084704.3922-1-zeming@nfschina.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Li zeming <zeming@nfschina.com>
Cc: willy@infradead.org, jlayton@kernel.org, song@kernel.org, bvanassche@acm.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>

On Tue, 25 Oct 2022, Li zeming wrote:
> If kzalloc fails to allocate the jl pointer, NULL is returned directly.
>=20
> Signed-off-by: Li zeming <zeming@nfschina.com>
> ---
>  fs/reiserfs/journal.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 94addfcefede..d64e9de126c1 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -2569,6 +2569,9 @@ static struct reiserfs_journal_list *alloc_journal_li=
st(struct super_block *s)
>  	struct reiserfs_journal_list *jl;
>  	jl =3D kzalloc(sizeof(struct reiserfs_journal_list),
>  		     GFP_NOFS | __GFP_NOFAIL);
> +	if (!jl)
> +		return NULL;
> +

What do you think the __GFP_NOFAIL flag might mean?

NeilBrown



>  	INIT_LIST_HEAD(&jl->j_list);
>  	INIT_LIST_HEAD(&jl->j_working_list);
>  	INIT_LIST_HEAD(&jl->j_tail_bh_list);
> --=20
> 2.18.2
>=20
>=20
