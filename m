From: Chris Mason <mason@suse.com>
Subject: Re: Reiserfs concurrent write problems
Date: Thu, 29 Apr 2004 16:16:26 -0400
Message-ID: <1083269786.30344.321.camel@watt.suse.com>
References: <20040426172648.GA22918@em.ca>
	 <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca>
	 <1083088841.30344.131.camel@watt.suse.com> <20040427201559.GA17186@em.ca>
	 <1083196101.30344.222.camel@watt.suse.com> <20040429190403.GA4015@em.ca>
	 <1083266365.30344.309.camel@watt.suse.com>  <20040429200832.GA7399@em.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18296-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040429200832.GA7399@em.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: reiserfs-list@namesys.com

On Thu, 2004-04-29 at 16:08, Bruce Guenter wrote:
> On Thu, Apr 29, 2004 at 03:19:25PM -0400, Chris Mason wrote:
> > On Thu, 2004-04-29 at 15:04, Bruce Guenter wrote:
> > > > In reiserfs data=journal mode, you get strict ordering of all the
> > > > transactions.
> > > 
> > > What about in data=ordered mode?
> >
> > It won't work in the face of io errors.
> 
> What kind of I/O errors would cause what kind of problems?

In data=ordered mode if you get io errors on the data blocks, you might
not find out about them until the fsync.  If the fsync is after the
rename, you'll rename a bad file into the delivered directory.

-chris




