From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 6/7] reiserfs: remove first_zero_hint
Date: Thu, 18 Oct 2007 14:02:08 -0400
Message-ID: <47179FA0.4010500@suse.com>
References: <20071016230210.779927000@suse.com> <20071016230258.926802000@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071016230258.926802000@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, Linux Torvalds <torvalds@linux-foundation.org>
Cc: ReiserFS Development Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeff Mahoney wrote:
>  The first_zero_hint metadata caching was never actually used, and it's
>  of dubious optimization quality. This patch removes it.
> 
>  It doesn't actually shrink the size of the reiserfs_bitmap_info struct,
>  since that doesn't work with block sizes larger than 8K. There was a big
>  fixme in there, and with all the work lately in allowing block size >
>  page size, I might as well kill the fixme as well.

Please skip this one. It's missing a chunk. I'll post the updated patch
shortly.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHF5+gLPWxlyuTD7IRAvbGAKCDEzonySupZZlsByKtllxjgFLGAACgmjJw
2nsFXIpE43J7BFzn2W+lOUA=
=m01z
-----END PGP SIGNATURE-----
