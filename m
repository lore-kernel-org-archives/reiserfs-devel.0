From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 17:08:55 +0300
Message-ID: <20030131170855.A13196@namesys.com>
References: <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no> <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de> <3E3A67AE.4050601@namesys.com> <20030131122147.GE15359@marowsky-bree.de> <3E3A6D76.7080300@namesys.com> <20030131123943.GH15359@marowsky-bree.de> <20030131160624.A12036@namesys.com> <1044021310.15684.154.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12581-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1044021310.15684.154.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Lars Marowsky-Bree <lmb@suse.de>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hello!

On Fri, Jan 31, 2003 at 08:55:11AM -0500, Chris Mason wrote:
> > > Woot? Mainline tends to crash under Oracle or SAP, for example, lacks drivers
> > > etc. Yeah, this is a problem, but don't bitch at the distros about it, but at
> > > the driver developers etc.
> > Distro kernels tend to crash in unusual places, too.
> > E.g. SuSE 8.1 default kernel breaking under memory pressure.
> > RedHat 8.0 default kernel with slow block devices and ext3 bugs.
> > And so on.
> The simple truth is that all kernels have bugs.  In general, I believe

That's true.

> the distro kernels are more suitable for production use than a vanilla
> kernel.  These companies are betting their support time and future

This is questionable. Distro's QA cannot just test all possible patterns.
So there are some kinds of usage (even in production) where vanilla
kernel is the best thing to use (at least until vendor releases an errata
kernel).

> revenue on their kernels working properly, and the distros take that
> very seriously.

That's true.

> The fact that nobody actually ships a vanilla kernel should make it
> pretty clear the stock releases are not ready for the tasks our

Well, I provided an example of people who ship vanilla kernels.

> customers need them for.  The fact that our customers pay us to add
> patches instead of using the stock kernel for free is also important.

That's true.

> This doesn't make it a good idea to run rhas 2.4.9 based kernel in
> production with reiserfs, they were not horribly focused on reiserfs,
> especially when rhas came out.

Actually, I remember I once reviewed a patchset for Red Hat's
kernel-2.4.x-yy.src.rpm, and it contained patch-2.4.18-acZZ.bz2,
that somehow suggests they had it up to 2.4.18 at least ;)
But of course no warrany on that can be gived for some random kernel
until all of patches applied to its vanilla counterpart were reviewed.

(and, of course, RedHat is actually cares much more about ext3.)

Bye,
    Oleg
