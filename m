From: Fabian Frederick <fabf@skynet.be>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Sat, 22 Mar 2014 22:13:44 +0100
Message-ID: <20140322221344.62e8addc4facbe799b186496@skynet.be>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
	<20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
	<20140322170322.GA23583@thunk.org>
	<20140322101512.eaeb542b.akpm@linux-foundation.org>
	<20140322172606.GB23583@thunk.org>
	<20140322173207.GC23583@thunk.org>
	<20140322105524.7baec73a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140322105524.7baec73a.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tytso@mit.edu, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, David Rientjes <rientjes@google.com>, Joe Perches <joe@perches.com>

On Sat, 22 Mar 2014 10:55:24 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

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
> 
> Obviously I was asleep when I merged that checkpatch change.

Exactly where confusion came from, thanks !

Fabian
