From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 19:31:49 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408291919450.2295@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
  <412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com> 
 <20040829150231.GE9471@alias> <4132205A.9080505@namesys.com> 
 <20040829183629.GP21964@parcelfarce.linux.theplanet.co.uk> 
 <20040829185744.GQ21964@parcelfarce.linux.theplanet.co.uk> 
 <41323751.5000607@namesys.com>  <20040829212700.GA16297@parcelfarce.linux.theplanet.co.uk>
  <Pine.LNX.4.58.0408291431070.2295@ppc970.osdl.org> 
 <1093821430.8099.49.camel@lade.trondhjem.org>  <Pine.LNX.4.58.0408291641070.2295@ppc970.osdl.org>
 <1093830135.8099.181.camel@lade.trondhjem.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21097-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093830135.8099.181.camel@lade.trondhjem.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Alexander Viro <viro@parcelfarce.linux.theplanet.co.uk>, Hans Reiser <reiser@namesys.com>, flx@msu.ru, Paul Jackson <pj@sgi.com>, riel@redhat.com, ninja@slaphack.com, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Sun, 29 Aug 2004, Trond Myklebust wrote:
> 
> Well, yes there has to be a distinction between a true bind mount which
> actually covers the file or directory, and something like the stream
> "bind mount" which doesn't.
> 
> The stream "bind mount" is just there to allow you to root the
> attributes in a single tree. It can be made functionally entirely
> equivalent to the openat(), but uses pathname semantics (e.g., "//") to
> denote the attribute fork instead of an extra function call.

Using '//' would be nice, but would break real apps. If I remember
correctly, POSIX specifies that '//' can be special at the _beginning_ of
a path, but in the middle, it has to act like a single '/'.

And that's not just theory - it's quite common for programs to just 
concatenate a directory name (which may or may not end with a slash) with 
another path-name that starts with a slash. So you _will_ see existing 
scripts and programs using things like "/usr/include//sys/type.h", and 
they'd break if "//" would switch from "regular namespace" to "attribute 
namespace".

So I don't see any way to extend pathname semantics to distinguish between 
"directory contents" and "directory attribute stream". 

> > It's easy enough to do the graph detection at the VFS layer, exactly 
> > because of the density of the dentry graph. 
> 
> Don't you end up having to lock the entire paths b/c/d and a/e/f in
> order to prevent "ln a b/c/d/a; ln b a/e/f/b"?

That's not the problem - since it's in memory, we can just get the dcache 
lock, and do it locked for t least local filesystems.

However, being prodded by Andries, I think I'm wrong _anyway_. Since the
dcache is only "dense" down one path to the root, and doesn't contain all
the alternate ways of getting to a particular directory, I came to the
conclusion that the VFS layer can't actually do cyclic detection after
all...

So together with the fact that nobody really _wants_ hardlinks to 
directories, I think the right answer is "no". It's not a problem as long 
as the attributes streams are always tied to the file/directory they are 
attributes of - then the "directory link" is really just a file link, and 
can't cause any cycles.

> >  - how to actually test this out in practice (ie getting reiser4 to do the
> >    proper thing wrt the VFS layer, but preferably _also_ having another
> >    filesystem like NFSv4 or cifs that actually uses this and shows what
> >    the problems are).
> 
> As I said, NFSv4 can be made ready pretty quickly: Bruce is already
> finishing up the xattr implementation.

Do we have any servers that implement it? I think NFSv4 might be a good 
test-case if so.

> >  - whether it makes any sense at all unless we also make at least a few 
> >    other filesystems support it, so that people start using it as an 
> >    "expected feature" rather than a "works only on a couple of machines".
> 
> NTFS? ;-)

Hey, I see the smiley, but I'd still like to point out that not many 
people use it under Linux, and while I think writing to it might be stable 
these days, I don't believe named streams are necessarily going to 
materialize all that quickly..

		Linus
