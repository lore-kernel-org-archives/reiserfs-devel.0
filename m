From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:18:49 +0200
Message-ID: <1093522729.9004.40.camel@leto.cs.pocnet.net>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com>
	 <20040826014542.4bfe7cc3.akpm@osdl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-AFOTBO6G6hfP8GYc74VA"
Return-path: <reiserfs-list-return-20649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826014542.4bfe7cc3.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@osdl.org>
Cc: Hans Reiser <reiser@namesys.com>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

--=-AFOTBO6G6hfP8GYc74VA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 01:45 -0700 schrieb Andrew Morton:

> And describe the "plugin" system.  Why does the filesystem need such a
> thing (other filesystems get their features via `patch -p1')?

Ok, let me try. (Hans, please don't shoot me if I don't get every detail
right, I'm trying to simplify and translate)

The reiser4 core is just a big and fast storage layer using a single
tree. It is bound to a mount point and uses the page cache to manage its
memory. The only thing it can do on its own is to flush dirty data to
the disk when the VM wants to (memory pressure) or the VFS wants to
(unmount, sync) or some "plugin" wants to.
Additionally it's completely atomic (with respect to crashes, no
isolation like in databases), comparable to data=3Djournal but without the
overhead of using a journal for everything.

Up to this point there are no users of this "database" and it does not
implement any of the VFS methods for a filesystem (except mount and
unmount perhaps).

All the functionality is provided to the plugins. You can insert,
remove, lookup or modify key:object pairs (with an index into the
object). The object is a sequence of units. For files a unit would be 1
byte and the index would be the byte offset. For directories the unit
would be 1 entry and the index would be the filename.

Now there are some plugins that define how the storage layout on the
disk is (some kind of "backend" plugins).

*And* there are plugins which are users of the "reiser4 client API" and
implement the actual VFS methods.

There's a UNIX directory plugin and a UNIX file plugin.

Directories, inodes and file content are just key:object pairs and the
plugins know how to operate on these.

There's a new plugin in work that also implements UNIX file semantics
but stores the data for that file encrypted and/or compressed.

These plugins live between the VFS and the storage layer.

Just like the filesystems live between the VFS and the block layer (Hans
would say that filesystems are VFS plugins ;-)).

> And what are the licensing implications of plugins?  Are they derived
> works?  Must they be GPL'ed?

I suppose yes, at least currently, since they can only be linked with
reiser4, there's no module infrastructure.


--=-AFOTBO6G6hfP8GYc74VA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLdUpZCYBcts5dM0RAp6QAJ47X2kELIINGF8Zq4PPVk1JyfieTQCgn8OL
rdb2KedCuTkgjd06EALHb3M=
=InlD
-----END PGP SIGNATURE-----

--=-AFOTBO6G6hfP8GYc74VA--

