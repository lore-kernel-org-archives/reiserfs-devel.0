From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs on redhat advanced server?
Date: 31 Jan 2003 08:55:11 -0500
Message-ID: <1044021310.15684.154.camel@tiny.suse.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>
	 <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>
	 <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de>
	 <3E3A67AE.4050601@namesys.com> <20030131122147.GE15359@marowsky-bree.de>
	 <3E3A6D76.7080300@namesys.com> <20030131123943.GH15359@marowsky-bree.de>
	 <20030131160624.A12036@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12579-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030131160624.A12036@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Lars Marowsky-Bree <lmb@suse.de>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Fri, 2003-01-31 at 08:06, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Jan 31, 2003 at 01:39:43PM +0100, Lars Marowsky-Bree wrote:
> 
> > Woot? Mainline tends to crash under Oracle or SAP, for example, lacks drivers
> > etc. Yeah, this is a problem, but don't bitch at the distros about it, but at
> > the driver developers etc.
> 
> Distro kernels tend to crash in unusual places, too.
> E.g. SuSE 8.1 default kernel breaking under memory pressure.
> RedHat 8.0 default kernel with slow block devices and ext3 bugs.
> And so on.

The simple truth is that all kernels have bugs.  In general, I believe
the distro kernels are more suitable for production use than a vanilla
kernel.  These companies are betting their support time and future
revenue on their kernels working properly, and the distros take that
very seriously.

The fact that nobody actually ships a vanilla kernel should make it
pretty clear the stock releases are not ready for the tasks our
customers need them for.  The fact that our customers pay us to add
patches instead of using the stock kernel for free is also important.

This doesn't make it a good idea to run rhas 2.4.9 based kernel in
production with reiserfs, they were not horribly focused on reiserfs,
especially when rhas came out.

-chris


