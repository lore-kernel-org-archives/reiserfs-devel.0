From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs error messages
Date: Fri, 31 Oct 2003 16:00:46 +0300
Message-ID: <200310311600.46876.vitaly@namesys.com>
References: <CJEKIBFPNDHNABAALMDIOECMCGAA.v.ndi@aramiska.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <CJEKIBFPNDHNABAALMDIOECMCGAA.v.ndi@aramiska.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vincent Ndi <v.ndi@aramiska.net>
Cc: reiserfs-list@namesys.com

On Friday 31 October 2003 12:16, Vincent Ndi wrote:
> Hi,
>
> Ok I plan to run reiserfsck but on these errors messages, there's no
> indication about the corrupted partition.Can you please explain what these
> messages mean.
>
> regards
> Vincent
>
> On Friday 31 October 2003 12:02, Vincent Ndi wrote:
> > Hi everyone,
> >
> > My system is keeps reporting some reiserfs errors messages I don't really
> > understand.Can someone advice me about the following error messages (how
>
> to
>
> > interpret/correct them)?
> >
> > 1) kernel: vs-13048: reiserfs_iget: key in inode [2 570 0 0] and key in
> > entry [39 570 0 0] do not match

this is probably nothing to worry about if you use nfs, if not, this is a
corruption in the directory entry pointing to the file (inode).

This message was removed in later kernel versions.

> > 2)kernel: vs-6020: check_leaf_block_head: invalid free space level=1,
> > nr_items=21, free_space=65112 rdkey [5654 5656 2511 -1]<0>Kernel panic:
> > REISERFS: panic (device sb == 0): vs-6020: check_leaf_block_head: invalid
> > free space level=1, nr_items=21, free_spa

a corruption in some formatted reiserfs block, wrong free space in the 
block, probably some other corruptions exist also.

-- 
Thanks,
Vitaly Fertman
