From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs on redhat advanced server?
Date: 31 Jan 2003 09:37:08 -0500
Message-ID: <1044023828.15685.195.camel@tiny.suse.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>
	 <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>
	 <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de>
	 <3E3A67AE.4050601@namesys.com> <20030131122147.GE15359@marowsky-bree.de>
	 <3E3A6D76.7080300@namesys.com> <20030131123943.GH15359@marowsky-bree.de>
	 <20030131160624.A12036@namesys.com>
	 <1044021310.15684.154.camel@tiny.suse.com>  <3E3A8515.5010701@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3A8515.5010701@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Lars Marowsky-Bree <lmb@suse.de>, reiserfs-list@namesys.com

On Fri, 2003-01-31 at 09:15, Hans Reiser wrote:

> > In general, I believe
> >the distro kernels are more suitable for production use than a vanilla
> >kernel.  These companies are betting their support time and future
> >revenue on their kernels working properly, and the distros take that
> >very seriously.
> >
> and Marcelo does not have his reputation bet on it?
> 

Not in the same way.  If there's a bug in 2.4.20, he fixes it in
2.4.21-preX, he might even release 2.4.21 right away with just a single
fix.  If there's a bug in a vendor kernel, it is burnt forever onto a
cd, and we have to support everyone afflicted by it.

When the vendor screws up, they risk their revenue and the paychecks of
every employee.

Clearly we won't convince each other ;-)  The cool part about linux is
that we don't have to.

-chris


