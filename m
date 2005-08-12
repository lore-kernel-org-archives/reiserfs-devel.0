From: gimpel <gimpel@sonnenkinder.org>
Subject: Re: reiser4 on 2.6.13-rc6-realtime-preempt
Date: Fri, 12 Aug 2005 22:40:44 +0200
Message-ID: <20050812224044.3ae4ebe2@SiRiUS.home>
References: <20050811224503.7dbd67dd@SiRiUS.home>
	<42FC665D.4030802@namesys.com>
	<42FCF097.9090205@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=Signature_Fri__12_Aug_2005_22_40_44_+0200_m5oHtY6MdzvqND2s;
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <reiserfs-list-return-25436-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FCF097.9090205@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

--Signature_Fri__12_Aug_2005_22_40_44_+0200_m5oHtY6MdzvqND2s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Aug 2005 13:55:19 -0500
David Masover <ninja@slaphack.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Vladimir V. Saveliev wrote:
> > Hello
>=20
> > reiser4 depends on several core kernel patches. I think you did not
> > apply them.
>=20
> What kind of symptoms would not applying them cause?  I grab patches
> from -mm, but only the ones with "reiser4" in the name.  They seem to
> work with minimal tweaking on my part, and no one said anything when I
> mentioned this before.  They do seem solid...
>=20
I think Vladimir is talking about the patches to the new inode
behaviour. I'm quite sure i checked the 2.6.13-rc4-mm patchlist about
the move-fs-to-new-behaviour-* patches etc. but maybe i should re-check
that. Currently I'm using 2.6.13-rc6-ck1 + reiser4 from 2.6.13-rc5-
mm1 and it works very well. So did -rc5 and -rc4. just wanted to give
new RTP patches a try.

But i don't want to steal the time of any devs here. It's more
important to get reiser4 merged to vanilla than spending time for a guy
who plays around with -rc kernels and -mm broken-out patches without
even the basic knowledge of C code to understand such compile errors.
 All i know that it maybe needs a 'select foo' somewhere or something.
It misses something...

But I'll just wait for stable 2.6.13 + RT and hopefully a reiser4
patch to it (or even r4 in vanilla? :)). If someone had known a quick
fix I would have been happy to continue testing around with RT etc, but
it's not worth to steal the time of the devs here :) sorry for bugging!

regards!
tom




--Signature_Fri__12_Aug_2005_22_40_44_+0200_m5oHtY6MdzvqND2s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFC/Qlc21TUzfKRUn4RAntgAKCZq5dmYONgDGuRNxvAwZVw4edePgCeJmC7
dyDNdAL0HZ2eEcJvlEOSAVQ=
=Qjmc
-----END PGP SIGNATURE-----

--Signature_Fri__12_Aug_2005_22_40_44_+0200_m5oHtY6MdzvqND2s--
