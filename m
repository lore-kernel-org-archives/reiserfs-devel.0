From: Tonnerre <tonnerre@thundrix.ch>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Mon, 6 Sep 2004 10:04:24 +0200
Message-ID: <20040906080424.GC28697@thundrix.ch>
References: <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <20040902220242.GA5414@janus> <20040902220640.GE23987@parcelfarce.linux.theplanet.co.uk> <20040902221133.GB5414@janus> <20040902221722.GF23987@parcelfarce.linux.theplanet.co.uk> <20040902222650.GA5523@janus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Return-path: <reiserfs-list-return-21497-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040902222650.GA5523@janus>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Frank van Maarseveen <frankvm@xs4all.nl>
Cc: viro@parcelfarce.linux.theplanet.co.uk, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Salut,

On Fri, Sep 03, 2004 at 12:26:50AM +0200, Frank van Maarseveen wrote:
> Try a "make tags;grep SUPER_MAGIC tags".
> Or is it there for a different purpose?

Problem is:

There are  cool superblock magics  for reiserfs. And for  ext[23]. And
even for good old Minix. Cool.

However,  there  are   also  ugly  file  systems,  such   as  fat  for
example. Fat has been defined as  "something that can be read by a fat
driver", which  can be pretty  much anything. You can't  really detect
whether it is fat. Even Microsoft only guess whether some FS is fat or
not.

And don't  say detect it  via a partition  table.  There are a  lot of
cases where you get absolutely no  or wrong information out of it, and
there are also lots of cases where you plainly have none.

			    Tonnerre

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.2 (GNU/Linux)

iD8DBQFBPBoI/4bL7ovhw40RAgPmAJ0eM6NfPMARRJhHfd+vIXP+6+UAQgCgpUl/
5tX5B0VUa6gBMKZKdIjycec=
=KbEr
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
