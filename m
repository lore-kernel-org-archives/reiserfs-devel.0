From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 17:00:53 +0100
Message-ID: <20040826160053.GI5733@mail.shareable.org>
References: <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com> <20040826140500.GA29965@fs.tum.de> <1093530313.11694.56.camel@leto.cs.pocnet.net> <20040826150434.GF5733@mail.shareable.org> <1093533175.11694.77.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093533175.11694.77.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Christophe Saout wrote:
> I'm just thinking about something. While you can't cut bytes out of unix
> iles a lot of filesystems can do this (holes). Most of them only on a
> block boundary, reiser4 on a byte boundary. If the filesystems could
> export this functionality using an enhanced API we could implement a
> compression plugin and other things on the VFS level that works with
> every filesystem supporting the required mechanisms, not only reiser4.
> And those features would take advantage of reiser4's storage mechanisms.
> I think Hans made the plugins reiser4-only because only reiser4 has a
> similar API at that time (and obviously because he didn't even think
> about doing it otherwise).

Yes.  In some cases the compression or re-archiving algorithm would
choose different parameters, depending on the alignment capabilities
of the underlying filesystem.  In some cases, that alignment is
"offset 0 is the only one you can have", which is a severe special
case where truncate and rewrite is required for changes.

> > By the way, can reiser4 share parts of files between different files?
> 
> At the moment a file is exactly one object. But someone could write
> another file plugin that spans a file across multiple objects, then yes,
> multiple files could share parts.

Nice.  That's useful for files which appear as themselves and also as
part of a container.

And also for revision managed filesystems :)

-- Jamie

