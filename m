From: Christoph Hellwig <hch@lst.de>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Thu, 26 Aug 2004 15:24:39 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040826132439.GA1188@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1093526273.11694.8.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christophe Saout <christophe@saout.de>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 03:17:53PM +0200, Christophe Saout wrote:
> It's hard to talk to you if you're not even trying to understand what
> I'm trying to say. Andrew wanted to know what these plugins are. I tr=
ied
> to give an answer and then you come along to tell me that it's not
> relevant. Sure, Linux doesn't care about what the filesystem does
> internally but Andrew wanted to know that.

Huh?  I don understand what reiser4 plugins are, and I tell you that a
subset of these are _wrong_ for use in the kernel.=20

> > > Are you actually listening? If you implement a filesystem there's=
 a
> > > place where you have to implement the Linux VFS methods. I'm talk=
ing
> > > about inode_operations and these things. This has nothing to do w=
ith
> > > doing anything outside the Linux VFS. And I'm not talking about t=
hese
> > > metas either. These really don't belong inside the filesystem.
> >=20
> > as I wrote in this mail this absolutely _does_ belong in the filesy=
stem,
> > it's a major part of it and isn't easily separatable.
>=20
> Huh?
>=20
> Now you're completely confusing me.
>=20
> First you say that that file-as-a-directory is crap then you say that=
 it
> does belong into the filesystem?

I think you're talking about something different then me, I'm not
talking about the magic meta files but the VFS interface in general.

This VFS interface is an integral part of =E6very filesystem, and it
doesn't make a whole lot to put it into a plugin.  If you want your
filesystem core portable it does to a certain extent make sense to
abstract them out, but as someone who's worked on a few such 'portable'
filesystems I can tell you that it doesn't work out as expected.

> I'll try again:
>=20
> inode_operations, etc... are implemented as a "reiser4 plugin". This
> means that reiser4 is usable as filesystem, you can store files in a
> directory hierarchy. There's absolute nothing special here. Absolutel=
y
> nothing. And yes, reiser4 plugins are invisible from the VFS. It look=
s
> like a normal filesystem because it behaves like one.

Now kill the whole plugin mess and let them talk directly to another.
My first mail explained to you why it doesn't make sense to have
multiple such plugins to work on a common subset of data.

> The latter doesn't necessarily have anything to do with plugins.
> The plugins are plugins for the storage layer, not for some semantic
> enhancement.

Again plugins below the pagecache (if that's what you call the "storage
layer") _do_ make sense.  plugins at the semantic layer don't.

-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
