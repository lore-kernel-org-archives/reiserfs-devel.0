From: Bennett Todd <bet@rahul.net>
Subject: Re: some basic questions
Date: Wed, 5 Nov 2003 11:08:01 -0500
Message-ID: <20031105160801.GD548@rahul.net>
References: <1067880381.17873.9.camel@redeeman.linux.dk> <1068044839.32072.0.camel@redeeman.linux.dk> <3FA91326.2060407@gmx.net> <1068047082.32079.2.camel@redeeman.linux.dk> <16297.7138.770007.332337@laputa.namesys.com> <1068047560.32072.6.camel@redeeman.linux.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Return-path: <reiserfs-list-return-15985-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1068047560.32072.6.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Redeeman <redeeman@metanurb.dk>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2003-11-05T10:52:40 Redeeman:
> will reiser4 be the most secure filesystem if the power dies,
> because i live in denmark, and not in the city, so the power dies
> quite often, and i want my data to be secure :)

Once Reiser4 is stable and mature, it should be on the short list of
the very best filesystems in this regard.

However, if you want something today, I recommend ext3.

Reiserfs4 should, we hope, eat its lunch eventually. But ext3
performs quite well, for the sort of simple stuff you want to do it
should be fine (and vastly better than vfat). And ext3 right now has
pretty mature and stable journaling, that in my experience leaves it
effectively crashproof. Or at least highly crash-resistent.

-Bennett

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/qSBhHZWg9mCTffwRAnWnAKCMGHneOSKtJm0vSTHIfu6HVQrzEQCfSIvG
hD2fjlgjCNQbFNzgI0Ku1G8=
=Pwyb
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
