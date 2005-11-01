From: Fionn Behrens <fionn@spamfilter.de>
Subject: Re: reiser4 in 2.6.14 - lockups with mmapped files
Date: Tue, 01 Nov 2005 18:41:08 +0100
Message-ID: <1130866868.12859.36.camel@laptop>
References: <1130860221.12859.23.camel@laptop>  <436796F6.10603@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-a3unj2PowScvLtTJGWCm"
Return-path: <reiserfs-list-return-26759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <436796F6.10603@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-a3unj2PowScvLtTJGWCm
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Di, 2005-11-01 at 19:25 +0300, Vladimir V. Saveliev wrote:

> Fionn Behrens wrote:
> > Unfortunately I once more hit the wall and was forced to go back to
> > 2.6.11 (including another --build-fs run to regain compatibility with
> > the old but working reiser4 drivers). I wish there was a mount option t=
o
> > exclude the new extensions so I can test new kernels without losing hal=
f
> > a day for fscking when things get whacky.

> Did fsck.reiser4 say you that you have to --build-fs?

Yes, after I went back to 2.6.11 I tried "--fix" first but it said
indeed that I have to "--build-fs" and so I did.

> > But now it looks like any time any mmapped file is synced to a reiser4
> > partition, the process who tries to do that will freeze forever. In
>=20
> Can you please check what fs/reiser4/reiser4.h:REISER4_USE_EFLUSH is set =
to?
> If it is 0, please try your test having it set to 1.

It is set to 0. I changed it to 1. What is the supposed result of this
change?
I am somewhat reluctant to try it and risk yet another two hours of
fschecking. Maybe tomorrow night. If it doesnt work again, I'll get you
some screenshots of the fscheck, too.

> If the above does not help  - would you please set up either sereial cons=
ole or
> netconsole and catch sysrq-T output with its help?

Would another "screenshot" do the trick as well?=20

br,
	Fionn
--=20
I believe we have been called by history to lead the world.
                                                 G.W. Bush, 2002-03-01


--=-a3unj2PowScvLtTJGWCm
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDZ6i0jkvYSI4bFywRAhE7AKCM3VsBEwscDQ9c0UD1XXjhuUTPwgCcCV35
tm3yK2s1vNFM9nJHlTD771c=
=hFAI
-----END PGP SIGNATURE-----

--=-a3unj2PowScvLtTJGWCm--


