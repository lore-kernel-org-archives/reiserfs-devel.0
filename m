From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: Deprecate reiserfs
Date: Fri, 25 Feb 2022 13:52:09 +0100
Message-ID: <20220225125209.6dv6osndesrc346z@quack3.lan>
References: <20220223142653.22388-1-jack@suse.cz>
 <20220223213127.GI3061737@dread.disaster.area>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645793530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8gvgCDrrNRjiQXWEFzylOMvqJ+2glDCwy3Eb66PaWnc=;
        b=D8yK2jblPQaKBxqfQY2GzHNeeG+aXD+J9UxugZZdx62VLwTAxCTtN1efOenuKsKby2x6Ru
        Gf2ZJ9y6eTPYdL+tGmLgABZxTwUQA4lek2CI++K6sHJjordbCvPy38ZLRvrtZRaRVpZECF
        iXhWrLpoJz5V7Ru66IQU6MjXt/0DY5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645793530;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8gvgCDrrNRjiQXWEFzylOMvqJ+2glDCwy3Eb66PaWnc=;
        b=WBw97hzHHPApTyqMTHwVeLODsAyyu5G/F87G8Zx4wEntHiSN8AICJ8UidR8Hds8lsA9+lv
        kRLA0qSFFiLr3tCA==
Content-Disposition: inline
In-Reply-To: <20220223213127.GI3061737@dread.disaster.area>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Edward Shishkin <edward.shishkin@gmail.com>

On Thu 24-02-22 08:31:27, Dave Chinner wrote:
> On Wed, Feb 23, 2022 at 03:26:53PM +0100, Jan Kara wrote:
> > Reiserfs is relatively old filesystem and its development has ceased
> > quite some years ago. Linux distributions moved away from it towards
> > other filesystems such as btrfs, xfs, or ext4. To reduce maintenance
> > burden on cross filesystem changes (such as new mount API, iomap, folios
> > ...) let's add a deprecation notice when the filesystem is mounted and
> > schedule its removal to 2024.
> 
> Two years might be considered "short notice" for a filesystem, but I
> guess that people running it because it is stable will most likely
> also linger on stable kernels where it will live "maintained" for
> many years after it has been removed from the upstream code base.

Yeah, I guess that is the case usually. Anyway based on feedback from one
reiserfs user I've pushed the date to 2025.

> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  fs/reiserfs/Kconfig | 10 +++++++---
> >  fs/reiserfs/super.c |  2 ++
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> > 
> > Here's my suggestion for deprecating reiserfs. If nobody has reasons against
> > this, I'll send the patch to Linus during the next merge window.
> 
> Is there a deprecation/removal schedule somewhere that documents
> stuff like this? We documented in the XFS section of the kernel
> admin guide (where we also document mount option and
> sysctl deprecation and removal schedules), but I don't think
> anything like that exists for reiserfs or for filesystems in
> general.

The only document I'm aware of is Documentation/process/deprecated.rst
for which filesystem deprecation seems inappropriate. So no I don't think
we have such general document for filesystems.

> Other than that, the patch looks good.

Thanks for review!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
