From: "Vincent Ndi" <v.ndi@aramiska.net>
Subject: RE: reiserfs error messages
Date: Fri, 31 Oct 2003 10:16:52 +0100
Message-ID: <CJEKIBFPNDHNABAALMDIOECMCGAA.v.ndi@aramiska.net>
References: <200310311207.46480.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <200310311207.46480.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, Vincent Ndi <v.ndi@aramiska.net>
Cc: reiserfs-list@namesys.com

Hi,

Ok I plan to run reiserfsck but on these errors messages, there's no
indication about the corrupted partition.Can you please explain what these
messages mean.

regards
Vincent

-----Original Message-----
From: Vitaly Fertman [mailto:vitaly@namesys.com]
Sent: Friday, October 31, 2003 10:08 AM
To: Vincent Ndi
Cc: reiserfs-list@namesys.com
Subject: Re: reiserfs error messages


On Friday 31 October 2003 12:02, Vincent Ndi wrote:
> Hi everyone,
>
> My system is keeps reporting some reiserfs errors messages I don't really
> understand.Can someone advice me about the following error messages (how
to
> interpret/correct them)?
>
> 1) kernel: vs-13048: reiserfs_iget: key in inode [2 570 0 0] and key in
> entry [39 570 0 0] do not match
>
> 2)kernel: vs-6020: check_leaf_block_head: invalid free space level=1,
> nr_items=21, free_space=65112 rdkey [5654 5656 2511 -1]<0>Kernel panic:
> REISERFS: panic (device sb == 0): vs-6020: check_leaf_block_head: invalid
> free space level=1, nr_items=21, free_spa
>
> any clue will be helpful

Would you run reiserfsck on the problem partition? It seems it has some
corruptions. Use the latest reisrfsprogs:
ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.11.tar.gz

--
Thanks,
Vitaly Fertman

