From: Valdis.Kletnieks@vt.edu
Subject: Re: Feature request: online fsync disable
Date: Mon, 26 Aug 2002 02:02:25 -0400
Message-ID: <200208260602.g7Q62PRK012562@turing-police.cc.vt.edu>
References: <3D661C89.C8A805D7@baldauf.org> <15718.8710.244926.960377@laputa.namesys.com> <20020823155658.A962@namesys.com> <3D6623BE.4040500@namesys.com> <15718.9718.736822.978374@laputa.namesys.com> <1030108119.17778.8.camel@tiny> <3D667A7D.5BD60783@baldauf.org>
            <m3hehiskgw.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-980942592P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11319-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 25 Aug 2002 23:21:35 +0200."
             <m3hehiskgw.fsf@merlin.emma.line.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

--==_Exmh_-980942592P
Content-Type: text/plain; charset=us-ascii

On Sun, 25 Aug 2002 23:21:35 +0200, Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>  said:

> So don't call fsync(), or call it less frequently.

This is, of course, assuming that you have any actual control over the
matter.  Very few sites actually control their low-level database code,
as it's something that's fiendishly difficult to do well.  As a result,
you have two major trends:

1) You run Oracle or Sleepycat or some SQL product, and don't have much
control over when the fsync's get done (or even worse, you're using some
fourth-party package that *itself* calls Oracle or Sleepycat or...).

2) Said products (at least the good ones) have probably already had most
of the truly egregious abuses of fsync() optimized out, so there isn't
much win to trying to optimize further...

(And yes, I *know* Oracle can be configured to use raw disk partitions.
That doesn't change the underlying logic above) 
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-980942592P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9acRwcC3lWbTT17ARAotLAKD1HPoEbgM0alADDUNmSNbnONMHAwCfYmbt
+jceiLICg08TcVii5+uceFQ=
=v9/K
-----END PGP SIGNATURE-----

--==_Exmh_-980942592P--
