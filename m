From: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] reiserfs: add check for invalid 1st journal block
Date: Mon, 17 May 2021 14:37:52 +0300
Message-ID: <20210517143752.2f43af03@gmail.com>
References: <20210514212335.9709-1-paskripkin@gmail.com>
        <20210517101523.GB31755@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Lk6lRGGKDk8jVlYh4Ia7bVfcb10zvdejQe0GtRSIxQ=;
        b=E5we09gZggsfQun+UMNQ3JGiCMz0ShV/NUTjPlxP05wZxJxBRvOu8YbZkuZMgzBG1M
         JtAfhLMGolE9cUKfXW+p03gtLyoPGl/GRGgix38tZcAAPY7KApBuJxhctqh/hNPVbTIn
         ysIchEluEPlC63O8qrSyhAjWEQBTyx2g0hO5e/QfsSBdlHJSLzyk5jioJFpOmB/9fFpH
         3q14rG7udOLMDsYKt20gr48gqui1i0qrP4ndzJBhYhlF+cSlXWeECZpecfLMuqk40eRU
         iLcpBo0aojtYKXN4B99yEUzE6VZ8ddSzvZ+YPwwCV46/e4pL9eDlEHIZomJ1cwdflT80
         Q0Aw==
In-Reply-To: <20210517101523.GB31755@quack2.suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: tiantao6@hisilicon.com, rdunlap@infradead.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com

On Mon, 17 May 2021 12:15:23 +0200
Jan Kara <jack@suse.cz> wrote:
> On Sat 15-05-21 00:23:35, Pavel Skripkin wrote:
> > syzbot reported divide error in reiserfs.
> > The problem was in incorrect journal 1st block.
> > 
> > Syzbot's reproducer manualy generated wrong superblock
> > with incorrect 1st block. In journal_init() wasn't
> > any checks about this particular case.
> > 
> > For example, if 1st journal block is before superblock
> > 1st block, it can cause zeroing important superblock members
> > in do_journal_end().
> > 
> > Reported-and-tested-by:
> > syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> Thanks for the patch. One comment below:
> 
> > diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> > index 9edc8e2b154e..d58f24a08385 100644
> > --- a/fs/reiserfs/journal.c
> > +++ b/fs/reiserfs/journal.c
> > @@ -2758,6 +2758,19 @@ int journal_init(struct super_block *sb,
> > const char *j_dev_name, goto free_and_return;
> >  	}
> >  
> > +	/*
> > +	 * Sanity check to see is journal first block correct.
> > +	 * If journal first block is invalid it can cause
> > +	 * zeroing important superblock members.
> > +	 */
> > +	if (SB_ONDISK_JOURNAL_1st_BLOCK(sb) <
> > SB_JOURNAL_1st_RESERVED_BLOCK(sb)) {
> 
> I guess this check is valid only if !SB_ONDISK_JOURNAL_DEVICE(sb),
> isn't it? Otherwise you are comparing block numbers from two
> different devices...
> 

Hi!

Indeed. Thanks for pointing it out! I'll send v2 soon

> 									Honza
> 
> > +		reiserfs_warning(sb, "journal-1393",
> > +			"journal 1st super block is invalid: 1st
> > reserved block %d, but actual 1st block is %d",
> > +			SB_JOURNAL_1st_RESERVED_BLOCK(sb),
> > +			SB_ONDISK_JOURNAL_1st_BLOCK(sb));
> > +		goto free_and_return;
> > +	}
> > +
> >  	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
> >  		reiserfs_warning(sb, "sh-462",
> >  				 "unable to initialize journal
> > device"); -- 
> > 2.31.1
> > 




With regards,
Pavel Skripkin
