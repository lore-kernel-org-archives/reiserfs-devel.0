From: Christophe Saout <christophe@saout.de>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Thu, 26 Aug 2004 18:14:19 +0200
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <1093536859.5482.13.camel@leto.cs.pocnet.net>
References: <20040826124929.GA542@lst.de>
	 <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de>
	 <1093526273.11694.8.camel@leto.cs.pocnet.net>
	 <20040826132439.GA1188@lst.de>
	 <1093527307.11694.23.camel@leto.cs.pocnet.net>
	 <20040826134034.GA1470@lst.de>
	 <1093528683.11694.36.camel@leto.cs.pocnet.net>
	 <20040826153748.GA3700@lst.de> <1093535334.5482.1.camel@leto.cs.pocnet.net>
	 <20040826160601.GB4326@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-U2ANUOr/MfUPbPSXD9E8"
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S269144AbUHZQTI@vger.kernel.org>
In-Reply-To: <20040826160601.GB4326@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com


--=-U2ANUOr/MfUPbPSXD9E8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 18:06 +0200 schrieb Christoph Hellwig:

> Again, your confusing upper and lower plugins.  For things happening
> below the pagecache you could register different address_space
> operations which sometimes makes sense.  But you want e.g. different
> inode_operations for directories vs symlinks vs files.

Ok, I see your point. aops. Sorry.
Looking at the code this could be done. The wrappers that dispatch the
operations are really small and call the plugin that is registered with
the inode of the mapping. Instead it could have directly set the
corresponding operations. Right. The wrappers are doing a few things
before calling the plugin. That could be done the other way round too.
But that's more of an implementation issue and could still be changed.

> Please read through some linux filesystem code, okay :)

I'm partly familiar with that, I just either misunderstood you or wasn't
really thinking (probably the latter...).


--=-U2ANUOr/MfUPbPSXD9E8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLgxbZCYBcts5dM0RAtCjAJ9CcjaOWXhYVEpQBGRZfu868yjQmACfQAB8
KjPKjD4K93nNEpYYAnWQGJg=
=k/8e
-----END PGP SIGNATURE-----

--=-U2ANUOr/MfUPbPSXD9E8--
