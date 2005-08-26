From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: reiser fs slow on mksf and mount
Date: Fri, 26 Aug 2005 14:16:53 -0400
Message-ID: <1125080213.5549.100.camel@localhost.localdomain>
References: <1125074717.5549.44.camel@localhost.localdomain>
	 <430F4B91.7030909@namesys.com>
	 <1125076138.5549.65.camel@localhost.localdomain>
	 <1125076558.5549.72.camel@localhost.localdomain>
	 <430F5226.50701@namesys.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430F5226.50701@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 2005-08-26 at 21:32 +0400, Vladimir V. Saveliev wrote:


one more question about this bitmap blocks

are this bitmap data is pinned into system thus will not be swapped out?

Thanks!


Ming


> Yes. On mount reiserfs reads all bitmap blocks to memory. Those blocks are spread over whole disk. There is workaround for this problem.
> 
> >>>>
> >>>There is a patch to cure this problem.
> >>>http://www.mail-archive.com/reiserfs-list@namesys.com/msg18442.html
> >>>Please note that it is experimental one.
> >>>
> >>>>
> >>>>
> > 
> > 
> > 
> 

