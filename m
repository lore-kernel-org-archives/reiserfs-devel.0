From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH] reiserfs: Truncate blocks not used by a write (v2)
Date: Thu, 17 Sep 2009 02:56:34 +0200
Message-ID: <20090917005633.GC8098@nowhere>
References: <1253121912-20718-1-git-send-email-jack@suse.cz> <20090916144815.e544b319.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=3m8Gy4P7f90srtIqMMYlS9zp/tSuVkNLiyGSS2FQN6Q=;
        b=veWFhh1jVYlTIcuk56f7Pj/r315O5eqDWhaW/rwZnF8VOMVAAs+pe009KU6tylPRAu
         k+gBQRw6LqM9bZCaM8HOpgso95AKsy0UaM3W/TTbE0JKfQLX5c25efLPSNHzQXoOtiId
         BM1E51r/VwO5PhaqrQHwCtK89kacOeiXAWHjQ=
Content-Disposition: inline
In-Reply-To: <20090916144815.e544b319.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, hch@infradead.org, reiserfs-devel@vger.kernel.org, jeffm@suse.com

On Wed, Sep 16, 2009 at 02:48:15PM -0700, Andrew Morton wrote:
> On Wed, 16 Sep 2009 19:25:12 +0200
> Jan Kara <jack@suse.cz> wrote:
> 
> > It can happen that write does not use all the blocks allocated in write_begin
> > either because of some filesystem error (like ENOSPC) or because page with
> > data to write has been removed from memory. We truncate these blocks so that
> > we don't have dangling blocks beyond i_size.
> 
> This clashes a bit with the kill-the-bkl/reiserfs stuff in linux-next.


Note that the kill-the-bkl/reiserfs tree has suffered from too much
lock inversion problems lately. Even though I just fixed the last one
reported, I would feel more comfortable to schedule this tree for .33
rather than .32

So this tree can be removed from -next and reintegrated once -rc1 is
released, without problem.

So that if this patch is scheduled for .32, I can fix the conflict
myself once -rc1 is released and not burden Stephen with this conflict
which is useless to handle in -next for now.

Thanks.

