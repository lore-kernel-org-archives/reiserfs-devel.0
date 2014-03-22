From: tytso@mit.edu
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Sat, 22 Mar 2014 13:26:06 -0400
Message-ID: <20140322172606.GB23583@thunk.org>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
 <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
 <20140322170322.GA23583@thunk.org>
 <20140322101512.eaeb542b.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=thunk.org; s=mail;
	t=1395509166; bh=5yFoOADAVny40T79l83oouv9t6NXWOiWpKI+8maVrkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFGdj+dPkuGGADXfDBFifriNvpG2AM9/BPdIuip+YZIF0CkVs7ybSaaSpD2SELrvZ
	 9A/cnYWE55d/vft1l+rjZDshG6CdudHneJv/fraDk/VUgqhqm46qTQa5wFFZd6LThY
	 77f1PgmuAYRwR7bLo3WXv/KE4ZGvadMLC6uCEtX8=
Content-Disposition: inline
In-Reply-To: <20140322101512.eaeb542b.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Sat, Mar 22, 2014 at 10:15:12AM -0700, Andrew Morton wrote:
> > I'll note that since 2011, there has been precious little movement on
> > removing the final few callers of GFP_NOFAIL, and we still have a bit
> > under two dozen of them, including a new one in fs/buffer.c that was
> > added in 2013.
> 
> Well.  Converting an existing retry-for-ever caller to GFP_NOFAIL is
> good.  Adding new retry-for-ever code is not good.

Actually, it wasn't converting an existing loop; it was adding a new
GFP_NOFAIL to fix a reclaim livelock (commit 84235de394d9775bf).

I agree that in ideal world, we'd get rid of all of these.  But
sometimes, the cure can be worse than the disesae, and so the whole
"all callers of GFP_NOFAIL are MUST FIX BUGGGY and the maintainers
should be shamed into fixing it" attitude is one that I find a bit odd
myself.

	      	    	    	     	     - Ted
