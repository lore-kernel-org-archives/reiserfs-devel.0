From: Chris Mason <mason@suse.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 16:22:14 -0400
Message-ID: <1093465334.21878.231.camel@watt.suse.com>
References: <20040824202521.GA26705@lst.de>  <412CEE38.1080707@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412CEE38.1080707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@lst.de>, akpm@osdl.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, 2004-08-25 at 15:53, Hans Reiser wrote:
> I had not intended to respond to this because I have nothing positive to 
> say, but Andrew said I needed to respond and suggested I should copy 
> Linus. Sigh.
> 
> Dear Christoph,
> 
> Let me see if I can summarize what you and your contingent are saying, 
> and if I misconstrue anything, let me know.;-)
> 
Just for fun why don't we look at the way things are today:

1) reiser4 has semantics that do belong at the VFS level.  They weren't
implemented at the VFS level for a variety of reasons, none of which
really matter right now.

2) new kernel patches that fragment the application developers between
apis are a bad thing.  There does need to be one interface here, and it
is in Hans' best interest to unify his work by working with people to
introduce new kernel wide apis.

This starts with exactly what Christoph described in writing a short
summary of how you want things to work today.  Since we can't resist,
we'll also go ahead and rehash all the old flame wars over this, but try
to include some new ideas about where you want to see the reiser4
interfaces in 6 months as well.

-chris



