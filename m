From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 24/29] reiserfs: Avoid comma separated statements
Date: Sat, 30 Jan 2021 11:04:43 -0800
Message-ID: <4e90351d3b78154d451a39c1a8577b583b8467a7.camel@perches.com>
References: <cover.1598331148.git.joe@perches.com>
         <29b5ea94496d64e7a73af216b01f26d9ff7ac1fe.1598331149.git.joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <29b5ea94496d64e7a73af216b01f26d9ff7ac1fe.1598331149.git.joe@perches.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> Use semicolons and braces.

ping?

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0fs/reiserfs/fix_node.c | 36 ++++++++++++++++++++++++------------
> =A01 file changed, 24 insertions(+), 12 deletions(-)
>=20
> diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
> index fefe87e1c099..aea63e67a42b 100644
> --- a/fs/reiserfs/fix_node.c
> +++ b/fs/reiserfs/fix_node.c
> @@ -235,8 +235,10 @@ static void check_left(struct tree_balance *tb, int =
h, int cur_free)
> =A0	d_size =3D 0, ih_size =3D IH_SIZE;
> =A0
>=20
> =A0	/* first item may be merge with last item in left neighbor */
> -	if (vi->vi_type & VI_TYPE_LEFT_MERGEABLE)
> -		d_size =3D -((int)IH_SIZE), ih_size =3D 0;
> +	if (vi->vi_type & VI_TYPE_LEFT_MERGEABLE) {
> +		d_size =3D -((int)IH_SIZE);
> +		ih_size =3D 0;
> +	}
> =A0
>=20
> =A0	tb->lnum[0] =3D 0;
> =A0	for (i =3D 0; i < vn->vn_nr_item;
> @@ -321,8 +323,10 @@ static void check_right(struct tree_balance *tb, int=
 h, int cur_free)
> =A0	d_size =3D 0, ih_size =3D IH_SIZE;
> =A0
>=20
> =A0	/* last item may be merge with first item in right neighbor */
> -	if (vi->vi_type & VI_TYPE_RIGHT_MERGEABLE)
> -		d_size =3D -(int)IH_SIZE, ih_size =3D 0;
> +	if (vi->vi_type & VI_TYPE_RIGHT_MERGEABLE) {
> +		d_size =3D -(int)IH_SIZE;
> +		ih_size =3D 0;
> +	}
> =A0
>=20
> =A0	tb->rnum[0] =3D 0;
> =A0	for (i =3D vn->vn_nr_item - 1; i >=3D 0;
> @@ -1534,8 +1538,10 @@ static int ip_check_balance(struct tree_balance *t=
b, int h)
> =A0			nver1 =3D get_num_ver(vn->vn_mode, tb, h,
> =A0					    0, -1, 0, -1,
> =A0					    snum012 + NOTHING_SHIFT_FLOW, FLOW);
> -			if (nver > nver1)
> -				nset =3D NOTHING_SHIFT_FLOW, nver =3D nver1;
> +			if (nver > nver1) {
> +				nset =3D NOTHING_SHIFT_FLOW;
> +				nver =3D nver1;
> +			}
> =A0		}
> =A0
>=20
> =A0		/*
> @@ -1559,8 +1565,10 @@ static int ip_check_balance(struct tree_balance *t=
b, int h)
> =A0					     ((tb->lbytes !=3D -1) ? 1 : 0),
> =A0					     tb->lbytes, 0, -1,
> =A0					     snum012 + LEFT_SHIFT_FLOW, FLOW);
> -			if (lnver > lnver1)
> -				lset =3D LEFT_SHIFT_FLOW, lnver =3D lnver1;
> +			if (lnver > lnver1) {
> +				lset =3D LEFT_SHIFT_FLOW;
> +				lnver =3D lnver1;
> +			}
> =A0		}
> =A0
>=20
> =A0		/*
> @@ -1590,8 +1598,10 @@ static int ip_check_balance(struct tree_balance *t=
b, int h)
> =A0					     tb->rbytes,
> =A0					     snum012 + RIGHT_SHIFT_FLOW, FLOW);
> =A0
>=20
> -			if (rnver > rnver1)
> -				rset =3D RIGHT_SHIFT_FLOW, rnver =3D rnver1;
> +			if (rnver > rnver1) {
> +				rset =3D RIGHT_SHIFT_FLOW;
> +				rnver =3D rnver1;
> +			}
> =A0		}
> =A0
>=20
> =A0		/*
> @@ -1622,8 +1632,10 @@ static int ip_check_balance(struct tree_balance *t=
b, int h)
> =A0					       ((tb->rbytes !=3D -1) ? 1 : 0)),
> =A0					      tb->rbytes,
> =A0					      snum012 + LR_SHIFT_FLOW, FLOW);
> -			if (lrnver > lrnver1)
> -				lrset =3D LR_SHIFT_FLOW, lrnver =3D lrnver1;
> +			if (lrnver > lrnver1) {
> +				lrset =3D LR_SHIFT_FLOW;
> +				lrnver =3D lrnver1;
> +			}
> =A0		}
> =A0
>=20
> =A0		/*


