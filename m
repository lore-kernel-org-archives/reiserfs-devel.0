From: Chris Mason <mason@suse.com>
Subject: Re: large files
Date: Tue, 18 May 2004 09:57:56 -0400
Message-ID: <1084888676.20437.1477.camel@watt.suse.com>
References: <200405172148.33162.bernd-schubert@web.de>
	 <1084824741.20437.368.camel@watt.suse.com>
	 <200405181544.36152.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405181544.36152.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Schubert <bernd-schubert@web.de>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

On Tue, 2004-05-18 at 09:42, Bernd Schubert wrote:
> Hello Chris,
> 
> >
> > As a comparison data point, could you please try 2.6.6-mm3?  I realize
> > you don't want to run this kernel in production, but it would tell us if
> > I understand the problems at hand.
> 
> the results in 2.6.6-mm3 are below, we almost consider to run this kernel 
> version.
> 
> Here are two other interesting facts:
> 
> 1.) During the filecreation in 2.4.26 the load on the system was around 3-4, 
> whereas in 2.6.6-mm3 the load was at about 8-9.
> 
Which procs contributed to this load?  The simple dd should have kept
the load at one.

> 2.) When the dd file creation process finished (2.4.26 was running) the system 
> became so unresponsible, that the drdb connection timed out and a resync 
> process automatically started when the system became responsible again. I 
> don't have any comparism to 2.6.6-mm3 since we would need another drbd 
> version. Also, I don't know if this happend when dd finished or when 
> rm-started, since both were running from a script.
> 
Probably the rm.

[ 2.6.6-mm3 is much faster ]

> Do you have any ideas how we could improve 2.4.x? 
> 

2.6.6-mm has a few key improvements.  There's less metadata
fragmentation thanks to some block allocator fixes.  More importantly,
during the rm, metadata blocks are read in 16 at a time instead of 1 at
a time.  I'd be happy to give someone pointers on porting the metadata
readahead bits back to 2.4.

-chris


