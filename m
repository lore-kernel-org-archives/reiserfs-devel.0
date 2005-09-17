From: Christoph Hellwig <hch@infradead.org>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sat, 17 Sep 2005 10:22:47 +0100
Message-ID: <20050917092247.GA13992@infradead.org>
References: <432AFB44.9060707@namesys.com> <20050916174028.GA32745@infradead.org> <432B1F84.3000902@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <432B1F84.3000902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Sep 16, 2005 at 12:39:48PM -0700, Hans Reiser wrote:
> Christoph Hellwig wrote:
> 
> >additinoal comment is that the code is very messy, very different
> >from normal kernel style, full of indirections and thus hard to read.
> >
> 
> Most of my customers remark that Namesys code is head and shoulders
> above the rest of the kernel code.  So yes, it is different.  In
> particular, they cite the XFS code as being so incredibly hard to read
> that its unreadability is worth hundreds of thousands of dollars in
> license fees for me.  That's cash received, from persons who read it
> all, not commentary made idly.

It's very different from kernel style, and it's hard to read for us kernel
developers.  And yes, I don't think XFS is the most easy to read code either,
quite contrary.  But it's at least half a magnitude less bad than reiser4
code..

