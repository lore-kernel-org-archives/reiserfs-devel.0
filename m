From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs logging patches udpated
Date: Thu, 25 Mar 2004 13:19:58 -0500
Message-ID: <1080238798.26669.12.camel@watt.suse.com>
References: <1080149399.14737.77.camel@watt.suse.com>
	 <200403250147.54246.bernd-schubert@web.de>
	 <1080176455.14737.140.camel@watt.suse.com>
	 <200403251911.24983.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17472-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403251911.24983.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com

On Thu, 2004-03-25 at 13:11, Bernd Schubert wrote:
> Hello Chris,
> 
> > But there are just as many threads about reiserfs not having
> > data=ordered support.  It's an important feature that has been out of
> > mainline for far too long.
> 
> what do you think about giving a kernel message on mounting the filesystem, 
> that data logging is enabled by default now? That way people who don't know 
> about it, at least would become informed on reading the log files.

reiserfs: using ordered data mode
Reiserfs journal params: device dm-0, size 8192, journal first block 18,
max trans len 1024, max batch 900, max commit age 30, max trans age 30
reiserfs: checking transaction log (dm-0) for (dm-0)
Using r5 hash to sort names

Something like that?

-chris


