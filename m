From: "Martin J. Bligh" <mbligh@aracnet.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 13:04:17 -0700
Message-ID: <23320000.1093550657@flay>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412D9FE6.9050307@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>
Cc: hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

> Don't move reiser4 into vfs, use reiser4 as the vfs. 

Ah ... that seems to be a good insight into what you're driving for.
That would seem to be good for you ... and bad for other filesystems.
So whilst I can see why you'd want it - but I don't think it's a good idea.
Competition is good.

Andrew wrote:

> And what are the licensing implications of plugins?  Are they derived
> works?  Must they be GPL'ed?

You replied:

>>And what are the licensing implications of plugins?  Are they derived
>>works?  
>
> Yes.

I find it odd that you cut out the last part of his question. So must
they be GPL'ed or not?

M.

