From: Russell Coker <russell@coker.com.au>
Subject: Re: FIFO files
Date: Thu, 19 Jun 2003 01:23:00 +1000
Message-ID: <200306190123.00756.russell@coker.com.au>
References: <20030617162127.GA14124@chepelov.org> <1055944386.27851.7.camel@passion.cambridge.redhat.com> <20030618142843.GP24357@parcelfarce.linux.theplanet.co.uk>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030618142843.GP24357@parcelfarce.linux.theplanet.co.uk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthew Wilcox <willy@debian.org>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Thu, 19 Jun 2003 00:28, Matthew Wilcox wrote:
> has anyone analysed this for races?  are they the same as the ones for
> truncate?  (i suspect they aren't).  what are the semantics of another
> thread or process reading from a block that's been punched out?  what are
> the semantics of another thread or process writing to a block that gets
> punched out?  what are the semantics of another thread or process that
> has this region of the file mmaped?  what are the semantics if this
> thread has it mmaped?  what if two threads try to punch out overlapping
> regions simultaneously?  what if a region is being truncated and punched
> out at the same time?

In what way are they different from that of truncate?

It seems to me that punching a hole in a file is actually easier than 
truncating a file as we don't have to change the length.  The issues of 
mmap'd files and writing to a block that's being punched should be the same 
as if the file was truncated.

The only thing that punching a hole has to handle that truncating doesn't is 
the corner case of punching a hole that does not align on block boundaries, 
in which case zeros have to be written to the parts that aren't block 
aligned, and for consistency they probably have to be written atomically.

As for truncating and punching at the same time, surely that would just be 
equivalent to a truncate to whichever gives the shortest file and both system 
calls would return success.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

