From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 18:03:06 +0200
Message-ID: <20040826160306.GA4326@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <20040826144422.GD5733@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20708-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826144422.GD5733@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

> Firstly, the core library _is_ used by different projects.  That's the
> commercial aim of reiser4: to be used by projects other than just as
> Linux filesystem.  For example it might be used by a database, or a
> portable application which needs to store structured data in a flat
> file (with random access).  A good abstraction makes it more useful
> than "just" a filesystem.

Which is okay as long as it still fits in the kernel.  Remember that
lots of projects had to adjust so far despite the commerical aims of
their creators.

> I think the disagreement between you two comes down to the idea that a
> generally useful API abstraction to file-like objects really should be
> somewhere in the VFS, and not specific to a single filesystem.

IT should, and in fact it actually is most of the part.  We can have
differnt operation vectors per object, but reiser4 is the only
filesystem in the tree not making use of that but provinding only a
single one and then dispatching internally.  Even XFS that carries
around and horrible internal dispatching layer as IRIX legacy gets
this right.

> Unfortunately, the problem is that reiser4 is the only filesystem
> which is _technically capable_ of implementing that abstraction in a
> practical way, apparently.  (I'm not sure if this is really true.
> reiser4's object model is not the same as paths and inodes, but the
> impedance mismatch doesn't seem huge.)

Umm, no.  In fact every filesystem does this.  There's not too many
objects with different namespace semantic: regular files and special
files vs directories vs symlinks basically, but as soon as you go to the
data patch you can have hundrets of different file_operations on a
single filesystems (for special files).

