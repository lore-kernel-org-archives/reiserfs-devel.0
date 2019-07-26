From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] fs: reiserfs: Fix possible null-pointer dereferences in
 remove_from_transaction()
Date: Fri, 26 Jul 2019 15:54:16 -0700
Message-ID: <20190726155416.86f1b96302273b91129e6dc3@linux-foundation.org>
References: <20190726083838.8301-1-baijiaju1990@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564181657;
        bh=0I8ibO4ILGJpL8erC1yuBP5LAOpyh2rkqKPnbsCnLuY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pK1MW8MvICaSKOlCQqHnQ9l6nuLWH6z5U/EVYmUGTyLWaJMRR5LGPnmkHYCxsAgVO
         blFDeY2cL9fAqNHU9VjvQ4Kfda8QxzbtCF2lQT8kJ+rUUblKp5A13I2P6xwKeiY4qq
         zxEv6sAEkwCslSXWueRrCDWR7IN/4kpH6j9BxHnE=
In-Reply-To: <20190726083838.8301-1-baijiaju1990@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: jack@suse.cz, arnd@arndb.de, linux.bhar@gmail.com, hariprasad.kelam@gmail.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 26 Jul 2019 16:38:38 +0800 Jia-Ju Bai <baijiaju1990@gmail.com> wrote:

> In remove_from_transaction(), there is an if statement on line 3447 to
> check whether bh is NULL:
>     if (bh)

We already know that bh != NULL here.

	cn = get_journal_hash_dev(sb, journal->j_hash_table, blocknr);
	if (!cn || !cn->bh) {
		return ret;
	}
	bh = cn->bh;


Please prepare a patch to remove the unneeded test?
