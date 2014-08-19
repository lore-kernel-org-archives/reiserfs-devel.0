From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations
 has been left out?
Date: Wed, 20 Aug 2014 01:39:42 +0200
Message-ID: <53F3E03E.7030805@gmail.com>
References: <10671542.MCAVDCHSND@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=bLkauHz2moY57z8f1345bznv5WKhEvuMvkBsESJHfnM=;
        b=YPn4sHeo5waHoNrdjLil+f7cUEs5ZtG4nY52/TEZk5qJ6pMb3afFqitx7EV8h+6wkr
         1pwUmpdME0cwst0LzYXazcVJfNUpZamRIpt3G7LfrBx7gLlY06d/kpbpRuVhdMikjMsR
         teQhQ1pqVJJUuQz4tD6s2WdZgJgcb9+i3ll5MniSZL91/nxggtlcIT2FYLHsj1m6Ufqu
         hi0AnXcFA0ZTSgFcZinT9w5mKcfYn0D3zK6XFmOy3VVx9WzIL6vcWZC9OLzwSbGwcoFH
         VRfPUyz3TfuUqXel9+NGv8F9jB8e7AjuM28Uq/EWr7HodgjB1ex1ZP3gLZEpWza08wO2
         kZDw==
In-Reply-To: <10671542.MCAVDCHSND@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 08/20/2014 12:32 AM, Ivan Shapovalov wrote:
>  From `git log` I've seen that VFS people intend to replace ->aio_read() and
> ->aio_write() of struct file_operations with new methods ->read_iter() and
> ->write_iter().
>
> (Along with a couple of related new helpers, differing from previous just in
> calling _iter methods instead of aio_ ones.)
>
>  From other filesystems it seems that these are simple drop-in replacements
> (however, well, I have zero familiarity with VFS). So here is a question:
> is there any intentional reason that generic_file_aio_write() is not used
> in reiser4?


Currently reiser4 is a set of two filesystems which differ in methods
of handling regular files. For VFS we provide "dispatchers", which pass
management to appropriate plugin (UNIX_FILE or CRYPTCOMPRESS).

UNIX_FILE plugin doesn't use generic write for performance reasons
(I'll try to find the respective mailing thread). CRYPTCOMPRESS doesn't
use it for compatibility reasons: I don't know how how to rewrite it
gracefully using the generic write method.

Edward.


>
> What follows is a simple patch that I've currently applied to my own kernel
> (seems to be the only significant vfs change affecting filesystems), however,
> I fear that these code-paths are not generally used, so my "works for me"
> isn't really representative. Could you please clarify the situation here?
>
>  From 81172835255a01718c2c256942d5887825a0cd7a Mon Sep 17 00:00:00 2001
> From: Ivan Shapovalov <intelfx100@gmail.com>
> Date: Tue, 19 Aug 2014 14:33:35 +0400
> Subject: [PATCH] Adjust reiser4 to 3.16: ->{read,write}_iter of struct
>   file_operations.
>
> 1. ->aio_{read,write} of struct file_operations are being replaced with ->{read,write}_iter.
> 2. do_sync_{read,write} are being replaced with new_sync_{read,write}.
> 3. generic_file_splice_write is being replaced with iter_file_splice_write.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/plugin/file/cryptcompress.c | 2 +-
>   fs/reiser4/plugin/file/file.c          | 2 +-
>   fs/reiser4/plugin/object.c             | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/reiser4/plugin/file/cryptcompress.c b/fs/reiser4/plugin/file/cryptcompress.c
> index 8af388d..b0109fb 100644
> --- a/fs/reiser4/plugin/file/cryptcompress.c
> +++ b/fs/reiser4/plugin/file/cryptcompress.c
> @@ -2964,7 +2964,7 @@ ssize_t read_cryptcompress(struct file * file, char __user *buf, size_t size,
>   		reiser4_exit_context(ctx);
>   		return result;
>   	}
> -	result = do_sync_read(file, buf, size, off);
> +	result = new_sync_read(file, buf, size, off);
>   
>   	context_set_commit_async(ctx);
>   	reiser4_exit_context(ctx);
> diff --git a/fs/reiser4/plugin/file/file.c b/fs/reiser4/plugin/file/file.c
> index 94029cd..e65c48d 100644
> --- a/fs/reiser4/plugin/file/file.c
> +++ b/fs/reiser4/plugin/file/file.c
> @@ -1752,7 +1752,7 @@ ssize_t read_unix_file(struct file *file, char __user *buf,
>   	switch (uf_info->container) {
>   	case UF_CONTAINER_EXTENTS:
>   		if (!reiser4_inode_get_flag(inode, REISER4_PART_MIXED)) {
> -			result = do_sync_read(file, buf, read_amount, off);
> +			result = new_sync_read(file, buf, read_amount, off);
>   			break;
>   		}
>   	case UF_CONTAINER_TAILS:
> diff --git a/fs/reiser4/plugin/object.c b/fs/reiser4/plugin/object.c
> index 553f1e2..e431e1f 100644
> --- a/fs/reiser4/plugin/object.c
> +++ b/fs/reiser4/plugin/object.c
> @@ -188,7 +188,7 @@ static struct file_operations regular_file_f_ops = {
>   	.llseek = generic_file_llseek,
>   	.read = reiser4_read_dispatch,
>   	.write = reiser4_write_dispatch,
> -	.aio_read = generic_file_aio_read,
> +	.read_iter = generic_file_read_iter,
>   	.unlocked_ioctl = reiser4_ioctl_dispatch,
>   #ifdef CONFIG_COMPAT
>   	.compat_ioctl = reiser4_ioctl_dispatch,
> @@ -198,7 +198,7 @@ static struct file_operations regular_file_f_ops = {
>   	.release = reiser4_release_dispatch,
>   	.fsync = reiser4_sync_file_common,
>   	.splice_read = generic_file_splice_read,
> -	.splice_write = generic_file_splice_write
> +	.splice_write = iter_file_splice_write
>   };
>   static struct address_space_operations regular_file_a_ops = {
>   	.writepage = reiser4_writepage,

