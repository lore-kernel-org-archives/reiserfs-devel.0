From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs on redhat advanced server?
Date: 31 Jan 2003 10:22:14 -0500
Message-ID: <1044026534.15685.220.camel@tiny.suse.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>
	 <1044021310.15684.154.camel@tiny.suse.com> <3E3A8515.5010701@namesys.com>
	 <200301311600.42194.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301311600.42194.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS <reiserfs-list@namesys.com>

On Fri, 2003-01-31 at 10:00, Russell Coker wrote:
> On Fri, 31 Jan 2003 15:15, Hans Reiser wrote:
> > >The fact that nobody actually ships a vanilla kernel should make it
> > >pretty clear the stock releases are not ready for the tasks our
> > >customers need them for.
> >
> > This is not clear to me at all.
> 
> I agree.  I have fairly vanilla 2.4.20 kernels running high performance mail 
> servers and other tasks on ReiserFS.  The only patches I have are LSM and a 
> patch one of the ReiserFS developers pointed me to for performance.
> 

A highly qualified admin can go out and find the small number of patches
their configuration really needs, and this will always be smaller than
the list of patches a distro includes (BTW, I thought you also needed
block-highmem?)

Most people don't have the time or energy to manage that however.

-chris


