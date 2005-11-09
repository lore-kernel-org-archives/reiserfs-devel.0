From: rvalles <rvalles@es.gnu.org>
Subject: Re: SOLVED: reiser4 in 2.6.14 - lockups with mmapped files
Date: Wed, 9 Nov 2005 01:21:58 +0100
Message-ID: <44957.4353210211$1131495856@news.gmane.org>
References: <1130860221.12859.23.camel@laptop> <1131138753.14425.2.camel@laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <reiserfs-list-return-26818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1131138753.14425.2.camel@laptop>
Sender: <tux@148.Red-217-126-33.pooles.rima-tde.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 04, 2005 at 10:12:34PM +0100, Fionn Behrens wrote:
> > it looks like any time any mmapped file is synced to a reiser4
> > partition, the process who tries to do that will freeze forever.
> The archck patch maintainer released an update which no longer exhibits
> the problem. After several hours of run time and some stress tests I
> didnt experience a problem so far.
> 					Fionn
If you are refering to 2.6.14-arckck3, I tried it and it doesn't fix a
thing. Even more, it triggers it more often, probably related to it's
agressivity against cache (swap prefetch, less tendency to swap, etc.).

I'm back with 2.6.12, waiting for a 2.6.14 patch I can work with.

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDcUEmrD81VR3MDtoRAgStAJ9sVUJhFjU3zjRMLQZ4cGzFWyjougCfXjmZ
RgiPL6eUt/1bxQfgnSdDnEY=
=UdQd
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
