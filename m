From: Bennett Todd <bet@rahul.net>
Subject: Re: secure delete?
Date: Fri, 19 Mar 2004 17:54:03 +0000
Message-ID: <20040319175403.GA2273@rahul.net>
References: <1079691239.5767.7.camel@pear.st-and.ac.uk> <405AD31A.7070304@mweb.co.za> <20040319110748.GA30491@chihiro.cern.ch> <405AD9B5.80102@namesys.com> <1079697068.5812.13.camel@pear.st-and.ac.uk> <87u10k4ydq.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <reiserfs-list-return-17329-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87u10k4ydq.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> [...] I'm using encrypted swap, and I'm not experiencing any
> noticeable performance hits. But I have sufficient RAM (374MB) so
> it doesn't swap often.

Not to imply that anybody here doesn't already know this, but just a
general comment: no matter how much memory you have, it's always a
good idea to have at least some swap allocated.

Besides allowing VM to grow past real memory via serious paging,
which as you say has depressing performance, some swap is also good
because it lets the OS page out VM that's really unused. No matter
how much memory you have, this is good for performance, because
Linux is _terrific_ at making productive use of all leftover RAM for
disk buffering.

I generally allocate 128MB for swap no matter how much memory I
have, but then I don't run X, and run an absolutely minimized list
of daemons. On an untuned system with X and a big horkin' desktop,
I'd probably fling a gig of swap at it just to help make sure that
all those zillions of unused daemons can get the heck out of my RAM.

-Bennett

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQFAWzO6HZWg9mCTffwRAgIrAJ4zMV8xsBLxnjqhBDefFM5julKCKwCfXpG/
uSWSSrl6po93ZFp/2TjUvSE=
=KMWL
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
