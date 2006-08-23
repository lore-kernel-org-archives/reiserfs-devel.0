From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: eliminate minimum window size for bitmap searching
Date: Tue, 22 Aug 2006 17:07:04 -0700
Message-ID: <44EB9C28.9030204@namesys.com>
References: <44EB1484.2040502@suse.com> <44EB23D9.9000508@slaphack.com> <44EB28EC.50802@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29664-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44EB28EC.50802@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: David Masover <ninja@slaphack.com>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Mike Benoit <ipso@snappymail.ca>

Jeff Mahoney wrote:
>
>
> Also, I think the bigalloc behavior just ultimately ends up introducing
> even more fragmentation on an already fragmented file system. It'll keep
> contiguous chunks together, but those chunks can end up being spread all
> over the disk.
>
> -Jeff
>
Yes, and almost as important, it makes it difficult to understand and
predict the allocator, which means other optimizations become harder to do.
