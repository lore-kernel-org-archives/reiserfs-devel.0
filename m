From: Hans Reiser <reiser@namesys.com>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Wed, 25 Aug 2004 23:31:53 -0700
Message-ID: <412D83D9.2050503@namesys.com>
References: <410D96DC.1060405@namesys.com> <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com> <20040825205618.GA7992@hockin.org> <412D0339.3080601@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20575-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412D0339.3080601@sun.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Waychison <Michael.Waychison@Sun.COM>
Cc: Tim Hockin <thockin@hockin.org>, Rik van Riel <riel@redhat.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Mike Waychison wrote:

> Tim Hockin wrote:
>
> >On Wed, Aug 25, 2004 at 04:25:24PM -0400, Rik van Riel wrote:
>
> >>>You can think of this as chroot on steroids.
> >>
> >>Sounds like what you want is pretty much the namespace stuff
> >>that has been in the kernel since the early 2.4 days.
> >>
> >>No need to replicate VFS functionality inside the filesystem.
>
>
> >When I was at Sun, we talked a lot about this.  Mike, does Sun have any
> >iterest in this?
>
>
> Not that I know of.  I believe the functionality Hans is looking for has
> already been handled by SELinux.

Everybody who takes a 3 minute read of SELinux keeps saying it has, but 
it hasn't quite, not when you look at the details.  SELinux is not 
written by filesystem folks, and there are scalability details that matter.

> What is needed (if it doesn't already
> exist) is a tool to gather these 'viewprints' automagically.

It doesn't exist, and viewprints are also not stored with executables 
either, so it is not process oriented.

People think the problem is allowing the OS to enact fine grained 
security.  It is not.  The problem is allowing the user to enact fine 
grained security, and without a lot of work to automate it, users will 
continue to be unable to bear that time cost.

>
> --
> Mike Waychison
> Sun Microsystems, Inc.
> 1 (650) 352-5299 voice
> 1 (416) 202-8336 voice
> http://www.sun.com
>
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> NOTICE:  The opinions expressed in this email are held by me,
> and may not represent the views of Sun Microsystems, Inc.
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

