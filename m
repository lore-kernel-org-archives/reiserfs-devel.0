From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH][next] reiserfs: Replace one-element array with
 flexible-array member
Date: Wed, 21 Jun 2023 17:03:58 -0700
Message-ID: <202306211703.9AC418A@keescook>
References: <ZJN9Kqhcs0ZGET/8@work>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687392239; x=1689984239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq0dkv7azkvedb0KULWF4WuIbSO15dlwApz3MpULLXE=;
        b=AwtajXI8+J6DndfxRUIKzXCkBY8xGz60/k5sDcezJKwVGjGClzxX4hXpgteDe2dQ9h
         4d2HnnsDKY90T8y0a3ww96+rL99eVgWq1UXwqto72GaZgsChKyMxxDHywAY92C/ZdF6T
         X74yKEqM1f90KQ6KGhb8eT7QKMRkG+1RM2z/Y=
Content-Disposition: inline
In-Reply-To: <ZJN9Kqhcs0ZGET/8@work>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

On Wed, Jun 21, 2023 at 04:43:54PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element array with flexible-array
> member in direntry_uarea structure, and refactor the rest of the code,
> accordingly.
> 
> Worth mentioning is that before these changes, the original implementation
> was returning two-too many bytes in function direntry_create_vi():
> 
> fs/reiserfs/item_ops.c:464:     int size = sizeof(struct direntry_uarea);
> ...
> fs/reiserfs/item_ops.c-490-     size += (dir_u->entry_count * sizeof(short));
> ...
> fs/reiserfs/item_ops.c-517-     return size;
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/290
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
