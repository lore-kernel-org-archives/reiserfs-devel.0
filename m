From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 21:42:15 -0400
Sender: Trond Myklebust <trondmy@trondhjem.org>
Message-ID: <1093830135.8099.181.camel@lade.trondhjem.org>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
	 <412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com>
	 <20040829150231.GE9471@alias> <4132205A.9080505@namesys.com>
	 <20040829183629.GP21964@parcelfarce.linux.theplanet.co.uk>
	 <20040829185744.GQ21964@parcelfarce.linux.theplanet.co.uk>
	 <41323751.5000607@namesys.com>
	 <20040829212700.GA16297@parcelfarce.linux.theplanet.co.uk>
	 <Pine.LNX.4.58.0408291431070.2295@ppc970.osdl.org>
	 <1093821430.8099.49.camel@lade.trondhjem.org>
	 <Pine.LNX.4.58.0408291641070.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408291641070.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Alexander Viro <viro@parcelfarce.linux.theplanet.co.uk>, Hans Reiser <reiser@namesys.com>, flx@msu.ru, Paul Jackson <pj@sgi.com>, riel@redhat.com, ninja@slaphack.com, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

P=E5 su , 29/08/2004 klokka 19:54, skreiv Linus Torvalds:

> The problem really ends up being directories with attributes (where we
> can't just overmount the existing directory). That's where "openat()"=20
> helps us.=20

Well, yes there has to be a distinction between a true bind mount which
actually covers the file or directory, and something like the stream
"bind mount" which doesn't.

The stream "bind mount" is just there to allow you to root the
attributes in a single tree. It can be made functionally entirely
equivalent to the openat(), but uses pathname semantics (e.g., "//") to
denote the attribute fork instead of an extra function call.

> > Is it just the fantasy of supporting hard-links across "stream
> > boundaries" (as in "touch a b; ln b a/b; ln a b/a")? I'm pretty sure
> > nobody wants to have to add cyclic graph detection to their filesystems
> > anyway. 8-)
>=20
> It's easy enough to do the graph detection at the VFS layer, exactly=20
> because of the density of the dentry graph.=20

Don't you end up having to lock the entire paths b/c/d and a/e/f in
order to prevent "ln a b/c/d/a; ln b a/e/f/b"?

> > What other issues would need to be addressed?

>  - how to actually test this out in practice (ie getting reiser4 to do th=
e
>    proper thing wrt the VFS layer, but preferably _also_ having another
>    filesystem like NFSv4 or cifs that actually uses this and shows what
>    the problems are).

As I said, NFSv4 can be made ready pretty quickly: Bruce is already
finishing up the xattr implementation.

>  - whether it makes any sense at all unless we also make at least a few=20
>    other filesystems support it, so that people start using it as an=20
>    "expected feature" rather than a "works only on a couple of machines".

NTFS? ;-)

Cheers,
  Trond
