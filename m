From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Sat, 22 Mar 2014 10:15:12 -0700
Message-ID: <20140322101512.eaeb542b.akpm@linux-foundation.org>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
	<20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
	<20140322170322.GA23583@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140322170322.GA23583@thunk.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tytso@mit.edu
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Sat, 22 Mar 2014 13:03:22 -0400 tytso@mit.edu wrote:

> On Fri, Mar 21, 2014 at 01:00:55PM -0700, Andrew Morton wrote:
> > 
> > The whole point of __GFP_NOFAIL is to centralise this
> > wait-for-memory-for-ever operation.  So it is implemented in a common
> > (core) place and so that we can easily locate these problematic
> > callers.
> > 
> > is exactly wrong.  Yes, we'd like __GFP_NOFAIL to go away, but it
> > cannot go away until buggy callsites such as this one are *fixed*. 
> > Removing the __GFP_NOFAIL usage simply hides the buggy code from casual
> > searchers.
> 
> The change to jbd2 was made in July 2010, back when the "we must
> exterminate GFP_NOFAIL at all costs" brigade was in high gear, and the
> folks claiming that GFP_FAIL *would* go away, come hell or high water,
> was a bit more emphatic.

Whoever was saying that had the wrong end of the stick.  It's all very
odd.

> I'll note that since 2011, there has been precious little movement on
> removing the final few callers of GFP_NOFAIL, and we still have a bit
> under two dozen of them, including a new one in fs/buffer.c that was
> added in 2013.

Well.  Converting an existing retry-for-ever caller to GFP_NOFAIL is
good.  Adding new retry-for-ever code is not good.

> In any case, __GFP_NOFAIL is in the code comments, so a casual
> searcher would find it pretty quickly with a "git grep".

There's that.  But retry-for-ever is a common operation which the core
allocator can implement and maintain better than remote callsites.

