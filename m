From: Thomas Cataldo <tomc@compaqnet.fr>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 20:40:27 +0200
Message-ID: <1093545627.11770.2.camel@buffy>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com>
	 <20040826093407.GB28854@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826093407.GB28854@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Thu, 2004-08-26 at 11:34 +0200, Christoph Hellwig wrote:
> On Thu, Aug 26, 2004 at 01:31:34AM -0700, Hans Reiser wrote:
> > Andrew, we need to compete with WinFS and Dominic Giampaolo's filesystem 
> > for Apple, and that means we need to put search engine and database 
> 
> Dou you know a nice thing?  We (as in the Linux Community) don't have to
> compete with anyone.  Sure, we're usually trying to be better than
> anyone else, but unlike companies under maret pressure we can wait until
> something is ready.

By the way, this kind of features can be achieved easily in userspace
with, for example, ext3, beagle (a userspace fulltext indexing daemon)
and some (d|i)notify magic.


