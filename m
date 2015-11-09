From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 2/3] reiser4: call account_page_redirty() on re-dirtying
 pages before giving them to entd.
Date: Mon, 9 Nov 2015 12:50:42 +0100
Message-ID: <56408892.6000709@gmail.com>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
 <1445727740-12361-3-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=3wurvTUfgllUUSQblLCaMw7Q/XKs0ThLx3uphGKs850=;
        b=ICVE8bfAqCzrUMrpuHxcMI8XGqU11z/ZBDUd3jRVwKIHZedsjZqfD/X9KDEh0FofgH
         5I8RexdD7W7o1jcA1G6Pi3EKjPVm1Y2s7z/Ocv5Y4ZdiAPnfiX6enkIg+gDEob8iQA0D
         dZswxLZR6PktfTe6E/0miIsnlMOQawOzHEnTdAVmDO7Wco30AIq+E1iUS7d+vJ0K6StD
         oSH+oizZxPV3i2nPDCK0+ePIRO2NB487QJqjhTsJ4sJ5jSu4BwyHO6jf+jGWT8laHrU4
         CA/ep8sl7a3EXSR7nFjEy1Z5HUfCe9uxjMbghDaGwL0a8G6A1Gke27AVp2J05dredcwR
         v9Pw==
In-Reply-To: <1445727740-12361-3-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

OK.

On 10/25/2015 01:02 AM, Ivan Shapovalov wrote:
> I guess we want that to rollback effects of account_page_dirtied()
> in set_page_dirty_notag().
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/entd.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/fs/reiser4/entd.c b/fs/reiser4/entd.c
> index bff4bfa..c254e71 100644
> --- a/fs/reiser4/entd.c
> +++ b/fs/reiser4/entd.c
> @@ -303,6 +303,7 @@ int write_page_by_ent(struct page *page, struct writeback_control *wbc)
>   	 * write it - it will remain dirty
>   	 */
>   	set_page_dirty_notag(page);
> +	account_page_redirty(page);
>   
>   	/*
>   	 * pin inode in memory, unlock page, entd_flush will iput. We can not

