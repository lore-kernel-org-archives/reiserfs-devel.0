From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 27/29] reiserfs: Convert to bdev_open_by_dev/path()
Date: Fri, 25 Aug 2023 14:35:54 +0200
Message-ID: <20230825-umjubelt-denkmal-692a41dcd900@brauner>
References: <20230818123232.2269-1-jack@suse.cz>
 <20230823104857.11437-27-jack@suse.cz>
Mime-Version: 1.0
Return-path: <linux-block-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692966958;
        bh=WZhoQI4SQ1PkbMB0aQ3u5RKKO+ivrApvlEQUhSgI2bU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fb4oA3BIKH0w6JdT8obpdFYBfAKO79ukbitfPKI8nSPsDvooi3n+NuOedn+xWwZxO
         ZLxAv88KK12XJeUexGBxB5y5/9YxYdrtV2Kv9Vc0Ybs+W4AAGuxtMJOy+r0vb9dDsu
         lPcZzngxZtx2dffbxrVHbbLJSv4Ux+nNpZg6GViwVJxGGHV7yneA08Uyxkl4pOEPYt
         45fOoqFJRnaE35hC5muBwEjbJwEy0UVeDD/5fvAXewJWdmaKA4Ywa8nnTKSLk52A1i
         vtLymw/+8tV9nfn1STihYzk1GSY6DNbGKFBYvpa//x/za9HHgOCkdY283bCYa+mPwY
         YgB6SNPb/S+gQ==
Content-Disposition: inline
In-Reply-To: <20230823104857.11437-27-jack@suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, reiserfs-devel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Wed, Aug 23, 2023 at 12:48:38PM +0200, Jan Kara wrote:
> Convert reiserfs to use bdev_open_by_dev/path() and pass the handle
> around.
> 
> CC: reiserfs-devel@vger.kernel.org
> Acked-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
