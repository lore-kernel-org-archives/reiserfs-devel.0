From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Fri, 16 Sep 2005 12:39:48 -0700
Message-ID: <432B1F84.3000902@namesys.com>
References: <432AFB44.9060707@namesys.com> <20050916174028.GA32745@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050916174028.GA32745@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Christoph Hellwig wrote:

>additinoal comment is that the code is very messy, very different
>from normal kernel style, full of indirections and thus hard to read.
>

Most of my customers remark that Namesys code is head and shoulders
above the rest of the kernel code.  So yes, it is different.  In
particular, they cite the XFS code as being so incredibly hard to read
that its unreadability is worth hundreds of thousands of dollars in
license fees for me.  That's cash received, from persons who read it
all, not commentary made idly.

May I suggest that you work on the XFS code instead?  Surely with all of
this energy you have, you could improve XFS a lot before it gets
accepted into the kernel. 

As for the indirections, if you figure out how to make VFS indirections
easy to follow, the same technique should be applicable to Reiser4, and
I will be happy to fix it. 

Hans

(Note for the record: I actually think XFS acceptance was delayed too
long, and I think that XFS is a great filesystem, but a rhetorical point
needed to be made......)
