From: Chris Mason <mason@suse.com>
Subject: Re: Reiserfs concurrent write problems
Date: Mon, 26 Apr 2004 13:36:11 -0400
Message-ID: <1083000970.30344.50.camel@watt.suse.com>
References: <20040426172648.GA22918@em.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040426172648.GA22918@em.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: reiserfs-list@namesys.com

On Mon, 2004-04-26 at 13:26, Bruce Guenter wrote:
> Greetings.
> 
> I have been running a series of custom benchmarks to see what
> filesystems perform best for a maildir-based mail server.
> 
> 	http://untroubled.org/benchmarking/2004-04/
> 
> So far, reiserfs has by far the best reading rate, but has serious
> problems when more than one writer is trying to fsync concurrently.
> Also, adding an external journal actually slows down the procedure
> instead of improving performance.  Are there any configuration changes
> or patches I should be trying to improve write performance?

Please try 2.6.6-rc2-mm2, which has new block allocator patches and
other speedups.

The default mount options should work best for you, but this might work
too:

mount -o alloc=skip_busy:dirid_groups /dev/xxx /mnt

Depending on the file size, 

mount -o notail can make a huge difference too.

-chris


