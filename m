From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] reiserfs: Check the return value from __getblk()
Date: Tue, 4 Jul 2023 19:49:24 +0100
Message-ID: <ZKRptMjtL6X74X1B@casper.infradead.org>
References: <ZJ32+b+3O8Z6cuRo@casper.infradead.org>
 <20230630-kerbholz-koiteich-a7395bc04eae@brauner>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ohNOzyes+e4OostGrU+ZixNYfYaBWOr0ibzYC94ovbM=; b=lKjbGfDsnq2+0JpIMZjxf3skmE
        v5azy4pkcGGtliPL4/7syjd4S+tA6eoy0UIS4WLE7imoaRj6Rcij0mNrFYiiQkQROubarPZ85dBZb
        eY5soakeayn1oOFXrIFVWX4rEt2nfAKYs4lPHO+/RiN1dkWsKk/DMxiJGoeDoCq6kXIxRTUssz267
        hVoRLGi6BcWEKXY+UJ1VOQuFR9impFPD2orAyo/LtQhguNlnUQD0sODBk42HLIGK0g3bUw7ZMJH2C
        tRdOxIbKCGmzRha/mohw2QKW++5YSF1qHPAGS+xGbvy8MI683zjU2PisPiniAyz58sPv+qr3Wv3Dw
        izD93Bjg==;
Content-Disposition: inline
In-Reply-To: <20230630-kerbholz-koiteich-a7395bc04eae@brauner>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <brauner@kernel.org>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, linux-fsdevel@vger.kernel.org, butt3rflyh4ck <butterflyhuangxx@gmail.com>

On Fri, Jun 30, 2023 at 11:03:05AM +0200, Christian Brauner wrote:
> From: Matthew Wilcox <willy@infradead.org>
> 
> On Thu, 29 Jun 2023 23:26:17 +0200, Matthew Wilcox wrote:
> > __getblk() can return a NULL pointer if we run out of memory or if
> > we try to access beyond the end of the device; check it and handle it
> > appropriately.
> > 
> > [...]
> 
> Willy's original commit with message id
> <20230605142335.2883264-1-willy@infradead.org> didn't show up on lore.
> Might be because reiserfs-devel isn't a list tracked by lore; not sure.
> So I grabbed this from somewhere else.
> 
> In any case, I picked this up now.
> 
> ---
> 
> Applied to the vfs.misc branch of the vfs/vfs.git tree.
> Patches in the vfs.misc branch should appear in linux-next soon.
> 
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
> 
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.

Acked-by: Edward Shishkin <edward.shishkin@gmail.com>

was added in a response to the original, FYI
