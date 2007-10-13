From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH] Reiser4: Drop 'size' argument from bio_endio and bi_end_io
Date: Sat, 13 Oct 2007 12:10:25 +0200
Message-ID: <20071013101025.GE969@kernel.dk>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org> <470FDB41.2000102@free.fr> <20071012140023.30e5b30e.akpm@linux-foundation.org> <47109016.8000403@free.fr>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47109016.8000403@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.de>, Edward Shishkin <edward@namesys.com>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Sat, Oct 13 2007, Laurent Riffard wrote:
> Reiser4: Drop 'size' argument from bio_endio and bi_end_io
> 
> This patch pushes into Reiser4 the changes introduced by 
> commit 6712ecf8f648118c3363c142196418f89a510b90:
> 
> 	As bi_end_io is only called once when the request is complete,
> 	the 'size' argument is now redundant.  Remove it.
> 
> 	Now there is no need for bio_endio to subtract the size completed
> 	from bi_size.  So don't do that either.
> 
> 	While we are at it, change bi_end_io to return void.

Looks correct to me.

Acked-by: Jens Axboe <jens.axboe@oracle.com>

-- 
Jens Axboe

