From: Isaac Chanin <chanin@WPI.EDU>
Subject: Re: AMD64 progress?
Date: Tue, 8 Feb 2005 15:29:04 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0502081524110.27212-100000@ccc1.wpi.edu>
References: <20050207132934.GA7482@backtop.namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050207132934.GA7482@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com


On Mon, 7 Feb 2005, Alex Zarochentsev wrote:

> Hello,
> 
> On Sat, Jan 15, 2005 at 09:26:01PM -0500, Isaac Chanin wrote:
> > 
> > Also tested this patch, similar results as to what I've been getting - 
> > ie. working for awhile (more than a few hours even this time, but that 
> > could just be coincidence, i suppose) and then going down with the normal 
> > reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, 
> > start_offset) >= end_offset error.  For the exact message see 
> > http://users.wpi.edu/~chanin/r4newpatch.txt.
> > 
> 
> please try attached patch (it is for fs/reiser4 subtree)
> 
> -- 
> Alex.
> 

Alex,

Thanks for the patch, just chiming in to say that this also seems to be 
working well for me too.  I've never had any consistant crashes to test,
but with this patch reiser4 has managed to not trigger a kernel panic in
at least twice as long as without it - could just be luck; but, with
Jake's test no longer crashing it on his machine I'd "the bug" is 
fixed.

If anything does go wrong eventually I'll be sure to give you the error 
messages and such.

Thanks again,
Isaac

