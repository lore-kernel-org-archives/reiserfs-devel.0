From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Fri, 9 Oct 2015 15:27:29 +0200
Message-ID: <5617C0C1.6060806@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=Mjwo9LoMv4e3yhqgiH24N7TRM3WvDkOUIyZEuAkaaEM=;
        b=DM1QuQOCpRtISlAGfxcUP1jw2N+ORm9JgqElPWJ5VUFcXfgLg0t0HVuBjzBC1fGTKX
         GIN2LCRE2algbbyOaR3FP/lWXcPaGgn+/AYlvTMaQKEbgkVhf6bdFngd0iQbOMbgETxr
         0KR2OUVGAkJDdQpRxhbVuEE6jmWvU01oEAao9OAaSkEKG/b0iYta7xk2fFa5DERp8f/y
         ZmW1ZtlVvQg4hLoEg1Wlo4vg2l95GiHYAJfERP3QDlDsZ6V13GKXs+ie9qJAtfXm6E40
         XQ3kEpqKgkQrsgNZykfF7qWQ27YIllFCOL7Gvkix8rBtn7+A7xftUvACZY4ds537c9wN
         ERWw==
In-Reply-To: <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: Oleg Drokin <green@linuxhacker.ru>

Hi Ivan,

On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
> Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sourceforge.net/msg02745.html

Do you have a stack trace for reiser4?
How to reproduce it?

>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>
> Lustre seemed to encounter the same oops and fixed it in a different way, removing
> set_page_writeback() altogether:
> https://lkml.org/lkml/2015/7/30/806
>
> We cannot just remove the call to set_page_writeback() at least because later
> we wait on PG_Writeback flag of that page (in jwait_io())... What is meant by
> "synchronous write" in that Lustre patch? Is our write "synchronous" in the
> same sense?


Nop.
This is a generic function, it doesn't differentiate the writes.

Thanks,
Edward.

>   I don't know VFS well. Cc'ing Oleg.
>
>   fs/reiser4/wander.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
> index ce20d50..0e2c105 100644
> --- a/fs/reiser4/wander.c
> +++ b/fs/reiser4/wander.c
> @@ -782,7 +782,9 @@ static int write_jnodes_to_disk_extent(
>   					node_plugin_by_node(JZNODE(cur))->csum(JZNODE(cur), 0);
>   				zrelse(JZNODE(cur));
>   			}
> +
>   			ClearPageError(pg);
> +			set_page_dirty_notag(pg);
>   			set_page_writeback(pg);
>   
>   			if (get_current_context()->entd) {

