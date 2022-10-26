From: "NeilBrown" <neilb@suse.de>
Subject: Re: [PATCH] reiserfs: journal: Increase jl pointer check
Date: Wed, 26 Oct 2022 14:05:11 +1100
Message-ID: <166675351102.12462.1842756348742191725@noble.neil.brown.name>
References: <166673341340.7585.173987927705263434@noble.neil.brown.name>,
 <20221026014727.3020-1-zeming@nfschina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666753516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wXuHRTM+3pPVGvFWj9th29d+zpf7pxkYh7JjYDkSJOo=;
        b=Jzaq5cEqGZ/pzne9N0Jeby4iWc1mLyw7ZtRwMtgFzmmhOVwrypMqgivbfFv4NPkIShkAcE
        922TPoIGUlfpUEO66NAmpKG/8dDIRu1CqOUc7vYjvXGdIGNuGYI0jpB1IIt+FNd21jX6yO
        PLn2Qc6+gmeFJpjw4sNcTxfwHGzDyXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666753516;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wXuHRTM+3pPVGvFWj9th29d+zpf7pxkYh7JjYDkSJOo=;
        b=8LdFFTmNZJVb9vXkdp10tkFKqJ7oupnEVbDmjHdXyCq0UPf1QZZD1G+0Ll+lvoMTE1KZga
        7h+5OlUvLGpCQ7Dg==
In-reply-to: <20221026014727.3020-1-zeming@nfschina.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Li zeming <zeming@nfschina.com>
Cc: bvanassche@acm.org, jlayton@kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, song@kernel.org, willy@infradead.org

On Wed, 26 Oct 2022, Li zeming wrote:
> I'm sorry, I think __GFP_NOFAIL should be like this:
> 
> The __GFP_NOFAIL flag will cause memory to be allocated an infinite
>  number of times until the allocation is successful, but it is best to
>  use it only for very necessary code, and try not to use it.

I agree with that.  But you didn't try not to use it - you left it there
in the code.
Had you removed the flag as well, then your patch would have made a bit
more sense.  However you would then need to explain why it is safe to
return NULL from alloc_journal_list().  Are you sure callers don't try
to dereference the pointer?

> 
> I'm not sure alloc_journal_list function is a very important function
>  here. If it is, this patch ignores it and does not consider it anymore
>  __GFP_NOFAIL allocatiIon problem.
> 
> 

You are correct that the function isn't very important, but that is
because reiserfs itself isn't very important.
You might not have noticed, but in the reiserfs Kconfig file it says:

	  Reiserfs is deprecated and scheduled to be removed from the kernel
	  in 2025. If you are still using it, please migrate to another
	  filesystem or tell us your usecase for reiserfs.

So it will still be around for a few years, but there isn't much point
with small clean-ups like this as hardly anyone uses the code, and in a
few years it won't be in mainline Linux at all.

Thanks,
NeilBrown
