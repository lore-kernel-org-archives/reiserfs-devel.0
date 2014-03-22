From: tytso@mit.edu
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Sat, 22 Mar 2014 14:12:36 -0400
Message-ID: <20140322181236.GD23583@thunk.org>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
 <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
 <20140322170322.GA23583@thunk.org>
 <20140322101512.eaeb542b.akpm@linux-foundation.org>
 <20140322172606.GB23583@thunk.org>
 <20140322173207.GC23583@thunk.org>
 <20140322105524.7baec73a.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=thunk.org; s=mail;
	t=1395511956; bh=Pv5qhUU1XWtjXuJ7aq72rhrvXgFhlafygTGuagIqv78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UhiNG44SbM6BiXs5M9+34HNooXWyYgMZtwbsHq0W2BEtBpVLYRgtRSAjfiaGYCFco
	 12z45Hl8zYDt8jyxWif/QQ5WBcgexOJzjMUtWTee/3c/tHQDpciSDOigjtr6qXoNdP
	 JiCLcQ8PFWEEkPiQo5sVXEz7gghA6EgEn1y7laYU=
Content-Disposition: inline
In-Reply-To: <20140322105524.7baec73a.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, David Rientjes <rientjes@google.com>, Joe Perches <joe@perches.com>

On Sat, Mar 22, 2014 at 10:55:24AM -0700, Andrew Morton wrote:
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: scripts/checkpatch.pl: __GFP_NOFAIL isn't going away
> 
> Revert 7e4915e78992eb ("checkpatch: add warning of future __GFP_NOFAIL use").
> 
> There are no plans to remove __GFP_NOFAIL.
> 
> __GFP_NOFAIL exists to
> 
> a) centralise the retry-allocation-for-ever operation into the core
>    allocator, which is the appropriate implementation site and
> 
> b) permit us to identify code sites which aren't handling memory
>    exhaustion appropriately.
> 
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

How about also making the following change which inspired the
checkpatch warning?

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 0437439..d189872 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -58,9 +58,11 @@ struct vm_area_struct;
  * __GFP_REPEAT: Try hard to allocate the memory, but the allocation attempt
  * _might_ fail.  This depends upon the particular VM implementation.
  *
- * __GFP_NOFAIL: The VM implementation _must_ retry infinitely: the caller
- * cannot handle allocation failures.  This modifier is deprecated and no new
- * users should be added.
+ * __GFP_NOFAIL: The VM implementation _must_ retry infinitely: the
+ * caller cannot handle allocation failures.  Callers are strongly
+ * encouraged not to use __GFP_NOFAIL unless the alternative is worse
+ * than OOM killing some random process (i.e., corruption or loss of
+ * some innocent user's data, etc).
  *
  * __GFP_NORETRY: The VM implementation must not retry indefinitely.
  *

