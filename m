From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs on redhat advanced server?
Date: 31 Jan 2003 09:23:20 -0500
Message-ID: <1044023000.15680.180.camel@tiny.suse.com>
References: <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>
	 <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de>
	 <3E3A67AE.4050601@namesys.com> <20030131122147.GE15359@marowsky-bree.de>
	 <3E3A6D76.7080300@namesys.com> <20030131123943.GH15359@marowsky-bree.de>
	 <20030131160624.A12036@namesys.com>
	 <1044021310.15684.154.camel@tiny.suse.com>
	 <20030131170855.A13196@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030131170855.A13196@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Lars Marowsky-Bree <lmb@suse.de>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Fri, 2003-01-31 at 09:08, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Jan 31, 2003 at 08:55:11AM -0500, Chris Mason wrote:

> > the distro kernels are more suitable for production use than a vanilla
> > kernel.  These companies are betting their support time and future
> 
> This is questionable. Distro's QA cannot just test all possible patterns.
> So there are some kinds of usage (even in production) where vanilla
> kernel is the best thing to use (at least until vendor releases an errata
> kernel).
> 

What you end up with is a vendor kernel that has been specifically
tested in a given workload, and they tend to work very well in that
config.  The vanilla kernels do have a broader testing base, and they do
get a wider variety of bug fixes.  But they don't get the concentrated
high end certification and testing the vendor kernels do.  And that last
little bit of certification is _really_ hard.

> > revenue on their kernels working properly, and the distros take that
> > very seriously.
> 
> That's true.
> 
> > The fact that nobody actually ships a vanilla kernel should make it
> > pretty clear the stock releases are not ready for the tasks our
> 
> Well, I provided an example of people who ship vanilla kernels.
> 

But not a recent example of someone using them in a high end
configuration.  It's even possible that someone has, but doing it over
time for release after release?  Those are the customers that end up
going to redhat and suse.

-chris


