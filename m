From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-tree crashes
Date: Mon, 15 Mar 2004 14:35:47 +0300
Message-ID: <200403151435.47727.vitaly@namesys.com>
References: <4054D69A.5040308@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4054D69A.5040308@arcor.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Franz Mueller <fm4@arcor.de>, reiserfs-list@namesys.com

On Monday 15 March 2004 01:03, Franz Mueller wrote:
> Hello reiserfs-Mailinglist,

Hello,

> the latest version of reiserfsck (3.6.13) doesn't help to solve my
> problem. I am using SuSE 9.0 with kernel 2.4.21. When I run
>
> reiserfsck --rebuild-tree -S /dev/hdb4
>
> I get the following error message:
>
> Will rebuild the filesystem (/dev/hdb4) tree
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> Replaying journal..
> 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Sun Mar 14 22:55:09 2004
> ###########
>
> Pass 0:
> ####### Pass 0 #######
> The whole partition (7689110 blocks) is to be scanned
> Skipping 8445 blocks (super block, journal, bitmaps) 7680665 blocks will
> be read
> 0%....20%.block 2008259: The number of items (270) is incorrect, should
> be (169) - corrected
> block 2008259: The free space (0) is incorrect, should be (16) - corrected
> pass0: vpf-10110: block 2008259, item (0): Unknown item type found
> [17235969 0 0xb7c1000 ??? (15)] - deleted
> lbalance.c 1019 leaf_delete_items_entirely
> leaf_delete_items_entirely: bad leaf 2008259: level=1, nr_items=168,
> free_space=40 rdkey
> Abgebrochen
>
> Is there anything else that can be done?

Would you pack the fs metadata with 
    debugreiserfs -p -S /dev/hdb4 | bzip2 -c > hdb4.bz2
and allow us to download it? I would investigate the 
problem locally then.

-- 
Thanks,
Vitaly Fertman
