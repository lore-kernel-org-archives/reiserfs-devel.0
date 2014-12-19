From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 4/6] reiser4: discard: don't be overly smart when gluing
 extents in discard_sorted_merged_extents().
Date: Fri, 19 Dec 2014 21:24:04 +0100
Message-ID: <54948964.8040202@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com> <1418418632-18396-5-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=qXBBAUSPUFtdA3j5NgLUsCngQ8iBbCNNA/z2rQw1qN4=;
        b=lozCtP2+ZFsES/FbkWljmHBviCFJbUzFMRzrHHydUpGm3EqpfSEXDqV6CTrPvwYXCg
         yKzTHX7CrcNOlpU1jnwMTOtGvJPwU3EsdBt+oKmIesrp6ptDQ8kcpulgBXIZGcPg+PLD
         dUpL/ur5hpbb1pCoSFVpro93QhbJv2PgvIiJ/BZ/yk3ct77Ga9TFFS7Yd6hajQ5uCA/z
         j5FEIhc3R+wITVNXbqGtv14CntPNOyIUWMWmtCroUoFin4JKQ3pPunc+SaBFiJfBByoG
         f77BarUmcghzcSlMUrtq/MweORzbZIPtrcmYA5QcWbQPFFzcCVZThDOdXfoO7m4a8s5D
         wnHA==
In-Reply-To: <1418418632-18396-5-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Agreed.
This is absolutely not needed "if".

Thanks!
Edward.


On 12/12/2014 10:10 PM, Ivan Shapovalov wrote:
> @tailp, @alen and @end must be updated simultaneously because there are expressions
> involving combinations of these variables.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/discard.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
> index a8c5336..86ff6e4 100644
> --- a/fs/reiser4/discard.c
> +++ b/fs/reiser4/discard.c
> @@ -366,18 +366,10 @@ static int discard_sorted_merged_extents(struct list_head *head)
>   					/*
>   					 * jump to the glued extent
>   					 */
> -					if (end + tailp < next_start + next_len) {
> -						/*
> -						 * the glued extent doesn't
> -						 * fit into the tail padding,
> -						 * so update the last one
> -						 */
> -						tailp = extent_get_tailp(next_start + next_len,
> -									 d_off, d_uni);
> -						alen += (next_start + next_len - end);
> -					}
>   					pos = next;
> +					alen += (next_start + next_len - end);
>   					end = next_start + next_len;
> +					tailp = extent_get_tailp(end, d_off, d_uni);
>   					/*
>   					 * try to glue more extents
>   					 */

