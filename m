From: Chris Mason <mason@suse.com>
Subject: Re: large files
Date: Tue, 18 May 2004 11:07:49 -0400
Message-ID: <1084892869.20437.1551.camel@watt.suse.com>
References: <200405172148.33162.bernd-schubert@web.de>
	 <200405181544.36152.bernd-schubert@web.de>
	 <1084888676.20437.1477.camel@watt.suse.com>
	 <200405181649.22909.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405181649.22909.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Schubert <bernd-schubert@web.de>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

On Tue, 2004-05-18 at 10:49, Bernd Schubert wrote:

> Unfortunality I even don't have an idea how to interprete those numbers.
> 

Well, on 2.6, you've got one or more pdflush daemons that might
contribute to the load as well.

> 
> > > Do you have any ideas how we could improve 2.4.x?
> >
> > 2.6.6-mm has a few key improvements.  There's less metadata
> > fragmentation thanks to some block allocator fixes.  More importantly,
> > during the rm, metadata blocks are read in 16 at a time instead of 1 at
> > a time.  I'd be happy to give someone pointers on porting the metadata
> > readahead bits back to 2.4.
> 
> I certainly have neither the knowledge nor the time to do that.
> 

I'd suggest contacting namesys.  Really all the patch needs is some
reject / fuzz resolution and testing.

-chris


