From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 17:44:51 +0100
Message-ID: <20040826164451.GL5733@mail.shareable.org>
References: <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com> <1093536282.5482.6.camel@leto.cs.pocnet.net> <20040826160750.GC4326@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826160750.GC4326@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Rik van Riel <riel@redhat.com>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Christoph Hellwig wrote:
> or placing this into a userspace helper that the kernel can invoke
> transparently.

Yes, exactly this for most file formats.
Ideally, with _some_ user control over the handlers for their own
files a bit like Hurd.

Not just archive files: metadata pulled from audio files, images,
distro packages, etc.  In other words much the same as Gnome and KDE's
things, but with more emphasis on metadata extractors and efficient
on-disk cache interaction, and a sane page-cache coherency interface
(possibly FUSE).

Metadata extraction is useful for search and indexing purposes.
(That, and a way to hook change notifications up with indexers --
again comes with any proper coherency interface).

For new applications using a container, it's tempting to want one
format which is optimised for this.  But really many applications want
to write XML or compressed XML, or something else that isn't
especially efficient but is easy to work with on many OSes.  We should
support applications whatever format they need to work with, if
providing an interior view as a directory is useful for them.  (This
implies applications can introduce their own formats for files they
need to operate on.)  By the way, lazy updating of containers is an
even bigger advantage if you have to use XML as the flat format,
because the savings from not serialising when you don't need to are
more pronounced.

For some applications the "content" isn't structured in a way which
maps naturally to a plain archive file.  Hans' /etc/passwd is a simple
example: at least one of the "flat" representations, when there are
enough entries, probably ought to be a DB file for faster lookup.
(Though, it would be great if /etc/passwd could automagically get fast
lookup due to an automagic underlying representation, while still
appearing to be a flat file when you cat it).

Also, imagine "cd" into a MySQL table file.  It might just work.

By the way, we don't need containers to waste huge amounts of space
like the Microsoft Word "fast save" documents did.  Because our
containers are created on demand, there is no performance advantage in
them having unused holes, unlike the case were Word was saving changes
periodically.

-- Jamie

