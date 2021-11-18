From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: don't use congestion_wait()
Date: Thu, 18 Nov 2021 11:45:44 +0100
Message-ID: <20211118104544.GB13047@quack2.suse.cz>
References: <163712368225.13692.3419908086400748349@noble.neil.brown.name>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1637232348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7yxGpvysaQjXI6Ptt8Gp6dG+FEHHiyleCV3iHc2uni8=;
        b=REl+qZG7r3KzLa/AZSLfHfENXkNYaV/qQ4fksyh96zKlaCHrgiuJjbqZKrHfQ46FGDpqJl
        xqwjTkGLUXJbMddkAHUu6swtYDCT2umUF3gF7Aiu1dbwIfhsCj/LnNKU5ha2/x7iDNpUPa
        lIEg50spgwzgnnxYhDHDOdUNHeEaVEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1637232348;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7yxGpvysaQjXI6Ptt8Gp6dG+FEHHiyleCV3iHc2uni8=;
        b=96eMI/IgypBaORscUQ3ttn971Z59zrz2+l5ld/ajM+MPPl/5jQylJ4VRSYRlqb7jEsqFFk
        ZkyeVrhHFoDB5uAg==
Content-Disposition: inline
In-Reply-To: <163712368225.13692.3419908086400748349@noble.neil.brown.name>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NeilBrown <neilb@suse.de>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed 17-11-21 15:34:42, NeilBrown wrote:
> 
> Block devices do not, in general, report congestion any more, so this
> congestion_wait() is effectively just a sleep.
> 
> It isn't entirely clear what is being waited for, but as we only wait
> when j_async_throttle is elevated, it seems reasonable to stop waiting
> when j_async_throttle becomes zero - or after the same timeout.
> 
> So change to use wait_event_event_timeout() for waiting, and
> wake_up_var() to signal an end to waiting.
> 
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
> 
> I have no idea who might take this.... Jens and Jan have both landed
> reiserfs patches recently...

Yeah, I guess I can take this one. Honestly the whole code around
j_async_throttle looks a bit suspicious but your patch does not make it
worse so it looks safe to me :).


								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
