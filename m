From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] reiserfs: eliminate minimum window size for bitmap
 searching
Date: Tue, 22 Aug 2006 17:11:33 -0700
Message-ID: <20060822171133.72692542.akpm@osdl.org>
References: <44EB1484.2040502@suse.com>
	<44EB23D9.9000508@slaphack.com>
	<44EB28EC.50802@suse.com>
	<44EB684C.2090206@slaphack.com>
	<44EB7518.5010204@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44EB7518.5010204@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Mike Benoit <ipso@snappymail.ca>


I can see that the bigalloc code as-is is pretty sad, but this is a scary
patch.  It has the potential to cause people significant performance
problems way, way ahead in the future.

For example, suppose userspace is growing two files concurrently.  It could
be that the bigalloc code would cause one file's allocation cursor to
repeatedly jump far away from the second.  ie: a beneficial side-effect. 
Without bigalloc that side-effect is lost and the two files blocks end up
all intermingled.

I don't know if that scenario is realistic, but I bet there are similar
accidental oddities which can occur as a result of this change.

But what are they?

