From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: FIFO files
Date: Wed, 18 Jun 2003 16:40:24 +0100
Message-ID: <1055950824.27851.83.camel@passion.cambridge.redhat.com>
References: <20030617162127.GA14124@chepelov.org>
	 <1055944386.27851.7.camel@passion.cambridge.redhat.com>
	 <20030618142843.GP24357@parcelfarce.linux.theplanet.co.uk>
	 <200306190123.00756.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14613-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306190123.00756.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: Matthew Wilcox <willy@debian.org>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Wed, 2003-06-18 at 16:23, Russell Coker wrote:
> In what way are they different from that of truncate?

truncate? Surely the semantics are equivalent to writing all zeroes, not
truncate?

> It seems to me that punching a hole in a file is actually easier than 
> truncating a file as we don't have to change the length.  The issues of 
> mmap'd files and writing to a block that's being punched should be the same 
> as if the file was truncated.

Except with truncate it's hard, and for 'punch' (or fclear()) I'd
suggest that you're allowed to just refrain from freeing the backing
store for the page in question if it's mapped shared writable. 

It should be considered identical to mmapping /dev/zero and writing from
it, the _only_ exception being that it hints to the underlying file
system that it _may_ want to free the backing store for the range in
question.

> The only thing that punching a hole has to handle that truncating doesn't is 
> the corner case of punching a hole that does not align on block boundaries, 
> in which case zeros have to be written to the parts that aren't block 
> aligned, and for consistency they probably have to be written atomically.

We don't even bother with atomicity in write() do we? We do a page at a
time and if reads happen while a writer is between pages, they see that
the write() isn't atomic. 

> As for truncating and punching at the same time, surely that would just be 
> equivalent to a truncate to whichever gives the shortest file and both system 
> calls would return success.

Either the truncate happens first and the punch then extends i_size to
the last byte which was punched, or the punch happens first and the file
is subsequently truncated.


-- 
dwmw2

