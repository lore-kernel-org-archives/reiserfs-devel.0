From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: don't use congestion_wait()
Date: Mon, 13 Dec 2021 14:59:30 +0100
Message-ID: <20211213135930.GC14044@quack2.suse.cz>
References: <163712368225.13692.3419908086400748349@noble.neil.brown.name>
 <20211118104544.GB13047@quack2.suse.cz>
 <163911046430.9928.8662346319653420721@noble.neil.brown.name>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1639403970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xv2KeMrWgel3brnTG+ZpO98Zs2+HVUao2xU3AH5qJ+g=;
        b=aFH8X9QFHN70y8Gqlzm/EG5anWQFaevDionJGqkVxi2HQpX9tuKh3zmBMSUUndoQF5iPTl
        homIS7SPQ40pYy9XXHwrKkMKe1Np4ONPymns3xA5dXTSp2g92rSf42wLVlwcRYKoabXN+H
        EmW4a5PX1ObGyE31Tw8gWPR5uAnLooA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1639403970;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xv2KeMrWgel3brnTG+ZpO98Zs2+HVUao2xU3AH5qJ+g=;
        b=6J4PecqkINo4w6VmRIzD+1vHKL6TeSGndXwaFvrjN5I8mCCtwJRA8JsgW2klQPubOV0Quf
        BXIc071GYCxXjMDA==
Content-Disposition: inline
In-Reply-To: <163911046430.9928.8662346319653420721@noble.neil.brown.name>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NeilBrown <neilb@suse.de>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri 10-12-21 15:27:44, NeilBrown wrote:
> On Thu, 18 Nov 2021, Jan Kara wrote:
> > On Wed 17-11-21 15:34:42, NeilBrown wrote:
> > > 
> > > Block devices do not, in general, report congestion any more, so this
> > > congestion_wait() is effectively just a sleep.
> > > 
> > > It isn't entirely clear what is being waited for, but as we only wait
> > > when j_async_throttle is elevated, it seems reasonable to stop waiting
> > > when j_async_throttle becomes zero - or after the same timeout.
> > > 
> > > So change to use wait_event_event_timeout() for waiting, and
> > > wake_up_var() to signal an end to waiting.
> > > 
> > > Signed-off-by: NeilBrown <neilb@suse.de>
> > > ---
> > > 
> > > I have no idea who might take this.... Jens and Jan have both landed
> > > reiserfs patches recently...
> > 
> > Yeah, I guess I can take this one. Honestly the whole code around
> > j_async_throttle looks a bit suspicious but your patch does not make it
> > worse so it looks safe to me :).
> 
> Hi,
>  I don't see this in linux-next.  Should I ??

No, my fault. I'm sorry. I didn't push out the resulting branch. Fixed now.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
