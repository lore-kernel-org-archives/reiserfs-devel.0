From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:27:21 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261625180.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com>
 <Pine.LNX.4.58.0408261315110.2304@ppc970.osdl.org> <412E69D2.50503@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20841-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412E69D2.50503@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Hans Reiser wrote:
>
> Linus Torvalds wrote:
> >
> >For example, it's likely that most filesystems would _not_ allow linking 
> >of a named stream anywhere else.
>
> Why?  It is just a file that inherits its stat data and is referenced by 
> a concatenation method of its parent directory.  The link will also 
> inherit its stat data from the original parent directory.

In reiser4, maybe. Not in general. Look at what other filesystems do for 
attributes..

> > And you might not be able to change the 
> >permissions or date on the named stream either, since it may or may not 
> >have a separate date/permission thing from the container.
>
> You should be able to change the permission and data, but when you 
> change it, you change it for the whole container.

Why? I'd much rather disallow it, than allow it and then have "nonlocal" 
effects.

I can also see a filesystem validly having _extra_ permissions (ie apart
from the container) on it too.

Not all the world is reiser4. 

		Linus
