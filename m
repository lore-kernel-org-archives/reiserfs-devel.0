From: Clay Barnes <clay.barnes@gmail.com>
Subject: Re: [PATCH] reiserfs: eliminate minimum window size for bitmap
	searching
Date: Tue, 22 Aug 2006 19:46:34 -0700
Message-ID: <20060823024634.GK9112@HAL_5000D.tc.ph.cox.net>
References: <44EB1484.2040502@suse.com> <44EB23D9.9000508@slaphack.com>
	<44EB28EC.50802@suse.com> <44EB684C.2090206@slaphack.com>
	<44EB7518.5010204@suse.com> <20060822171133.72692542.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060822171133.72692542.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Jeff Mahoney <jeffm@suse.com>, David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Mike Benoit <ipso@snappymail.ca>

On 17:11 Tue 22 Aug     , Andrew Morton wrote:
> 
> I can see that the bigalloc code as-is is pretty sad, but this is a scary
> patch.  It has the potential to cause people significant performance
> problems way, way ahead in the future.
> 
> For example, suppose userspace is growing two files concurrently.  It could
> be that the bigalloc code would cause one file's allocation cursor to
> repeatedly jump far away from the second.  ie: a beneficial side-effect. 
> Without bigalloc that side-effect is lost and the two files blocks end up
> all intermingled.
Perhaps I mis-recall, but shouldn't delayed writes (or something along 
those lines) cause a case where two files are being incrementally
written rare?  It seems that this case would only occur if two processes
were writing two files in small chunks and calling fsync constantly
(*cough* evolution column resizing bug *cough*), PLUS the two would
have to have the same offset (or close) for the file writes.

It seems that the risk of fragmentation is a lesser danger than the full
system near lock-up caused by the old behavour.


--Clay
> 
> I don't know if that scenario is realistic, but I bet there are similar
> accidental oddities which can occur as a result of this change.
> 
> But what are they?
