From: Matt Mackall <mpm@selenic.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 16:52:17 -0500
Message-ID: <20040825215217.GK5414@waste.org>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, Aug 25, 2004 at 01:22:55PM -0700, Linus Torvalds wrote:
> 
> 
> On Wed, 25 Aug 2004, Christoph Hellwig wrote:
> > 
> > For one thing _I_ didn't decide about xattrs anyway.  And I still
> > haven't seen a design from you on -fsdevel how you try to solve the
> > problems with files as directories.
> 
> Hey, files-as-directories are one of my pet things, so I have to side with 
> Hans on this one. I think it just makes sense. A hell of a lot more sense 
> than xattrs, anyway, since it allows scripts etc standard tools to touch 
> the attributes.
> 
> It's the UNIX way.

I thought the UNIX way is "everything's a file", not "everything's a
directory".

> Will it potentially break something? Sure. Do we care? Me, I'll take that 
> kind of extension _any_ day over xattrs, that are fundamentally flawed in 
> my opinion and totally useless.

There's always the option that they're both broken.

-- 
Mathematics is the supreme nostalgia of our time.
