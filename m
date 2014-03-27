From: David Rientjes <rientjes@google.com>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Wed, 26 Mar 2014 21:38:40 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1403262133100.6103@chino.kir.corp.google.com>
References: <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org> <20140322170322.GA23583@thunk.org> <20140322101512.eaeb542b.akpm@linux-foundation.org> <20140322172606.GB23583@thunk.org> <20140322173207.GC23583@thunk.org>
 <20140322105524.7baec73a.akpm@linux-foundation.org> <20140322192423.GA10176@redhat.com> <alpine.DEB.2.02.1403251800320.21733@chino.kir.corp.google.com> <20140326061904.GA4907@thunk.org> <20140325233209.31756c92.akpm@linux-foundation.org>
 <20140326132936.GB4907@thunk.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version:content-type;
        bh=MZQ96zzotZ2maOkyfAMXACZIlhGmqIoy77sWx4mxzNs=;
        b=S1ogio89fSucrv5N5hg05jwYKwkTHIRlJ2YM9dmd8T92VnjJBuCKUd/i6p18aTixEM
         9Lt7De9j+7Ou3cKj9uS9CDwrZos6+1IXfDSGPsfSR7IUZxUo/YTfCE2NpLFuuqM2TIDJ
         8ZBW6ZFzDPrT8bLym51l5xZplWJ08mqPHSPFkVyIdCSCRGbUicj9tpjCfDpheWHXKTTf
         cYzPoNk21ygZclzSbaNTKC/DdHYCuUbyFlNnUT+BWV2AE1EDUv+DOUn5JyQw12LZhudT
         mP/44XdHr0dEDJEhMKgUXOjGgvh6wkxDHUvconffVNP391YTwIGc4fteM8oD0BXJ2Lzc
         On3g==
In-Reply-To: <20140326132936.GB4907@thunk.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tytso@mit.edu
Cc: Andrew Morton <akpm@linux-foundation.org>, Dave Jones <davej@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Joe Perches <joe@perches.com>

On Wed, 26 Mar 2014, tytso@mit.edu wrote:

> But that's another new user of GFP_NOFAIL (and one added three years
> after David tried to declare There Shalt Be No New Users of
> GFP_NOFAIL), and sure, we could probably patch around that by having
> places where there's no other alternaive to keep a preallocated batch
> of pages and/or allocated structures at each code site.  But that's as
> bad as looping at each code site; in fact, wouldn't it be better if
> the allocator wants to avoid looping, to have a separate batch of
> pages which (ala GFP_ATOMIC) which is reserved for just for GFP_NOFAIL
> allocations when all else fails?
> 

I didn't declare nobody should be adding __GFP_NOFAIL three years ago, 
rather three months ago I proposed a patch to fix __GFP_NOFAIL for 
GFP_ATOMIC allocations you're talking about above since, guess what, 
GPF_ATOMIC | __GFP_NOFAIL today easily returns NULL.  I tried fixing that 
failable-__GFP_NOFAIL problem with 
http://marc.info/?l=linux-kernel&m=138662620812698 but Andrew requested a 
WARN_ON_ONCE() instead since nobody is currently doing that and we agreed 
to warn against new users.

So we should either return to my earlier patch to actually make 
__GFP_NOFAIL not fail, or improve (but not remove) the checkpatch warning 
for these failable cases.  I couldn't care less if we add 5,000 new 
__GFP_NOFAIL users tomorrow, I just care that it does what is expected if 
people are going to be adding them.
