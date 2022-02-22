From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] reiserfs: get rid of AOP_FLAG_CONT_EXPAND flag
Date: Tue, 22 Feb 2022 13:38:19 +0000
Message-ID: <YhTnSwmHVRe5AzJQ@casper.infradead.org>
References: <fbc744c9-e22f-138c-2da3-f76c3edfcc3d@gmail.com>
 <20220220232219.1235-1-edward.shishkin@gmail.com>
 <20220222102727.2sqf4wfdtjaxrqat@quack3.lan>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xaR5BAb2iA8Q4IbzOaNaow/c/pauqA9sg81gbN/llx8=; b=oyYMROg7m2mOqCt2bM5HiEQqX0
        y18gWLnlDNIZ5IneEYSH8eVd0PLoookyCw/NGZJ7UqiOHVW90p4QyGVdadCDeDpwnG1KzmVbs21Cr
        u9jkfSQBaUfOUUzMhVSCSZ/e8HTK7/O6Bk/fVWnnO21HGl+c7nm7MjLQ9FlIw5tygrE9Iqtwzf/AX
        z99H267wLxeeHijwbGhCPjbsQKFC8eUI+igkP1tm4MMzKv0fHbE/NgGLUFErNYZ4887HDR9FuKmsw
        bmNifFUV2CYdHFlZSYZG5pEQ+2gC8UPycw3kBkUIBNHEXE3scDmPaIYNhiWH5PORVY9bT42gF1T7n
        VMS0iZuw==;
Content-Disposition: inline
In-Reply-To: <20220222102727.2sqf4wfdtjaxrqat@quack3.lan>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Tue, Feb 22, 2022 at 11:27:27AM +0100, Jan Kara wrote:
> On Mon 21-02-22 00:22:19, Edward Shishkin wrote:
> > Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
> > ---
> >  fs/reiserfs/inode.c | 16 +++++-----------
> >  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> Thanks! I have queued this patch into my tree.

I added the following commit message to it for my tree:

Author: Edward Shishkin <edward.shishkin@gmail.com>
Date:   Mon Feb 21 00:22:19 2022 +0100

    reiserfs: Stop using AOP_FLAG_CONT_EXPAND flag

    We can simplify write_begin() and write_end() by handling the
    cont_expand case in reiserfs_setattr().

    Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
    Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

I don't object if it goes via your tree; I doubt I'll get the AOP_FLAG
removal finished in time for the next merge window.
