From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Wed, 2 Jun 2004 16:03:46 +0300
Message-ID: <200406021603.46918.rmeijer@internet.gr>
References: <200406021554.11690.rmeijer@internet.gr> <20040602125602.GC8091@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040602125602.GC8091@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed 2 June 2004 15:56, Alex Zarochentsev wrote:

> > I have tried the reiser4-2004.05.31-19.36-linux-2.6.6-mm2.diff.gz patch 
> > from http://www.namesys.com/auto-snapshots/ and it compiles and boots
> > cleanly, but it won't mount my Reiser4 partitions :(

> what reiser4 messages were in the log?

I didn't write it down...and nothing was written to the logs because all 
partitions except the root partition are Reiser4.

But there was a kernel Oops and something like:

"page_extent: trying to read past end of device. Want=23252123 Limit=83380"

I can try again and write down the messages if you want...


Thanks,

Ray
