From: Chris Mason <mason@suse.com>
Subject: Re: Reiser4 on SuSE 9.1
Date: Mon, 07 Jun 2004 09:41:17 -0400
Message-ID: <1086615676.22636.3810.camel@watt.suse.com>
References: <200406041414.HAA14660@amber.he.net>
	 <1086359021.22636.3685.camel@watt.suse.com>
	 <200406071600.40914.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19065-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406071600.40914.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael.James@csiro.au
Cc: reiserfs-list@namesys.com

On Mon, 2004-06-07 at 02:00, Michael James wrote:

> > We're interested in v4 of course, as things stabilize we'll consider
> > including it.  This doc is fairly up to date, and it might help you
> > figure out the suse build setup:
> > 
> > http://www.suse.de/~agruen/kernel-doc/
> 
> Thanks for the link. I'll try and get the modules compiled.
> I'd also like to use a kernel as close to suse's as possible.
> 
> I'll be bringing up a sub-cluster to test Suse 9.1 soon.
> Currently the cluster nodes run Suse 8.2.
> 
> I'd love to use reiser4 to hold the genetic database files.
> 

Testing of both suse and reiser4 is a good thing, but honestly at this
stage in the reiser4 development it might be best to test on whatever
kernels namesys releases with.  

Bug reports against the suse kernel are just going to distract them away
from their prime focus (reiser4 bugs in mainline).

-chris


