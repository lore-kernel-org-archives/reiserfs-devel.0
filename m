From: "NeilBrown" <neilb@suse.de>
Subject: Re: [PATCH] reiserfs: don't use congestion_wait()
Date: Fri, 10 Dec 2021 15:27:44 +1100
Message-ID: <163911046430.9928.8662346319653420721@noble.neil.brown.name>
References: <163712368225.13692.3419908086400748349@noble.neil.brown.name>,
 <20211118104544.GB13047@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639110472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=exDGmvpV/qIsCI3WVAE1kexMAyP+p/jWNiVK7uoUKi4=;
        b=Et5rxi5Hc4qOuTnb7bY+piL9p7ttYB/4OcFhEI0/tZ7BzHujYrmaplQ3xfanrPh3PPuO0c
        sgZ6afkX3Y1HKMdeRTccIO3biRgYJnB9S0TbyLgo39TapLvyvdeezeM7z4XfgRH+3bmL+m
        oUSI7BnM6yCxF1IIYnT9x8VlyRIkETU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639110472;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=exDGmvpV/qIsCI3WVAE1kexMAyP+p/jWNiVK7uoUKi4=;
        b=gcR88hULbP9FQI8fBCVOmqzGkmiIgyoqYAq0bC17dds+tpSAPT5RL+tjmzyngLWyedehTK
        JVdE78lCEeweyDDg==
In-reply-to: <20211118104544.GB13047@quack2.suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 18 Nov 2021, Jan Kara wrote:
> On Wed 17-11-21 15:34:42, NeilBrown wrote:
> > 
> > Block devices do not, in general, report congestion any more, so this
> > congestion_wait() is effectively just a sleep.
> > 
> > It isn't entirely clear what is being waited for, but as we only wait
> > when j_async_throttle is elevated, it seems reasonable to stop waiting
> > when j_async_throttle becomes zero - or after the same timeout.
> > 
> > So change to use wait_event_event_timeout() for waiting, and
> > wake_up_var() to signal an end to waiting.
> > 
> > Signed-off-by: NeilBrown <neilb@suse.de>
> > ---
> > 
> > I have no idea who might take this.... Jens and Jan have both landed
> > reiserfs patches recently...
> 
> Yeah, I guess I can take this one. Honestly the whole code around
> j_async_throttle looks a bit suspicious but your patch does not make it
> worse so it looks safe to me :).

Hi,
 I don't see this in linux-next.  Should I ??

Thanks,
NeilBrown
