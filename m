From: Edward Shishkin <edward@namesys.com>
Subject: Re: 2.6.11-rc5-mm1
Date: Tue, 01 Mar 2005 18:06:07 +0300
Message-ID: <422484DF.30504@namesys.com>
References: <20050301012741.1d791cd2.akpm@osdl.org>	<871xazxyke.fsf@barad-dur.crans.org> <87wtsrwjms.fsf@barad-dur.crans.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87wtsrwjms.fsf@barad-dur.crans.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Mathieu Segaud <Mathieu.Segaud@crans.org>
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Mathieu Segaud wrote:

>Mathieu Segaud <Mathieu.Segaud@crans.org> disait dernièrement que :
>
>Hum, one hunk didn't make it.
>The complete patch is attached
>
>  
>
>>fs/reiser4/plugin/item/ctail.c: In function `check_ctail':
>>fs/reiser4/plugin/item/ctail.c:250: attention : l'adresse de Â« ctail_ok Â» sera toujours Ã©valuÃ©e comme Ã©tant Â« true Â»
>>fs/reiser4/plugin/item/ctail.c: In function `convert_ctail':
>>fs/reiser4/plugin/item/ctail.c:1669: attention : l'adresse de Â« coord_is_unprepped_ctail Â» sera toujours Ã©valuÃ©e comme Ã©tant Â« true Â»
>>
>>    
>>
>
>Signed-off-by: Mathieu Segaud <mathieu.segaud@crans.org>
>
>  
>
>  
>

Thanks for  catching this.
Edward.

>------------------------------------------------------------------------
>
>--- fs/reiser4/plugin/item/ctail.c	2005-03-01 14:57:52.756014040 +0100
>+++ fs/reiser4/plugin/item/ctail.c.new	2005-03-01 14:57:19.791025480 +0100
>@@ -247,7 +247,7 @@
> reiser4_internal int
> check_ctail (const coord_t * coord, const char **error)
> {
>-	if (!ctail_ok) {
>+	if (!ctail_ok(coord)) {
> 		if (error)
> 			*error = "bad cluster shift in ctail";
> 		return 1;
>@@ -1666,7 +1666,7 @@
> 		detach_convert_idata(pos->sq);
> 		break;
> 	case CRC_OVERWRITE_ITEM:
>-		if (coord_is_unprepped_ctail) {
>+		if (coord_is_unprepped_ctail(&pos->coord)) {
> 			/* convert unpprepped ctail to prepped one */
> 			int shift;
> 			shift = inode_cluster_shift(item_convert_data(pos)->inode);
>
>
>
>
>  
>

