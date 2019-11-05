From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v15 1/4] Add flags option to get xattr method
 paired to __vfs_getxattr
Date: Tue, 5 Nov 2019 10:48:30 +0100
Message-ID: <20191105094830.GL22379@quack2.suse.cz>
References: <20191104215253.141818-1-salyzyn@android.com>
 <20191104215253.141818-2-salyzyn@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uOVvLIfAKaABNeenvYiWQ2HO7/bSUZZppsMPK3eSjzk=; b=JXurOXfT7KbO2DUg9GnP+lNiKD
 a9+mg9F9fToU727slsl6JuU0mz2o5rlOfLjPvjLo7+pbabbIZRFcnCItgx1VinEavZiVWSpm9iKxs
 8SG/l+yjUk8/1j3SAnq+34xzGyMXOSHa5/n3czAHTzZsCgMj8NduciTLIHhZzPBmi1F4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOVvLIfAKaABNeenvYiWQ2HO7/bSUZZppsMPK3eSjzk=; b=G7hWtdEf3Hjv5SfcHdPBAcoq5E
 mMToDEfYFDlskBdJjGPSjJ0dA6GJTOyPf6OjzAxAAuylrIhVsCTXaix5tJ8caIdlb9rmf5Y0Tb/1o
 N6OFvTZx5J0nT/D1wzlqyswAnNb7ZGqufooOBoB5SFRWoHtqBU7P3QEnZSLwXrPmhPVE=;
Content-Disposition: inline
In-Reply-To: <20191104215253.141818-2-salyzyn@android.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
To: Mark Salyzyn <salyzyn@android.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>, Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org, linux-unionfs@vger.kernel.org, Andreas

> @@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  		break;
>  	case 1:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>  		break;
>  	case 2:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>  		break;
>  	case 3:

These scnprintf() changes (and there are more in the patch) probably
shouldn't be here... Otherwise the patch still looks good to me :).

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
