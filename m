From: Christophe Saout <christophe@saout.de>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Thu, 26 Aug 2004 15:17:53 +0200
Message-ID: <1093526273.11694.8.camel@leto.cs.pocnet.net>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com>
	 <20040826014542.4bfe7cc3.akpm@osdl.org>
	 <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de>
	 <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-N5PVJ+R2JfuFy+q/oFHa"
Return-path: <reiserfs-list-return-20663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826130718.GB820@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

--=-N5PVJ+R2JfuFy+q/oFHa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 15:07 +0200 schrieb Christoph Hellwig:

> > Why? The question was what these plugins are exactly. This is the
> > answer.
>=20
> I explained it below..

It's hard to talk to you if you're not even trying to understand what
I'm trying to say. Andrew wanted to know what these plugins are. I tried
to give an answer and then you come along to tell me that it's not
relevant. Sure, Linux doesn't care about what the filesystem does
internally but Andrew wanted to know that.

> > Are you actually listening? If you implement a filesystem there's a
> > place where you have to implement the Linux VFS methods. I'm talking
> > about inode_operations and these things. This has nothing to do with
> > doing anything outside the Linux VFS. And I'm not talking about these
> > metas either. These really don't belong inside the filesystem.
>=20
> as I wrote in this mail this absolutely _does_ belong in the filesystem,
> it's a major part of it and isn't easily separatable.

Huh?

Now you're completely confusing me.

First you say that that file-as-a-directory is crap then you say that it
does belong into the filesystem?

I'll try again:

inode_operations, etc... are implemented as a "reiser4 plugin". This
means that reiser4 is usable as filesystem, you can store files in a
directory hierarchy. There's absolute nothing special here. Absolutely
nothing. And yes, reiser4 plugins are invisible from the VFS. It looks
like a normal filesystem because it behaves like one.

The "metas" I was referring in the second part are this file-as-a-
directory thing. These don't belong in the filesystem and should
therefore be removed.

The latter doesn't necessarily have anything to do with plugins.
The plugins are plugins for the storage layer, not for some semantic
enhancement.

Note that I changed the topic to avoid further confusion.


--=-N5PVJ+R2JfuFy+q/oFHa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLeMBZCYBcts5dM0RAmH8AJ4/Bc1fsd97cpl8zU1elKecgMBfywCeMkZi
Hzq/IxHhZWLE0iSThBFMmZc=
=hj5U
-----END PGP SIGNATURE-----

--=-N5PVJ+R2JfuFy+q/oFHa--

