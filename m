From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 3 Sep 2004 10:32:07 +0200
Message-ID: <2f4958ff04090301326e7302c1@mail.gmail.com>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com> <200408290004.i7T04DEO003646@localhost.localdomain> <20040901224513.GM31934@mail.shareable.org> <20040903082256.GA17629@kroah.com>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21414-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040903082256.GA17629@kroah.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <greg@kroah.com>
Cc: Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Fri, 3 Sep 2004 10:22:57 +0200, Greg KH <greg@kroah.com> wrote:
> On Wed, Sep 01, 2004 at 11:45:13PM +0100, Jamie Lokier wrote:
> > Horst von Brand wrote:
> > > What happened to "code talks, bullshit walks"?
> >
> > devfs is a fine example of why code isn't enough.  With devfs the code
> > came first, the >1 year of strategic bullshit politics from the "it's
> > not traditional unix" crowd came later, then it went in, then lots of
> > people used it, then it was replaced by something which still doesn't
> > work as well as 2.4 does with or without devfs, and people are still
> > using it despite it's faults.
> 
> What is udev's faults that have an issue with?
> 
> Yes, we don't do module autoloading when opening a device node, but
> that's well known, documented, and the way the kernel has evolved to
> anyway.

devfs was very natural, and simple solution. But to have it right, it
would have to be the only /dev filesystem.
But no, we like choices, so we have chaos. 
Udev is just another thing adding to that chaos.

Someone was numbering things that are good in BSD design, in that
thread. One of those things was going for devfs. No cheap solutions.
One fs for /dev. And it works great.

Sorry for bit of trolling.

-- 
GJ
