From: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>
Subject: Re: Bug report: reiserfsck --rebuild-tree not progressing
Date: Tue, 11 Apr 2006 17:40:40 +0200
Message-ID: <20060411154040.GE12333@mathematik.uni-bielefeld.de>
References: <b19177749f9fd8399d24c21c4f355efd@pandora.com> <20060411072150.GA21772@favonius> <B3A1FB37-26AC-49F0-8CDB-A14FC93BF021@pandora.com> <1144747469.6188.36.camel@tribesman.namesys.com> <20060411143425.GD12333@mathematik.uni-bielefeld.de> <1144769018.6188.52.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1144769018.6188.52.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,

On 11 Apr 2006 19:23, Vladimir V. Saveliev <vs@namesys.com> wrote:
> would you try if this patch helps, please?

> --- ./utils/debugfs/corruption.c~	2006-03-28 16:40:23.000000000 +0400
> +++ ./utils/debugfs/corruption.c	2006-04-11 19:21:39.000000000 +0400
> @@ -888,7 +888,7 @@
>  
>  	unsigned long first = fs->fs_super_bh->b_blocknr + 1;
>  	unsigned long nr_bitmap_to_corrupt;
> -	unsigned long block, bmap_nr;;
> +	unsigned long block, bmap_nr;
>  	reiserfs_bh_t * bh;
>  	unsigned int i;

This works now. Thanks!

Bernhard
