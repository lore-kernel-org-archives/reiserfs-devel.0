From: Bennett Todd <bet@rahul.net>
Subject: Re: Status of fsync() wrt mail servers
Date: Wed, 10 Sep 2003 06:51:02 -0400
Message-ID: <20030910105102.GA535@rahul.net>
References: <20030910002953.C14172@unbeatenpath.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <reiserfs-list-return-15617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030910002953.C14172@unbeatenpath.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2003-09-10T01:29:53 lists@unbeatenpath.net:
> I'm in the process of researching OSes and filesystems for a new mail
> system.  I'm hoping to use linux+reiserfs+postfix, and I'm wondering
> where reiserfs stands wrt to fsync().  Does reiserfs provide a mechanism
> to have truly synchronous writes with a single fsync() call?  Thanks

I'm not really fond of the phrase "truly synchronous writes"; it can
be read different ways by different people.

What postfix demands (if you wish to adhere strictly to some
peoples' interpretations of RFCs) is that when fsync returns, the
filesystem guarantees that even if there's a crash an instant after,
the file, data as well as metadata, will be intact when the machine
comes up again. This is in support of a desire to positively commit
to the sender that the receiving MTA has accepted receipt for a
message.

-Bennett

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/XwIVHZWg9mCTffwRAtm4AJ9rDWnL37oalKqq95qWk+C9ZITAzACeOlLD
/cTBDwCMcjIoMgXVy4++hLY=
=EUmT
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
