From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs set_page_dirty vs truncate race?
Date: Tue, 10 Oct 2006 18:29:27 +0400
Message-ID: <200610101829.28052.vs@namesys.com>
References: <20061010074426.GD14557@wotan.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20061010074426.GD14557@wotan.suse.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <npiggin@suse.de>
Cc: reiserfs-list@namesys.com

Hello

On Tuesday 10 October 2006 11:44, Nick Piggin wrote:
> Hi,
> 
> I wonder if resierfs needs to be careful about truncated pages, 

I think it is assumed that __set_page_dirty_nobuffers and __set_page_dirty_buffers care about truncated pages.

> or does 
> your .invalidatepage provide synchronisation against set_page_dirty somehow?
> --
> Index: linux-2.6/fs/reiserfs/inode.c
> ===================================================================
> --- linux-2.6.orig/fs/reiserfs/inode.c
> +++ linux-2.6/fs/reiserfs/inode.c
> @@ -2840,10 +2840,14 @@ static void reiserfs_invalidatepage(stru
>  
>  static int reiserfs_set_page_dirty(struct page *page)
>  {
> -	struct inode *inode = page->mapping->host;
> -	if (reiserfs_file_data_log(inode)) {
> -		SetPageChecked(page);
> -		return __set_page_dirty_nobuffers(page);
> +	struct address_space *mapping = page->mapping;
> +	struct inode *inode;
> +	if (mapping) {
> +		inode = mapping->host;
> +		if (reiserfs_file_data_log(inode)) {
> +			SetPageChecked(page);
> +			return __set_page_dirty_nobuffers(page);
> +		}
>  	}
>  	return __set_page_dirty_buffers(page);
>  }
> 
> 
> 
