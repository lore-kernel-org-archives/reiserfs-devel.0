From: Chris Mason <mason@suse.com>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 09:48:43 -0400
Message-ID: <1054820922.23132.133.camel@tiny.suse.com>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <200306051959.45126.russell@coker.com.au>
	 <1054807982.1995.56.camel@wusel.schnulli.de>
	 <200306052025.05910.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306052025.05910.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: Heinz-Josef Claes <hjclaes@web.de>, reiserfs-list@namesys.com

On Thu, 2003-06-05 at 06:25, Russell Coker wrote:

> >
> > I use SuSE 8.2. It's much faster than the SuSE kernel in 8.1, even on my
> > ZIP drive at the parallel port ;)
> 
> Hopefully someone can advise on whether the SuSE 8.2 kernel has all the 
> patches you desire for best ReiserFS performance.

The suse kernels include the data logging code, along with the other
minor optimizations in my data logging dir.

The good news is that I've also tracked down a long standing
data=ordered performance bug, and I've got more data=ordered
optimizations to make fsync workloads better.  Hopefully this morning I
can get it all to stop oopsing and I'll send out for broader testing.

-chris


