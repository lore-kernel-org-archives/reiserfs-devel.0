From: "NeilBrown" <neilb@suse.de>
Subject: Re: [PATCH] reiserfs: don't use congestion_wait()
Date: Tue, 14 Dec 2021 08:56:09 +1100
Message-ID: <163943256925.22433.4500548806192726621@noble.neil.brown.name>
References: <163712368225.13692.3419908086400748349@noble.neil.brown.name>,
 <20211118104544.GB13047@quack2.suse.cz>,
 <163911046430.9928.8662346319653420721@noble.neil.brown.name>,
 <20211213135930.GC14044@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639432575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YXmhF7TLPWUnevm8cJSMJUG6ZWkHqwl8bh4f6iLzhao=;
        b=1Pwe9liwMcUWdQdZ0TImAPng+1+V/PkFIOcEeVjyb5CDdKSNm9thkcAvsJ0oDVnpwtiBEk
        lMdfd7/+mcIHVaLI57cSGYQ26hB2sGqLYJ3CYcwg+k6+8kNFYXxE4LKnxZiU09F0Ucad0H
        124lBSmOUwDNGzl0KNomnugKlx/tTGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639432575;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YXmhF7TLPWUnevm8cJSMJUG6ZWkHqwl8bh4f6iLzhao=;
        b=R6FyI4eWkmJxzyLs618BPssilmj+KnTeC4Z/jaKTuyothPmW1dvLUe0mOR+vdXMWny4ajt
        TfZ7ckorEzA72GBA==
In-reply-to: <20211213135930.GC14044@quack2.suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 14 Dec 2021, Jan Kara wrote:
> On Fri 10-12-21 15:27:44, NeilBrown wrote:
> > On Thu, 18 Nov 2021, Jan Kara wrote:
> > > On Wed 17-11-21 15:34:42, NeilBrown wrote:
> > > > 
> > > > Block devices do not, in general, report congestion any more, so this
> > > > congestion_wait() is effectively just a sleep.
> > > > 
> > > > It isn't entirely clear what is being waited for, but as we only wait
> > > > when j_async_throttle is elevated, it seems reasonable to stop waiting
> > > > when j_async_throttle becomes zero - or after the same timeout.
> > > > 
> > > > So change to use wait_event_event_timeout() for waiting, and
> > > > wake_up_var() to signal an end to waiting.
> > > > 
> > > > Signed-off-by: NeilBrown <neilb@suse.de>
> > > > ---
> > > > 
> > > > I have no idea who might take this.... Jens and Jan have both landed
> > > > reiserfs patches recently...
> > > 
> > > Yeah, I guess I can take this one. Honestly the whole code around
> > > j_async_throttle looks a bit suspicious but your patch does not make it
> > > worse so it looks safe to me :).
> > 
> > Hi,
> >  I don't see this in linux-next.  Should I ??
> 
> No, my fault. I'm sorry. I didn't push out the resulting branch. Fixed now.
> 

Yes-  I see it in your for-next branch now.  Thanks a lot!

NeilBrown
