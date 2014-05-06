From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: remove an assertion "nikita-2577" which is no
 longer possible to check.
Date: Tue, 06 May 2014 09:22:07 +0200
Message-ID: <53688D9F.4090101@gmail.com>
References: <1399334388-9660-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=SpoDdpNXwp/WuhUA3aJ2oxE19CSnr5PowIeeg6av2kw=;
        b=Jg8cpFuOOA0CVtn9IlXRtXVYMNxl2+2xOzdQuR9bLSYxwLAc+2zW0TsMpY86wKN0gx
         ndrv3AhgQRDlGbFdSBd/UwiJgwUiHPyiG47TKHjmMEfxHkIY4KAFZ2cjWC2B4AMB28vn
         I4h+mh5EkKr/s7GphgJ84QP/7vNkhTGcWvZ5JXaF+81H6bcpbVxRgCf/mVSKsBpHf2+u
         X/B7N6jZtlGuwS5zwjLS9xlGU3AZ2aTIR188DTtPALsIx8jnVb9NMxvHryM79z+nu/qk
         bA+fD1GlmtAIOeS99cnKNrCvmHMNI/Q9xd7wMjyZCbz8asG0RkUw6ABR78kxAmciv63R
         VcpA==
In-Reply-To: <1399334388-9660-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/06/2014 01:59 AM, Ivan Shapovalov wrote:
> Since 3.11, file->f_pos is not up-to-date during an iterate() in progress. This
> was true for readdir(), but is no longer so.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>
> Is this correct? I assume that adjust_dir_pos() is called simultaneously with
> iterate()... or not?

adjust_dir_pos() is a work around seekdir/telldir API, and has nothing
with iterate(), see the comment before  reiser4_iterate_common().
So, I think, it is incorrect, and dir->f_pos is perfectly valid.

>   If not, then passing 'dir->f_pos' to reiser4_get_dir_fpos()
> will suffice.
>
>   fs/reiser4/plugin/file_ops_readdir.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/fs/reiser4/plugin/file_ops_readdir.c b/fs/reiser4/plugin/file_ops_readdir.c
> index 0da5ac5..f53573c 100644
> --- a/fs/reiser4/plugin/file_ops_readdir.c
> +++ b/fs/reiser4/plugin/file_ops_readdir.c
> @@ -58,8 +58,6 @@ adjust_dir_pos(struct file *dir, struct readdir_pos *readdir_spot,
>   		/* logical number of directory entry readdir is "looking" at
>   		 * changes */
>   		readdir_spot->entry_no += adj;
> -		assert("nikita-2577",
> -		       ergo(dir != NULL, reiser4_get_dir_fpos(dir) + adj >= 0));
>   		if (de_id_cmp(&pos->dir_entry_key,
>   			      &mod_point->dir_entry_key) == EQUAL_TO) {
>   			assert("nikita-2575", mod_point->pos < pos->pos);

