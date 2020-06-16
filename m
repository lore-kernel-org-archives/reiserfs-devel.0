From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH][next] reiserfs: bitmap: Assign array_size() to a variable
Date: Tue, 16 Jun 2020 11:39:02 -0700
Message-ID: <202006161139.1F50D42FB@keescook>
References: <20200616184118.GA1917@embeddedor>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8RJK2syfb1UPJfcE04G7USvWkMzpU9ggu2GVyOrhih8=;
        b=mzlz8vzfLovPNfG+Ed5YF/HIguRWsjR3QNuf01Zt+vV/LN6FrwR9kRkYU4zOF2pH/K
         zVimmlH2LI3ykQvPr7+k3xzXnVNo/jxThzz7hStN49Y8UFXZ5EW7t76l3wmrQYe24sXF
         TGgQ8LRyLduDA4Jt1oAm5/gpCPEJ9z0DhTS+Q=
Content-Disposition: inline
In-Reply-To: <20200616184118.GA1917@embeddedor>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

On Tue, Jun 16, 2020 at 01:41:18PM -0500, Gustavo A. R. Silva wrote:
> Assign array_size() to variable _size_ and use it in both vmalloc()
> and memset(). These sorts of multiplication factors need to be wrapped
> in array_size().
> 
> This issue was found with the help of Coccinelle and, audited and fixed
> manually.
> 
> Addresses-KSPP-ID: https://github.com/KSPP/linux/issues/83
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
