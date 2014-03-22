From: Dave Jones <davej@redhat.com>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Sat, 22 Mar 2014 15:24:23 -0400
Message-ID: <20140322192423.GA10176@redhat.com>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
 <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
 <20140322170322.GA23583@thunk.org>
 <20140322101512.eaeb542b.akpm@linux-foundation.org>
 <20140322172606.GB23583@thunk.org>
 <20140322173207.GC23583@thunk.org>
 <20140322105524.7baec73a.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140322105524.7baec73a.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tytso@mit.edu, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, David Rientjes <rientjes@google.com>, Joe Perches <joe@perches.com>

On Sat, Mar 22, 2014 at 10:55:24AM -0700, Andrew Morton wrote:
 > On Sat, 22 Mar 2014 13:32:07 -0400 tytso@mit.edu wrote:
 > 
 > > On Sat, Mar 22, 2014 at 01:26:06PM -0400, tytso@MIT.EDU wrote:
 > > > > Well.  Converting an existing retry-for-ever caller to GFP_NOFAIL is
 > > > > good.  Adding new retry-for-ever code is not good.
 > > 
 > > Oh, and BTW --- now that checkpatch.pl now flags an warning whenever
 > > GFP_NOFAIL is used
 > 
 > I don't know what the basis for this NOFAIL-is-going-away theory could
 > have been.  What's the point in taking a centrally implemented piece of
 > logic and splattering its implementation out to tens of different
 > callsites?

I wonder if some of that thinking came from this..

commit dab48dab37d2770824420d1e01730a107fade1aa
Author: Andrew Morton <akpm@linux-foundation.org>
Date:   Tue Jun 16 15:32:37 2009 -0700

    page-allocator: warn if __GFP_NOFAIL is used for a large allocation
    
    __GFP_NOFAIL is a bad fiction.  Allocations _can_ fail, and callers should
    detect and suitably handle this (and not by lamely moving the infinite
    loop up to the caller level either).


Perhaps some of the commentary in that changeset should be updated too.
Linus changed it from single page to > order 1 in 4923abf9f1a4c1864af438a57c1f3686548230e9
but there's still this..

+                        * __GFP_NOFAIL is not to be used in new code.
+                        *
+                        * All __GFP_NOFAIL callers should be fixed so that they
+                        * properly detect and handle allocation failures.


Additionally, I don't recall seeing that warn_on trigger in a while.
I have vague memories that e1000e used to step on it from time to time, but
maybe that got fixed.

	Dave

