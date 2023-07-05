From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] reiserfs: Check the return value from __getblk()
Date: Wed, 5 Jul 2023 09:08:55 +0200
Message-ID: <20230705-gecheckt-unzumutbar-4010ffac4ea7@brauner>
References: <ZJ32+b+3O8Z6cuRo@casper.infradead.org>
 <20230630-kerbholz-koiteich-a7395bc04eae@brauner>
 <ZKRptMjtL6X74X1B@casper.infradead.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688540939;
        bh=OzfmgDFtXJCKbJ5VtxUn1n2vz3F/TIx9jNO3WUb6xxI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JICvmyve75o3h7NDZxOYzIfAhgkRR9zSTOSPyfCq5AvB6CzfcoETKMvjHfmQRVLoB
         P6YuAW+Dqo1AotnqIZO7PKevdJHPSocc53AvfxMd7AaBlisZJa24KA7jcbUL2OyvPo
         dnc0Ho1eC/LrKWj7zgkTOVNKoZ+jGy2UVFgMJMKT1Z2dFfjNanO8FHagNUGgVGTNTp
         Kxlt+8dDf3ZYF2+GojSIlg5zbf/ykKL4OO9NMXl2fMGWW2PcOQNk31ntntp2GQH9Jl
         0D58njpBHN4A7fG1eSxGqF3KN2VMcDjoGMmgvOCjdhqP6NO+JlLHY3cNMvHLfXYftN
         4ZB/Z4AWN/qIQ==
Content-Disposition: inline
In-Reply-To: <ZKRptMjtL6X74X1B@casper.infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, linux-fsdevel@vger.kernel.org, butt3rflyh4ck <butterflyhuangxx@gmail.com>

On Tue, Jul 04, 2023 at 07:49:24PM +0100, Matthew Wilcox wrote:
> On Fri, Jun 30, 2023 at 11:03:05AM +0200, Christian Brauner wrote:
> > From: Matthew Wilcox <willy@infradead.org>
> > 
> > On Thu, 29 Jun 2023 23:26:17 +0200, Matthew Wilcox wrote:
> > > __getblk() can return a NULL pointer if we run out of memory or if
> > > we try to access beyond the end of the device; check it and handle it
> > > appropriately.
> > > 
> > > [...]
> > 
> > Willy's original commit with message id
> > <20230605142335.2883264-1-willy@infradead.org> didn't show up on lore.
> > Might be because reiserfs-devel isn't a list tracked by lore; not sure.
> > So I grabbed this from somewhere else.
> > 
> > In any case, I picked this up now.
> > 
> > ---
> > 
> > Applied to the vfs.misc branch of the vfs/vfs.git tree.
> > Patches in the vfs.misc branch should appear in linux-next soon.
> > 
> > Please report any outstanding bugs that were missed during review in a
> > new review to the original patch series allowing us to drop it.
> > 
> > It's encouraged to provide Acked-bys and Reviewed-bys even though the
> > patch has now been applied. If possible patch trailers will be updated.
> 
> Acked-by: Edward Shishkin <edward.shishkin@gmail.com>
> 
> was added in a response to the original, FYI

Thank you! I've updated the patch trailer accordingly.
