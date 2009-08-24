From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: + fs-reiser4-add-parenths-around-x-y.patch added to -mm tree
Date: Tue, 25 Aug 2009 01:38:56 +0200
Message-ID: <4A932490.7000808@gmail.com>
References: <200908242056.n7OKu8RA010535@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200908242056.n7OKu8RA010535@imap1.linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: akpm@linux-foundation.org
Cc: jirislaby@gmail.com, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

I don't understand this brain damaged deducing
GN flags from COPI flags, but it seems that it
doesn't have any effect and we can simply remove
both those if-branches.

Anyway, thanks!

Edward.

akpm@linux-foundation.org wrote:
> The patch titled
>      fs: reiser4, add parenths around !X & Y
> has been added to the -mm tree.  Its filename is
>      fs-reiser4-add-parenths-around-x-y.patch
>
> Before you just go and hit "reply", please:
>    a) Consider who else should be cc'ed
>    b) Prefer to cc a suitable mailing list as well
>    c) Ideally: find the original patch on the mailing list and do a
>       reply-to-all to that, adding suitable additional cc's
>
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
>
> See http://userweb.kernel.org/~akpm/stuff/added-to-mm.txt to find
> out what to do about this
>
> The current -mm tree may be found at http://userweb.kernel.org/~akpm/mmotm/
>
> ------------------------------------------------------
> Subject: fs: reiser4, add parenths around !X & Y
> From: Jiri Slaby <jirislaby@gmail.com>
>
> Change !X & Y to !(X & Y) to avoid compiler confusion and fix a bug.
>
> Signed-off-by: Jiri Slaby <jirislaby@gmail.com>
> Cc: Edward Shishkin <edward.shishkin@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  fs/reiser4/carry_ops.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff -puN fs/reiser4/carry_ops.c~fs-reiser4-add-parenths-around-x-y fs/reiser4/carry_ops.c
> --- a/fs/reiser4/carry_ops.c~fs-reiser4-add-parenths-around-x-y
> +++ a/fs/reiser4/carry_ops.c
> @@ -79,7 +79,7 @@ static carry_node *find_left_neighbor(ca
>  	left->free = 1;
>  
>  	flags = GN_TRY_LOCK;
> -	if (!op->u.insert.flags & COPI_LOAD_LEFT)
> +	if (!(op->u.insert.flags & COPI_LOAD_LEFT))
>  		flags |= GN_NO_ALLOC;
>  
>  	/* then, feeling lucky, peek left neighbor in the cache. */
> @@ -203,7 +203,7 @@ static carry_node *find_right_neighbor(c
>  	read_unlock_tree(tree);
>  
>  	flags = GN_CAN_USE_UPPER_LEVELS;
> -	if (!op->u.insert.flags & COPI_LOAD_RIGHT)
> +	if (!(op->u.insert.flags & COPI_LOAD_RIGHT))
>  		flags = GN_NO_ALLOC;
>  
>  	/* then, try to lock right neighbor */
> _
>
> Patches currently in -mm which might be from jirislaby@gmail.com are
>
> linux-next.patch
> toshiba_acpi-return-on-a-fail-path.patch
> mtd-sst25l-fix-lock-imbalance.patch
> isdn-hisax-fix-lock-imbalance.patch
> icom-converting-space-to-tabs.patch
> cyclades-read-buffer-overflow.patch
> serial167-fix-read-buffer-overflow.patch
> usb-make-usb_buffer_map_sg-consistent-with-doc.patch
> char-riscom8-fix-shutdown-declaration.patch
> kcore-use-registerd-physmem-information-define-node__pfn-for-non-numa-builds.patch
> kcore-use-registerd-physmem-information-fix2.patch
> video-console-use-div_round_up.patch
> memory-controller-soft-limit-organize-cgroups-v9-fix.patch
> cyclades-allow-overriding-isa-defaults-also-when-the-driver-is-built-in.patch
> drivers-char-rio-rioctrlc-off-by-one-error-in-rioctrlc.patch
> reiser4.patch
> fs-reiser4-add-parenths-around-x-y.patch
>
>
>   

