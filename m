From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] various allocator optimizations
Date: 14 Mar 2003 09:10:54 -0500
Message-ID: <1047651053.8218.1113.camel@tiny.suse.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
	 <1047499021.8219.604.camel@tiny.suse.com>  <3E6F9DE3.2070902@namesys.com>
	 <1047571151.8219.956.camel@tiny.suse.com>  <3E711F34.4060309@namesys.com>
	 <1047605662.8215.1068.camel@tiny.suse.com>
	 <3E71E048.7010104@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13254-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E71E048.7010104@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Fri, 2003-03-14 at 08:59, Manuel Krause wrote:
> On 03/14/2003 02:34 AM, Chris Mason wrote:
> > On Thu, 2003-03-13 at 19:15, Hans Reiser wrote:
> > 
> 
> [ discussion on how to implement lower fragmentation on ReiserFS ]
> 
> >>
> >>Let's get lots of different testers.  You may have a nice heuristic here 
> >>though....
> >>
> > 
> > 
> > If everyone agrees the approach is worth trying, I'll make a patch that
> > enables it via a mount option.
> > 
> [...]
> 
> A dumb question inbetween: How do we - possible testers, users - get 
> information about fragmentation on our ReiserFS partitions?

The best tool I've seen so far originally came from Vladimir and was
modified for a study on fragmentation of reiserfs and ext2, Jeff found
the link somewhere in his archives:

http://www.informatik.uni-frankfurt.de/~loizides/reiserfs/index.html

There is also a filesystem aging tools there that I haven't played with
yet.

-chris


