From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: using reiserfs as a DB
Date: Mon, 22 Apr 2002 18:03:21 +0400
Message-ID: <15556.6185.169095.33974@laputa.namesys.com>
References: <20020421205328.GA8407@vega.ipal.net>
	<20020422172009.A1109@namesys.com>
	<3CC41485.6000502@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CC41485.6000502@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hans Reiser writes:
 > Oleg Drokin wrote:
 > 
 > >Hello!
 > >
 > >On Sun, Apr 21, 2002 at 03:53:28PM -0500, Phil Howard wrote:
 > >  
 > >
 > >>Given the balanced tree directory structure of reiserfs, it seems it
 > >>could be usable as a DB in place of a DB library (such as Berkeley DB).
 > >>Has anyone done any timing/benchmarks of reiserfs used as a replacement
 > >>for a DB library, as compared to one such as Berkeley DB?  There would
 > >>be an advantage to using conventional file tools to access the data
 > >>instead of having to code some up for a DB library.  The issue would
 > >>certainly involve the open/read/close timings for reiserfs for each
 > >>piece of data accessed.  The uses for which I have an interest in doing
 > >>this would most be small data, usually less than 128 bytes, and almost
 > >>always less than 512 bytes.  For example, one use involves indexing a
 > >>lot of (100s to maybe even 1000000) URLs under special short keywords.
 > >>    
 > >>
 > >
 > >I do not have any numbers, but take in account that while DB database
 > >generally have to updata atime/mtime/ctime on only 3 files (or even 2),
 > >in case of a filesystem each file accessed will change atime and/or mtime/ctime.
 > >
 > >(you can turn off atime updates of course). Also directory lookups ain't going
 > >to be free either.
 > >I've not heard of a test like you are describing, so feel free to implement
 > >one that will suit all your needs.
 > >
 > >But I remember that squid people decided lookup/open/close operations are
 > >too expensive for them and raw reiserfs access was born, where you was able
 > >directly access filesystems objects by the keys. 
 > >
 > >Bye,
 > >    Oleg
 > >
 > >
 > >  
 > >
 > The reiser4() system call,  is specifically designed to alleviate this 
 > problem.  Can you discuss this with Nikita, who is I think at best 
 > half-convinced that reiser4() has any purpose;-), so that he can 
 > understand what you want and why?

Some parts of Phil Howard's concern are in fact addressed by reiser4()
system call: avoiding overhead of multiple system calls, and avoiding
overhead of creating relatively heavy-weight objects (file descriptors
and all related paraphernalia) that are going to be recycled shortly.

But, I guess, another implied idea is to use internal reiser{fs|4} tree
directly as indexing structure, rather than to use "semantical" tree of
user-visible pathnames for this purpose. This was implemented in
reiserfs-raw: back-end for squid cache. Interestingly, reiserfs-raw was
used for exactly storing pages indexed by md5 of URL.

 > 
 > hans
 > 

Nikita.

 > 
 > 
