From: Nick Piggin <npiggin@suse.de>
Subject: Re: 2.6.21-rc7 new aops patchset
Date: Tue, 24 Apr 2007 02:42:02 +0200
Message-ID: <20070424004202.GB29950@wotan.suse.de>
References: <20070421143200.GA23326@wotan.suse.de> <E1HfxUR-0006Ta-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1HfxUR-0006Ta-00@dorka.pomaz.szeredi.hu>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, mark.fasheh@oracle.com, reiserfs-dev@namesys.com, reiserfs-list@namesys.com

On Mon, Apr 23, 2007 at 02:17:55PM +0200, Miklos Szeredi wrote:
> Nick,
> 
> Thanks for converting fuse, and testing.  Here's a minor update to
> fs-fuse-aops.patch.
> 
> Miklos
> 
> ----
> Convert fuse to new aops.
> 
> [mszeredi]
>  - don't send zero length write requests
>  - it is not legal for the filesystem to return with zero written bytes
> 
> Signed-off-by: Nick Piggin <npiggin@suse.de>
> Signed-off-by: Miklos Szeredi <mszeredi@suse.cz>

Thanks, applied.
