From: Jeremy Allison <jra@samba.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 13:20:22 -0700
Message-ID: <20040825202022.GK10907@legion.cup.hp.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
Reply-To: Jeremy Allison <jra@samba.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20508-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <412CEE38.1080707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@lst.de>, akpm@osdl.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, Aug 25, 2004 at 12:53:28PM -0700, Hans Reiser wrote:
> 
> You ignored everything I said during the discussion of xattrs about how 
> there is no need to have attributes when you can just have files and 
> directories, and that xattrs reflected a complete ignorance of name 
> space design principles.  When I said we should just add some nice 
> optional features to files and directories so that they can do 
> everything that attributes can do if they are used that way, you just 
> didn't get it.  You instead went for the quick ugly hack called xattrs.  
> You then got that ugly hack done first, because quick hacks are, well, 
> quick.  I then went about doing it the right way for Reiser4, and got 
> DARPA to fund doing it.  I was never silent about it.

I don't want to comment on any of the technical issues about VFS etc. as
I would be completely out of my depth, however I do want to say 2 things. Firstly,
this is a feature that Samba users have been needing for many years to maintain
compatibility with NTFS and Windows clients. Microsoft no longer sell any servers
or clients without support for multiple data streams per file, and their latest
XP SP2 code *does* use this feature. Whatever the kernel issues I'm really glad
that Hans and Namesys have created something we can use to match this
functionality - soon we will need it in order to be able to exist in
a Microsoft client-dominated world.

My second point is the following. Hans - did you *really* have to reinvent
the wheel w.r.t userspace API calls ? Did you look at this work (done in 2001
for Solaris) ?

http://bama.ua.edu/cgi-bin/man-cgi?fsattr+5
http://bama.ua.edu/cgi-bin/man-cgi?attropen+3C
http://bama.ua.edu/cgi-bin/man-cgi?openat+2

I'm complaining here as someone who will have to write portable code
to try and work on all these "files with streams" systems.

Jeremy.
