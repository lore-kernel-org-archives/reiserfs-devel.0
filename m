From: Bennett Todd <bet@rahul.net>
Subject: Re: user-space cmd/lib to compute hash filename ordering?
Date: Thu, 11 Sep 2003 09:16:40 -0400
Message-ID: <20030911131640.GA556@rahul.net>
References: <20030910140451.GB6663@rahul.net> <1063264669.29645.4.camel@haron.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <reiserfs-list-return-15629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1063264669.29645.4.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list@namesys.com

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2003-09-11T03:17:49 Yury Umanets:
> If you are interested, I will find out details.

Thanks anyway, I get the message that a stock, standard distro of
ReiserFS doesn't have a single, consistent way to lay hands on the
available hashes for purposes like this, so if I do ever do it, I'll
be making my tool dependent on the ReiserFS dev tooling.

If someone wanted to enhance ReiserFS to make this job easier for
people, I've got a recommendation: include a reiserfs_hashsort
filter, reads a list of full pathnames from stdin, takes a hash name
as a cmdline arg, and prints the files sorted according to that
hash; slap that between the find that generates filenames and the
cpio that packs 'em, and you get a ReiserFS-tuned archive order.

I may pursue doing that eventually, but it's somewhere pretty far
down on my priority list at the moment. In other words, if it had
been there, I'd have used it, but it'll take me a while to get
around to coding it up myself.

Thanks again for the very helpful answer --- "no, what you want
isn't there, here's how you'd go about constructing it" is every bit
as valuable as "yes, here's where to find it". Maybe even more so,
negative answers are harder to research.

-Bennett

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/YHW3HZWg9mCTffwRAn9/AJwIbjb18krb5x91T52Db6XJx5mRAACcDWXF
uI8WnnTpBgIcBJNws2kYnK4=
=ujKh
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
