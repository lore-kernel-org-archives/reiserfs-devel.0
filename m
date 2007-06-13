From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 03/40] reiserfs: use is_reusable to catch corruption
Date: Wed, 13 Jun 2007 11:54:08 -0400
Message-ID: <46701320.4000603@suse.com>
References: <20070611190309.532091171@suse.com> <20070611190629.567169530@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20070611190629.567169530@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

jeffm@suse.com wrote:
> +	if (sb_block_count(REISERFS_SB(s)->s_rs) > blocks) {
> +		reiserfs_error(th->t_super, "bitmap-4072",
> +		               "Trying to free block outside file system "
> +			       "boundaries (%lu > %lu)",
> +			       block, blocks);
> +		return;
> +	}

Should be:
        if (block > sb_block_count(REISERFS_SB(s)->s_rs)) {
                reiserfs_error(th->t_super, "bitmap-4072",
                               "Trying to free block outside file system "
                               "boundaries (%lu > %lu)",
                               block, sb_block_count(REISERFS_SB(s)->s_rs));
                return;


Too many balls in the air.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFGcBMgLPWxlyuTD7IRAjgWAKCQMKvTGYkYtv2kQmA5kCFqzFvtJACgkdxM
4FGl1fbMzWx/ONgjmoVtW1M=
=xFYz
-----END PGP SIGNATURE-----
