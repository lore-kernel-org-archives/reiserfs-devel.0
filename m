From: Chris Mason <mason@suse.com>
Subject: Re: Status of reiserfs in Redhat 2.4.7-10 kernel ?
Date: 17 Apr 2003 12:18:03 -0400
Message-ID: <1050596282.12923.226.camel@tiny.suse.com>
References: <Pine.NEB.4.44.0304151610230.25702-100000@slick.sigje.org>
	 <3E9D0744.9090907@namesys.com> <1050499043.10791.137.camel@tiny.suse.com>
	 <3E9D7DA6.8040507@namesys.com> <3E9DB547.4030109@web.de>
	 <3E9ECEFC.6090508@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E9ECEFC.6090508@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Gerrit Hannaert <degerrit@web.de>, reiserfs-list@namesys.com

On Thu, 2003-04-17 at 11:57, Hans Reiser wrote:
> >
> >I think there is something to be said for test suites *and* for testing
> >by a good number of users, and new kernels should probably get a good
> >dose of both before running on any production system. You should
> >probably get as much testing as you can get, and excluding test suites
> >doesn't sound like a good idea to me - which may not be what Hans meant,
> >though ;-).
> >
> Test suites are what you use before burdening real testers with bugs 
> that can be found other than the hard way.
> 

Test suites are only a small part of the testing done by vendors.  Many
of the bug reports come from partners and others trying the beta kernels
in real world situations.  These run from certifications by partners to
benchmarks, to people who are just trying to get every penny out of
their hardware.  

> What really infuriates me most is when vendors try to inhibit people 
> from switching around.  I am lobbying the GSA (US agency that sets 
> procurement policies) to try to get them to refuse to buy support 
> contracts that are distro specific.

Grin, we've been here before too.  It's easy to preach this kind of
thing when you don't run your own distro.   But it's also easy to buy a
non-distro specific support contract from various places, it's all a
matter of price in the end.

-chris


