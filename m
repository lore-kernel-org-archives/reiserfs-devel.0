From: Tim Hockin <thockin@hockin.org>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Wed, 25 Aug 2004 13:56:18 -0700
Message-ID: <20040825205618.GA7992@hockin.org>
References: <410D96DC.1060405@namesys.com> <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20521-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Hans Reiser <reiser@namesys.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, michael.waychison@sun.com

On Wed, Aug 25, 2004 at 04:25:24PM -0400, Rik van Riel wrote:
> > You can think of this as chroot on steroids.
> 
> Sounds like what you want is pretty much the namespace stuff
> that has been in the kernel since the early 2.4 days.
> 
> No need to replicate VFS functionality inside the filesystem.

When I was at Sun, we talked a lot about this.  Mike, does Sun have any
iterest in this?

We found a lot of shortcomings in implementing various namespace-ish
things.

