From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: metadata plugins (was Re: the " 'official' point of view"
	expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Fri, 28 Jul 2006 14:32:03 -0700
Message-ID: <1154122323.18406.22.camel@ipso.snappymail.ca>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl>
	 <44CA31D2.70203@slaphack.com>
	 <Pine.LNX.4.64.0607280859380.4168@g5.osdl.org>
	 <44C9FB93.9040201@namesys.com> <44CA6905.4050002@slaphack.com>
	 <44CA126C.7050403@namesys.com>  <op.tde267fpd4os1z@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-eo5zDGI9Hrn4ojQLKMUN"
Return-path: <reiserfs-list-return-29242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.tde267fpd4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?Q?=C5=81ukasz?= Mierzwa <prymitive@pcserwis.net>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--=-eo5zDGI9Hrn4ojQLKMUN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-07-28 at 22:58 +0200, =C5=81ukasz Mierzwa wrote:
> It just hited me that 90% of mails (those I've read and remember) in whic=
h =20
> You guys are talking why r4 should or should not be merged did not contai=
n =20
> a patch or not even a line of code as a reference, most of complains feel=
s =20
> so abstract and ahead of time, there is nothing wrong with planing ahead =
=20
> but does it still makes sense when nobody else actually said that he woul=
d =20
> want to use it in future? Can't it be pusshed up to vfs later if it prove=
s =20
> itself and there is demand for it?
> My question is what does it break now? It's been in mm for some time now,=
 =20
> what troubles does it couse? Did anyone complained that it breaks mm and =
=20
> should be dropped?
> I'm just a end user and have no idea of linux internals, but all the fuzz=
 =20
> about r4 seems so political and it's not just me who things so.

Agreed. As an outsider looking in trying to understand this all, it
sounds like Hans can't win either way. People complain if the plugin
code is contained entirely within Reiser4 and people complain if he
tries to add functionality to the VFS that only Reiser4 will likely use
for the foreseeable future. Or maybe ever use, we don't know yet?

Ignoring pseudo files which Hans has pulled for now anyways, what
difference is their between Reiser4 plugins and what EXT3 does with
mount options like dir_index? 3rd party plugins can't be dynamically
loaded, and some of them need mount options to enable them even after
they are compiled in. So people can't "mistakenly" load some plugin that
corrupts their data, or changes the on-disk format making it impossible
to downgrade kernel versions.

Is it the fact that Reiser4 plugins can be enabled/disable on a per file
basis?

If you don't use the word "plugin", how is adding dir_index code to EXT3
any different then adding encryption/compression code to Reiser4?

--=20
Mike Benoit <ipso@snappymail.ca>

--=-eo5zDGI9Hrn4ojQLKMUN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEyoJRMhKjsejwBhgRAjR1AKCHYVV7/OnioC8REmk6Za99ewtePACfW2HR
FKwh3i9XR5c46StV6hp8jHQ=
=4t1e
-----END PGP SIGNATURE-----

--=-eo5zDGI9Hrn4ojQLKMUN--

